//
//  HolidayInnWkViewController.swift
//  interface
//
//  Created by Kaleshia Lee on 4/23/21.
//

import UIKit
import WebKit

class HolidayInnWkViewController: UIViewController, WKUIDelegate,WKNavigationDelegate {
    @IBOutlet weak var holidayInnWkOutlet: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        holidayInnWkOutlet.navigationDelegate = self
        holidayInnWkOutlet.allowsBackForwardNavigationGestures = true
        holidayInnWkOutlet.uiDelegate = self
        
        let myURL = URL(string: "https://www.holidayinn.com/hotels/us/en/reservation?fromRedirect=true&qSrt=sBR&qIta=99629062&icdv=99629062&setPMCookies=true&dp=true&gclid=Cj0KCQjw4ImEBhDFARIsAGOTMj9x1_jHvSpMFUEc8D-bZim_I6YKXzvMhohOnK8d7udwZhZKN4qpOLQaAnAwEALw_wcB&srb_u=1")
        let myRequest = URLRequest(url: myURL!)
        holidayInnWkOutlet.load(myRequest)
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
