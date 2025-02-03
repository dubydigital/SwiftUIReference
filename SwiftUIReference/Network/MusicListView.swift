//
//  MusicListView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 2/3/25.
//

import SwiftUI
import Foundation

struct MusicListView: View {
    @StateObject private var viewModel = MusicViewModel()
    @State private var searchTerm = "System of A  Down"

    var body: some View {
        NavigationView {
            VStack {
                                                                        
                // Search Bar
                TextField("Search Music", text: $searchTerm, onCommit: {
                    viewModel.fetchMusic(searchTerm: searchTerm)
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(10)
                .padding()
                
                // List of Music Items
                List(viewModel.musicItems) { item in
                    HStack {
                        // Album Artwork
                        AsyncImage(url: URL(string: item.artworkUrl100)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                        } placeholder: {
                            ProgressView()
                        }

                        // Track Details
                        VStack(alignment: .leading) {
                            Text(item.trackName)
                                .font(.headline)
                                .lineLimit(1)
                            Text(item.artistName)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 5)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("iTunes Music")
            .onAppear {
                viewModel.fetchMusic(searchTerm: searchTerm)
            }
        }
    }
}

#Preview {
    MusicListView()
}
