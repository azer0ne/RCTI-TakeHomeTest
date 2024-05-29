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
                .font(Font.title3.weight(.semibold))
                .bold()
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
            Text(video.author)
                .font(Font.headline.weight(.regular))
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
        }
        .frame(width: 350, height: 180)
        .padding(.vertical, 20)
    }
}
