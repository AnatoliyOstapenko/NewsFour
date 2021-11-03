//
//  NewsTableViewCell.swift
//  NewsFour
//
//  Created by MacBook on 01.11.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    
    // create UIViewController class to use present in button
    var tableViewController: UIViewController?
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var publisher: UILabel!
    @IBOutlet weak var newsDescription: UILabel!
    @IBOutlet weak var publishedAt: UILabel!
    
    
    
    
    
    @IBAction func saveNews(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "ADD NEWS TO LIST", message: "", preferredStyle: .alert)
        
        // add buttons
        let addButton = UIAlertAction(title: "add", style: .default) { (action) in
            
//            guard let text = self.textField.text else { return }
            
//            let item = ItemCoreData(context: self.context)
            
//            item.city = text
//            item.time = Date()
//
//            self.array.append(item)
//
//            self.saveData()
        }
        
        let cancelButton = UIAlertAction(title: "cancel", style: .destructive, handler: nil)

        alert.addAction(addButton)
        alert.addAction(cancelButton)
        
        // use tableViewController?. because we in cell controller (No UIViewController class by default)
        tableViewController?.present(alert, animated: true, completion: nil)
        
    }
}
