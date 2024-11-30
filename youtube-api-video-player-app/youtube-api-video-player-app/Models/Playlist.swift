//
//  Playlist.swift
//  youtube-api-video-player-app
//
//  Created by Quoc Toan on 29/11/24.
//

import Foundation

struct Playlist: Decodable {
    var items: [Video]
}
