//
//  VideoDetailView.swift
//  RCTI+TakeHomeTest
//
//  Created by Abiyyu Firmansyah on 29/05/24.
//

import SwiftUI
import AVKit

struct VideoDetailView: View {
    let video: Video
    @ObservedObject var viewModel: VideoViewModel
    @State private var player = AVPlayer()
    @State private var isBookmarked = false
    
    init(video: Video, viewModel: VideoViewModel) {
        self.video = video
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            VideoPlayer(player: player)
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    player = AVPlayer(url: URL(string: video.videoUrl)!)
                    player.play()
                }
                .padding(.horizontal, -20)
            Text(video.title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 2)
            HStack {
                Text("\(video.views) views")
                    .font(.subheadline)
                    .padding(.bottom, 5)
                
                Divider()
                    .frame(height: 20)
                
                Text(video.uploadTime)
                    .font(.subheadline)
                    .padding(.bottom, 5)
                
                Spacer()
                
                Button(action: {
                    viewModel.addToFavorite(id: video.id, vidTitle: video.title)
                    isBookmarked.toggle()
                }, label: {
                    Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                })
            }
            
            Text(video.author)
                .font(.headline)
                .padding(.bottom, 5)
            
            Text(video.description)
                .font(.body)
                .padding(.bottom, 5)
            
        }
        .padding()
    }
}
