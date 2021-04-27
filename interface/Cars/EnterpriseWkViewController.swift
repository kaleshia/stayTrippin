//
//  EnterpriseWkViewController.swift
//  interface
//
//  Created by Kaleshia Lee on 4/23/21.
//

import UIKit
import WebKit
class EnterpriseWkViewController:  UIViewController, WKUIDelegate,WKNavigationDelegate  {
    @IBOutlet weak var enterpriseWkOutlet: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
        enterpriseWkOutlet.navigationDelegate = self
        enterpriseWkOutlet.allowsBackForwardNavigationGestures = true
        enterpriseWkOutlet.uiDelegate = self

      let myURL = URL(string: "https://www.enterprise.com/en/home.html")
      let myRequest = URLRequest(url: myURL!)
        enterpriseWkOutlet.load(myRequest)
    }
}
