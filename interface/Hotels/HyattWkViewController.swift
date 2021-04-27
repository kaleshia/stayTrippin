//
//  HyattWkViewController.swift
//  interface
//
//  Created by Kaleshia Lee on 4/23/21.
//

import UIKit
import WebKit

class HyattWkViewController: UIViewController, WKUIDelegate,WKNavigationDelegate {

   // @IBOutlet weak var hyattWebViewOutlet: WKWebView!
    @IBOutlet weak var hyattWkOutlet: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hyattWkOutlet.navigationDelegate = self
        hyattWkOutlet.allowsBackForwardNavigationGestures = true
        hyattWkOutlet.uiDelegate = self
        
        let myURL = URL(string: "https://www.hyatt.com")
        let myRequest = URLRequest(url: myURL!)
        hyattWkOutlet.load(myRequest)
    }
}
