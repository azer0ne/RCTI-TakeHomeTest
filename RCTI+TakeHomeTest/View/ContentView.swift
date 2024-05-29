//
//  ContentView.swift
//  RCTI+TakeHomeTest
//
//  Created by Abiyyu Firmansyah on 29/05/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            FavoriteView()
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("Favorite")
                }
        }
    }
}

#Preview {
    ContentView()
}
