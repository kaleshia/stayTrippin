//
//  AlamoWkViewController.swift
//  interface
//
//  Created by Kaleshia Lee on 2/9/21.
//

import UIKit
import WebKit

class AlamoWkViewController: UIViewController, WKUIDelegate,WKNavigationDelegate {

    @IBOutlet weak var alamoWebViewOutlet: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
          // Do any additional setup after loading the view.
        alamoWebViewOutlet.navigationDelegate = self
        alamoWebViewOutlet.allowsBackForwardNavigationGestures = true
        alamoWebViewOutlet.uiDelegate = self

        let myURL = URL(string: "https://www.alamo.com")
        let myRequest = URLRequest(url: myURL!)
        alamoWebViewOutlet.load(myRequest)
  
    }
}
