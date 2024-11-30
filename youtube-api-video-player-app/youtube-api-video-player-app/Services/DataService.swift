//
//  DataService.swift
//  youtube-api-video-player-app
//
//  Created by Quoc Toan on 29/11/24.
//

import Foundation

struct DataService {
    
    private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func getVideo() async -> [Video] {
        
        // Check API_KEY's existence
        guard apiKey != nil else {
            return [Video]()
        }
        
        // Create the URL
        let urlString = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLMRqhzcHGw1Yw2XJyHnxoEXPBCdMaRzkf&maxResults=20&key=\(apiKey!)"
        let url = URL(string: urlString)
        
        if let url = url {
            // Create the request
            let request = URLRequest(url: url)
            let session = URLSession.shared
            
            // Send request
            do {
                let (data, _) = try await session.data(for: request)
                
                // Parse result
                let playlist = try JSONDecoder().decode(Playlist.self, from: data)
                
                return playlist.items
            }
            catch {
                print(error)
            }
        }
        
        return [Video]()
    }
}
