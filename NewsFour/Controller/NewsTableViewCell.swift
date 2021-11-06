//
//  NewsTableViewCell.swift
//  NewsFour
//
//  Created by MacBook on 01.11.2021.
//

import UIKit
import CoreData

class NewsTableViewCell: UITableViewCell {
    
    var coreDataList = [NewsCoreData]()
    
    var newsTableViewController = NewsTableViewController()
    var newsText: String?
    
    // create UIViewController class to use present in button
    var tableViewController: UIViewController?
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var publisher: UILabel!
    @IBOutlet weak var newsDescription: UILabel!
    @IBOutlet weak var publishedAt: UILabel!
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    @IBAction func saveNews(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "add news you like", message: "", preferredStyle: .alert)
        
        // add buttons
        let addButton = UIAlertAction(title: "add", style: .default) { (action) in
            
            let item = NewsCoreData(context: self.context)
            
            // Dispatch data from labels and wedString to Core Data
            item.newsDescription = self.newsDescription.text
            item.publishedAt = self.publishedAt.text
            item.publisher = self.publisher.text
            item.url = self.newsTableViewController.webString
            item.newsImage = self.newsText
           
            
            
            self.coreDataList.append(item)
            self.saveData()
        }
        
        let cancelButton = UIAlertAction(title: "cancel", style: .destructive, handler: nil)

        alert.addAction(addButton)
        alert.addAction(cancelButton)
        
        // use tableViewController?. because we in cell controller (No UIViewController class by default)
        tableViewController?.present(alert, animated: true, completion: nil)
        
    }
    
    // MARK: - Core Data
    
    func saveData() {
        do {
            try context.save()
        } catch { print("saving error \(error)")}
        
    }
    
}
