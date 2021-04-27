//
//  AvisWkViewController.swift
//  interface
//
//  Created by Kaleshia Lee on 4/23/21.
//

import UIKit
import WebKit
class AvisWkViewController:  UIViewController, WKUIDelegate,WKNavigationDelegate  {
    @IBOutlet weak var avisWkOutlet: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
        avisWkOutlet.navigationDelegate = self
        avisWkOutlet.allowsBackForwardNavigationGestures = true
        avisWkOutlet.uiDelegate = self

      let myURL = URL(string: "https://www.avis.com/en/home")
      let myRequest = URLRequest(url: myURL!)
        avisWkOutlet.load(myRequest)
    }
}
