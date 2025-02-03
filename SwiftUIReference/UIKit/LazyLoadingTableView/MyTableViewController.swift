//
//  MyTableViewController.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 2/3/25.
//

import Foundation
import UIKit



// MARK: - Model for the API
struct iTunesItem: Codable {
    let trackName: String?
    let artworkUrl100: String?
}

struct iTunesResponse: Codable {
    let results: [iTunesItem]
}

class MyTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView()
    var items = [iTunesItem]()
    let imageCache = NSCache<NSString, UIImage>()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchMusicData()
    }
    
    // MARK: - Setup TableView Programmatically
    func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
    
    // MARK: - API Call to iTunes
    func fetchMusicData() {
        let urlString = "https://itunes.apple.com/search?term=taylor+swift&media=music"
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(iTunesResponse.self, from: data)
                    self?.items = response.results
                    
                    // Reload the table view on the main thread
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                } catch {
                    print("Failed to decode JSON: \(error)")
                }
            }
        }
        task.resume()
    }
        
    // MARK: - TableView DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = items[indexPath.row]
        
        cell.textLabel?.text = item.trackName
        
        // Load and set the album artwork image
        if let artworkUrl = item.artworkUrl100 {
            if let cachedImage = imageCache.object(forKey: artworkUrl as NSString) {
                cell.imageView?.image = cachedImage
            } else {
                downloadImage(urlString: artworkUrl) { [weak self] image in
                    if let image = image {
                        self?.imageCache.setObject(image, forKey: artworkUrl as NSString)
                        DispatchQueue.main.async {
                            cell.imageView?.image = image
                            cell.setNeedsLayout()
                        }
                    }
                }
            }
        }
        
        return cell
    }
    
    // MARK: - Helper Method to Download Images
    func downloadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data, let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }.resume()
    }
}
