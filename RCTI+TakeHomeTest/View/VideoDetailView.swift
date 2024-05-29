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
    @State private var player = AVPlayer()
    
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
                
                Spacer()
                
                Text(video.uploadTime)
                    .font(.subheadline)
                    .padding(.bottom, 5)
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

#Preview {
    VideoDetailView(video: Video(id: "2",
                                 title: "The first Blender Open Movie from 2006",
                                 thumbnailUrl: "https://i.ytimg.com/vi_webp/gWw23EYM9VM/maxresdefault.webp",
                                 duration: "8:18",
                                 uploadTime: "May 9, 2011",
                                 views: "24,969,123",
                                 author: "Blender Inc.",
                                 videoUrl: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
                                 description: "Song : Raja Raja Kareja Mein Samaja\nAlbum : Raja Kareja Mein Samaja\nArtist : Radhe Shyam Rasia\nSinger : Radhe Shyam Rasia\nMusic Director : Sohan Lal, Dinesh Kumar\nLyricist : Vinay Bihari, Shailesh Sagar, Parmeshwar Premi\nMusic Label : T-Series",
                                 subscriber: "25254545 Subscribers"))
}
