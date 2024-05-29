//
//  FavoriteViewModel.swift
//  RCTI+TakeHomeTest
//
//  Created by Abiyyu Firmansyah on 29/05/24.
//

import Foundation
import CoreData

class FavoriteViewModel: ObservableObject {
    @Published var favoriteVideos: [FavoriteVideos] = []
    @Published var videosFromAPI: [Video] = []
    private let moc: NSManagedObjectContext
    
    init(moc: NSManagedObjectContext) {
        self.moc = moc
    }

    func fetchFavoriteVideos() {
        let fetchRequest: NSFetchRequest<FavoriteVideos> = FavoriteVideos.fetchRequest()
        do {
            favoriteVideos = try moc.fetch(fetchRequest)
            fetchVideosFromAPI()
        } catch {
            print("Error fetching favorite videos: \(error.localizedDescription)")
        }
    }

    private func fetchVideosFromAPI() {
        let group = DispatchGroup()

        for favoriteVideo in favoriteVideos {
            guard let id = favoriteVideo.id, let title = favoriteVideo.title else {
                continue
            }
            group.enter()
            fetchDataForFavoriteVideo(id: id, title: title) {
                group.leave()
            }
        }
    }

    private func fetchDataForFavoriteVideo(id: String, title: String, completion: @escaping () -> Void) {
        let endPoint = "https://gist.github.com/poudyalanil/ca84582cbeb4fc123a13290a586da925/raw/videos.json"
        
        guard let url = URL(string: endPoint) else {
            completion()
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            defer {
                completion()
            }
            
            guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let videos = try decoder.decode([Video].self, from: data)
                
                let filteredVideos = videos.filter { $0.id == id && $0.title == title }
                
                DispatchQueue.main.async {
                    self.videosFromAPI.append(contentsOf: filteredVideos)
                }
            } catch {
                print("Error decoding API response: \(error.localizedDescription)")
            }
        }.resume()
    }
}
