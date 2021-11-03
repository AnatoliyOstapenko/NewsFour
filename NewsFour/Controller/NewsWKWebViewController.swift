//
//  ViewController.swift
//  NewsFour
//
//  Created by MacBook on 01.11.2021.
//

import UIKit
import WebKit

class NewsWKWebViewController: UIViewController {
    
    var webView = WKWebView()
    var urlString = ""
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = webView
  
    }
    
    func load(_ urlString: String) {
        
        guard let url = URL(string: urlString) else { return }
        webView.load(URLRequest(url: url))
            }
 


}

