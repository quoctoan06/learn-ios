//
//  VideoRowView.swift
//  youtube-api-video-player-app
//
//  Created by Quoc Toan on 29/11/24.
//

import SwiftUI

struct VideoRowView: View {
    
    var video: Video
    
    var body: some View {
        
        VStack(alignment: .leading) {
            if let url = URL(string: video.snippet?.thumbnails?.medium?.url ?? "") {
                
                AsyncImage(url: url, content: { image in
                    // Image which is displayed
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                }, placeholder: {
                    ProgressView()
                })
            }
            Text(video.snippet?.title ?? "")
                .bold()
        }
        .padding(.vertical)
    }
}
