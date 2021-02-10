//
//  NewAccountViewController.swift
//  interface
//
//  Created by Kaleshia Lee on 11/15/20.
//

import UIKit

class NewAccountViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
  
    @IBAction func registerAccount(_ sender: Any) {
       
            let alertController = UIAlertController(title: "Account Created", message:
                "You have successfully registered your account. Thank you!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

            self.present(alertController, animated: true, completion: nil)
        }
}
