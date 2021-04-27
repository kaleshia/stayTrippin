//
//  IHGWkViewController.swift
//  interface
//
//  Created by Kaleshia Lee on 4/23/21.
//

import UIKit
import WebKit

class IHGWkViewController: UIViewController, WKUIDelegate,WKNavigationDelegate {
    @IBOutlet weak var ihgWkOutlet: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ihgWkOutlet.navigationDelegate = self
        ihgWkOutlet.allowsBackForwardNavigationGestures = true
        ihgWkOutlet.uiDelegate = self
        
        let myURL = URL(string: "https://www.ihg.com/hotels/us/en/reservation?fromRedirect=true&qSrt=sAV&qIta=99629062&icdv=99629062&setPMCookies=true&dp=true&gclid=Cj0KCQjw4ImEBhDFARIsAGOTMj_UViD0Mk6CEUisyqw3zWRD4HWHcvWcdKh1nd-O_Yp2K4e2b1fCW-IaAhmQEALw_wcB&srb_u=1")
        let myRequest = URLRequest(url: myURL!)
        ihgWkOutlet.load(myRequest)
    }
}
