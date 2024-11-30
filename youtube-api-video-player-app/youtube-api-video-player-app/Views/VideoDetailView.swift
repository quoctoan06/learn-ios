//
//  VideoDetailView.swift
//  youtube-api-video-player-app
//
//  Created by Quoc Toan on 29/11/24.
//

import SwiftUI
import YouTubePlayerKit

struct VideoDetailView: View {
    
    var video: Video
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                
                // Configure video player
                let youTubePlayer = YouTubePlayer(
                    source: .video(id: video.snippet?.resourceId?.videoId ?? ""),
                    configuration: .init(
                        autoPlay: false
                    )
                )
                
                // Video Player
                YouTubePlayerView(youTubePlayer)
                    .frame(width: geometry.size.width, height: geometry.size.width / 1.77778)
                
                // Title and Description
                ScrollView {
                    VStack(alignment: .leading, spacing: 30) {
                        Text(video.snippet?.title ?? "")
                            .font(.headline)
                            .bold()
                        
                        Text(video.snippet?.description ?? "")
                    }
                }
                .scrollIndicators(.hidden)
                .padding()
            }
        }
    }
}
