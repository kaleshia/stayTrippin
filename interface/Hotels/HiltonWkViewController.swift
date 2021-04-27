//
//  HiltonWkViewController.swift
//  interface
//
//  Created by Kaleshia Lee on 4/23/21.
//

import UIKit
import WebKit

class HiltonWkViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    @IBOutlet weak var hiltonWkOutlet: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        hiltonWkOutlet.navigationDelegate = self
        hiltonWkOutlet.allowsBackForwardNavigationGestures = true
        hiltonWkOutlet.uiDelegate = self
        
        let myURL = URL(string: "https://www.hilton.com/en/")
        let myRequest = URLRequest(url: myURL!)
        hiltonWkOutlet.load(myRequest)
    }
}
