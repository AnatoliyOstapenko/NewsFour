//
//  NewsTableViewController.swift
//  NewsFour
//
//  Created by MacBook on 01.11.2021.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    var array = [Articles]()
    var newsManager = NewsManager(text: "world")

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
}
