//
//  LoginViewController.swift
//  interface
//
//  Created by Kaleshia Lee on 4/6/21.
//
import AVKit
import AVFoundation
import UIKit
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
   // @IBOutlet weak var introClip: UIImageView
    @IBOutlet weak var introClip: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //put here
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "introClip", ofType: "mp4")!))
            let layer = AVPlayerLayer(player: player)
            layer.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
            view.layer.addSublayer(layer)
            player.volume = 0
            player.play()
        }
    
    
    @IBAction func loginAction(_ sender: Any) {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
                   if error == nil{
                     self.performSegue(withIdentifier: "loginToHome", sender: self)
                                  }
                    else{
                     let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                     let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                                    
                      alertController.addAction(defaultAction)
                      self.present(alertController, animated: true, completion: nil)
                         }
               }
        
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
