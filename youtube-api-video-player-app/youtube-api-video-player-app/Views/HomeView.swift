//
//  HomeView.swift
//  youtube-api-video-player-app
//
//  Created by Quoc Toan on 29/11/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "play.square.stack")
                    Text("Feed")
                }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
