//
//  NewAccountViewController.swift
//  interface
//
//  Created by Kaleshia Lee on 11/15/20.
//

import UIKit
import FirebaseAuth

class NewAccountViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordConfirm: UITextField!
    
    //textField.textContentType = .oneTimeCode
    
    @IBAction func registerAccount(_ sender: Any) {
//        password.textContentType = .oneTimeCode
//        passwordConfirm.textContentType = .oneTimeCode
        //textContentType="none"
      //  var autoCorrect={false}
        
        if password.text != passwordConfirm.text {
               let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: .alert)
               let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                           
               alertController.addAction(defaultAction)
               self.present(alertController, animated: true, completion: nil)
                       }
               else{
               Auth.auth().createUser(withEmail: email.text!, password: password.text!){ (user, error) in
                if error == nil {
                  self.performSegue(withIdentifier: "signupToHome", sender: self)
                               }
                else{
                  let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                  let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                                   
                   alertController.addAction(defaultAction)
                   self.present(alertController, animated: true, completion: nil)
                      }
                           }
                     }
           }
    
//            let alertController = UIAlertController(title: "Account Created", message:
//                "You have successfully registered your account. Thank you!", preferredStyle: .alert)
//    func alertController;.addAction(UIAlertAction(title: "Dismiss", style: .default))
//
//            self.present(alertController, animated: true, completion: nil)
        }


