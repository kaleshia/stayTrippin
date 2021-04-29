//
//  HertzWkViewController.swift
//  interface
//
//  Created by Kaleshia Lee on 4/23/21.
//

import UIKit
import WebKit
class HertzWkViewController:  UIViewController, WKUIDelegate,WKNavigationDelegate {
    @IBOutlet weak var hertzWkOutlet: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
        hertzWkOutlet.navigationDelegate = self
        hertzWkOutlet.allowsBackForwardNavigationGestures = true
        hertzWkOutlet.uiDelegate = self

      let myURL = URL(string: "https://www.hertz.com")
      let myRequest = URLRequest(url: myURL!)
        hertzWkOutlet.load(myRequest)
    }
}
