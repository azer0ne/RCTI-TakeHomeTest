//
//  HomeView.swift
//  RCTI+TakeHomeTest
//
//  Created by Abiyyu Firmansyah on 29/05/24.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.managedObjectContext) private var moc
    @StateObject private var viewModel = VideoViewModel(moc: DataController.shared.container.viewContext)

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.videos) { video in
                        NavigationLink(
                            destination: VideoDetailView(video: video, viewModel: viewModel),
                            label: {
                                VideoItemView(video: video)
                                    .padding(.vertical, 10)
                            })
                    }
                }
            }
            .onAppear {
                if viewModel.videos.isEmpty {
                    Task {
                        try await viewModel.fetchData()
                    }
                }
            }
            .navigationTitle("Home")
        }
    }
}
