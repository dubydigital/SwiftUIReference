//
//  MusicViewModel.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 2/3/25.
//

import Foundation
import SwiftUI

struct MusicItem: Identifiable, Decodable {
    let id = UUID()
    let trackId: Int
    let trackName: String
    let artistName: String
    let artworkUrl100: String // 100x100 album art URL
    
    private enum CodingKeys: String, CodingKey {
        case trackId, trackName, artistName, artworkUrl100    }
    
}

struct SearchResult: Decodable {
    let results: [MusicItem]
}


class MusicViewModel: ObservableObject {
    @Published var musicItems: [MusicItem] = []
    
    func fetchMusic(searchTerm: String ){
        let formattedTerm = searchTerm.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "https://itunes.apple.com/search?term=\(formattedTerm)&entity=song&limit=200"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with:url ) { data, response, error in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(SearchResult.self, from: data)
                    DispatchQueue.main.async(execute:  {
                        self.musicItems = result.results
                    })
                } catch {
                    print("error decoding JSON: \(error)")
                }
                
            }
            
        }.resume()
        
    }
}
