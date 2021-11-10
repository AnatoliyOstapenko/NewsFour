//
//  SavedWKViewController.swift
//  NewsFour
//
//  Created by MacBook on 07.11.2021.
//

import UIKit
import WebKit

class SavedWKViewController: UIViewController {
    
    
    
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = webView
    }
    
    func loadWeb(_ string: String) {
        guard let url = URL(string: string) else { return }
        webView.load(URLRequest(url: url))
    }


}
