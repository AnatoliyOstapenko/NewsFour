//
//  NewsTableViewController.swift
//  NewsFour
//
//  Created by MacBook on 01.11.2021.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    var array = [Articles]()
    //var newsManager = NewsManager.init(text: "world")
    
    @IBOutlet weak var newsSearchBar: UISearchBar!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        newsSearchBar.delegate = self
        
        // registration nib
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsTableViewCell

        // get row from tableview
        let item = array[indexPath.row]
        
        print("Punlisher is \(item.source.publisher)")
        
        //dispatch data to cell
        cell.publisher.text = item.source.publisher
        cell.newsDescription.text = item.description
        //cell.publishedAt.text = item.publishedAt

        return cell
    }
}

// MARK: - UISearchBarDelegate

extension NewsTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        
        // add text to initialString in NewsManager
        let newsManager = NewsManager.init(text: text)
        
        newsManager.getData { [weak self] result in
            switch result {
            case .success(let news):
                self?.array = news.articles
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
}
