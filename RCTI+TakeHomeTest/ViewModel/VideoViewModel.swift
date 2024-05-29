//
//  VideoViewModel.swift
//  RCTI+TakeHomeTest
//
//  Created by Abiyyu Firmansyah on 29/05/24.
//

import Foundation
import CoreData

class VideoViewModel: ObservableObject {
    @Published var videos: [Video] = []
    private let moc: NSManagedObjectContext
    
    init(moc: NSManagedObjectContext) {
        self.moc = moc
    }

    func fetchData() async throws {
        let endPoint = "https://gist.github.com/poudyalanil/ca84582cbeb4fc123a13290a586da925/raw/videos.json"
        
        guard let url = URL(string: endPoint) else {
            print(ErrorResponse.invalidURL)
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print(ErrorResponse.invalidResponse)
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let videos = try decoder.decode([Video].self, from: data)
            DispatchQueue.main.async {
                self.videos = videos
            }
        } catch {
            print(ErrorResponse.invalidData)
        }
    }
    
    func addToFavorite(id: String, vidTitle: String) {
        let newFavorite = FavoriteVideos(context: moc)
        newFavorite.id = id
        newFavorite.title = vidTitle
        
        do {
            try moc.save()
        } catch {
            print("Failed to save favorite video: \(error.localizedDescription)")
        }
    }
}

enum ErrorResponse: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
