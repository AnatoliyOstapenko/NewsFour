//
//  NewsTableViewController.swift
//  NewsFour
//
//  Created by MacBook on 01.11.2021.
//

import UIKit


class NewsTableViewController: UITableViewController {
    
    var array = [Articles]()
    var newsManager = NewsManager.init(text: "world")
    var webString: String?
    
    
    @IBOutlet weak var newsSearchBar: UISearchBar!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        newsSearchBar.delegate = self
        
        
        // registration nib
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        updateUI()
    }
    
    // UIRefreshControl
    @IBAction func refreshUI(_ sender: UIRefreshControl) {
        updateUI()
        sender.endRefreshing()
    }
    
    
    
    
    func updateUI() {
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


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsTableViewCell

        // get row from tableview
        let item = array[indexPath.row]
        
        //dispatch data to cell
        cell.publisher.text = item.source.publisher
        cell.newsDescription.text = item.description
        cell.publishedAt.text = item.publishedAt
        
        // Convert string to UIImage anf dispatch to cell
        if let url = URL(string: item.urlToImage) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard error == nil, let data = data else { return }
                
                DispatchQueue.main.async {
                    cell.newsImage.image = UIImage(data: data)
                }
            }.resume() // it's mandatory
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = array[indexPath.row]
        webString = item.url
        
        self.performSegue(withIdentifier: "goToNewsWKWebView", sender: self)
    }
    // MARK: - Prepare Segue
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        
        if segue.identifier == "goToNewsWKWebView" {
            
            let destination = segue.destination as! NewsWKWebViewController
            
            guard let urlString = webString else { return }
            destination.load(urlString)
            
            
        }
  
    }
    
}

// MARK: - UISearchBarDelegate

extension NewsTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        
        // add text to initialString in NewsManager
        self.newsManager = NewsManager.init(text: text)
        updateUI()
        
    }
    
}
