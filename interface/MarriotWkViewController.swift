//
//  MarriotViewController.swift
//  interface
//
//  Created by Kaleshia Lee on 2/9/21.
//

import UIKit
import WebKit

class MarriotWkViewController: UIViewController, WKUIDelegate,WKNavigationDelegate {

    @IBOutlet weak var marrWebViewOutlet: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        marrWebViewOutlet.navigationDelegate = self
        marrWebViewOutlet.allowsBackForwardNavigationGestures = true
        marrWebViewOutlet.uiDelegate = self
        
        let myURL = URL(string: "https://www.marriott.com")
        let myRequest = URLRequest(url: myURL!)
        marrWebViewOutlet.load(myRequest)
    }
}
