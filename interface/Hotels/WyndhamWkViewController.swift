//
//  WyndhamWkViewController.swift
//  interface
//
//  Created by Kaleshia Lee on 4/23/21.
//

import UIKit
import WebKit
import WebKit


class WyndhamWkViewController: UIViewController, WKUIDelegate,WKNavigationDelegate {
    @IBOutlet weak var wyndhamWkOutlet: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        wyndhamWkOutlet.navigationDelegate = self
        wyndhamWkOutlet.allowsBackForwardNavigationGestures = true
        wyndhamWkOutlet.uiDelegate = self
        
        let myURL = URL(string: "https://www.wyndhamhotels.com")
        let myRequest = URLRequest(url: myURL!)
        wyndhamWkOutlet.load(myRequest)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
