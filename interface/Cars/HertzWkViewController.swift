//
//  HertzWkViewController.swift
//  interface
//
//  Created by Kaleshia Lee on 4/23/21.
//

import UIKit
import WebKit
class HertzWkViewController:  UIViewController, WKUIDelegate,WKNavigationDelegate {
    @IBOutlet weak var nationalWkOutlet: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
        nationalWkOutlet.navigationDelegate = self
        nationalWkOutlet.allowsBackForwardNavigationGestures = true
        nationalWkOutlet.uiDelegate = self

      let myURL = URL(string: "https://www.hertz.com")
      let myRequest = URLRequest(url: myURL!)
        nationalWkOutlet.load(myRequest)
    }
}
