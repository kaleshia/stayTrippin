//
//  BudgetWkViewController.swift
//  interface
//
//  Created by Kaleshia Lee on 4/23/21.
//

import UIKit
import WebKit
class BudgetWkViewController:  UIViewController, WKUIDelegate,WKNavigationDelegate  {
    @IBOutlet weak var budgetWkOutlet: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
        budgetWkOutlet.navigationDelegate = self
        budgetWkOutlet.allowsBackForwardNavigationGestures = true
        budgetWkOutlet.uiDelegate = self

      let myURL = URL(string: "https://www.budget.com/en/home")
      let myRequest = URLRequest(url: myURL!)
        budgetWkOutlet.load(myRequest)
    }
}
