//
//  JetBlueViewController.swift
//  interface
//
//  Created by Kaleshia Lee on 4/20/21.
//

import UIKit
import WebKit

class JetBlueViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    @IBOutlet weak var JetBlueViewController: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        JetBlueViewController.navigationDelegate = self
        JetBlueViewController.allowsBackForwardNavigationGestures = true
        JetBlueViewController.uiDelegate = self
            
            let myURL = URL(string: "https://www.jetblue.com/?;kxadid=58700003654666874;kxkeyword%3Djet%20blue;kxsearch_engine%3DGOOGLE&pscid=71700000029193862&psadid=58700003654666874&pskw=jet%20blue&viq=p28630062480&dev=c&gclid=Cj0KCQjw9_mDBhCGARIsAN3PaFNdNcaBLM5FA4Ez_ytVVX8O88snSVeXq_PH3mIOAY30-E3J2HEP_XYaAhVoEALw_wcB&gclsrc=aw.ds")
            let myRequest = URLRequest(url: myURL!)
        JetBlueViewController.load(myRequest)
    }
}
