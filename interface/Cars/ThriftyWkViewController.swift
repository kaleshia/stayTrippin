//
//  ThriftyWkViewController.swift
//  interface
//
//  Created by Kaleshia Lee on 4/23/21.
//

import UIKit
import WebKit
class ThriftyWkViewController:  UIViewController, WKUIDelegate,WKNavigationDelegate  {
    @IBOutlet weak var thriftyWkOutlet: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
        thriftyWkOutlet.navigationDelegate = self
        thriftyWkOutlet.allowsBackForwardNavigationGestures = true
        thriftyWkOutlet.uiDelegate = self

      let myURL = URL(string: "https://www.thrifty.com")
      let myRequest = URLRequest(url: myURL!)
        thriftyWkOutlet.load(myRequest)
    }

}
