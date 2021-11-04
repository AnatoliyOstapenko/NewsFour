//
//  SavedNewsTableViewController.swift
//  NewsFour
//
//  Created by MacBook on 03.11.2021.
//

import UIKit
import CoreData

class SavedNewsTableViewController: UITableViewController {
    
    var array = [NewsCoreData]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // registration nib
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        loadData()

    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsTableViewCell

        let item = array[indexPath.row]
        
        cell.newsDescription.text = item.newsDescription
        cell.publisher.text = item.publisher
        cell.publishedAt.text = item.publishedAt
        
        return cell
    }
    
    func loadData() {
        do {
            array = try context.fetch(NewsCoreData.fetchRequest())
        } catch { print("loading error \(error)")}
        
        
 
    }
    
    func saveData() {
        do {
            try context.save()
        } catch { print("saving error \(error)")}
        tableView.reloadData()
    }
    
    
    func deleteData(_ item: NewsCoreData) {
        
        context.delete(item)
        saveData()
        
    }
    


}
