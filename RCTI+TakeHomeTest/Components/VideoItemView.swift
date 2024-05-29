//
//  VideoItemView.swift
//  RCTI+TakeHomeTest
//
//  Created by Abiyyu Firmansyah on 29/05/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct VideoItemView: View {
    @State var video: Video
    @ObservedObject private var viewModel = VideoViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            WebImage(url: URL(string: video.thumbnailUrl))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
                .scaledToFill()
                .frame(width: 350, height: 180)
                .cornerRadius(20)
            Text(video.title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.leading)
            Text(video.author)
                .font(.headline)
                .fontWeight(.regular)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.leading)
        }
        .frame(width: 350, height: 180)
        .padding(.vertical, 20)
    }
}

#Preview {
    VideoItemView(video: Video(id: "2",
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
