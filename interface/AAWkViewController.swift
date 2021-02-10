//
//  AAWkViewController.swift
//  interface
//
//  Created by Kaleshia Lee on 2/7/21.
//

import UIKit
import WebKit


class AAWkViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    @IBOutlet weak var aaWebViewOutlet: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        aaWebViewOutlet.navigationDelegate = self
        aaWebViewOutlet.allowsBackForwardNavigationGestures = true
        aaWebViewOutlet.uiDelegate = self
        
        let myURL = URL(string: "https://www.aa.com")
        let myRequest = URLRequest(url: myURL!)
        aaWebViewOutlet.load(myRequest)
    }
}

