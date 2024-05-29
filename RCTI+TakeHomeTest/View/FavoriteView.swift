//
//  FavoriteView.swift
//  RCTI+TakeHomeTest
//
//  Created by Abiyyu Firmansyah on 29/05/24.
//

import SwiftUI

struct FavoriteView: View {
    @Environment(\.managedObjectContext) private var moc
    @StateObject private var viewModel = FavoriteViewModel(moc: DataController.shared.container.viewContext)
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.videosFromAPI, id: \.self) { video in
                        NavigationLink(
                            destination: VideoDetailView(video: video, viewModel: VideoViewModel(moc: moc)),
                            label: {
                                VideoItemView(video: video)
                                    .padding(.vertical, 10)
                            })
                    }
                }
            }
            .onAppear {
                viewModel.fetchFavoriteVideos()
            }
            .navigationTitle("Favorite")
        }
    }
}

#Preview {
    FavoriteView()
}
