//
//  Sign-In.swift
//  DVPIVAnimationApp
//
//  Created by Adam Kleisner on 10/29/16.
//  Copyright © 2016 Adam Kleisner. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import CoreData

class SignInViewController: UIViewController {
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FIRApp.configure()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [AnyHashable: Any]?)
        -> Bool {
            
            return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInButton(_ sender: AnyObject) {
        
        if (passwordTextField.text != nil && userNameTextField.text != nil) {
            
            FIRAuth.auth()?.signIn(withEmail: userNameTextField.text!, password: passwordTextField.text!, completion: {
                user, error in
                
                if error != nil{
                    
                    self.userNameLabel.textColor = UIColor.black
                    self.passwordLabel.textColor = UIColor.black
                    
                    if let errCode = FIRAuthErrorCode(rawValue: error!._code) {
                        
                        switch errCode {
                        case .errorCodeInvalidEmail:
                            
                            let alert = UIAlertController(title: "Invalid Email", message: "Your email was invalid", preferredStyle: UIAlertControllerStyle.alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                            
                            break;
                        case .errorCodeWrongPassword:
                            
                            let alert = UIAlertController(title: "Wrong Password", message: "Your password was incorrect", preferredStyle: UIAlertControllerStyle.alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                            
                            break;
                        default:
                            break;
                        }
                    }
                    
                }else {
                    
                    self.performSegue(withIdentifier: "signInSeque", sender: nil)
                }
            })
        }else {
            
            let alert = UIAlertController(title: "Empty Inputs", message: "One or your inputs is empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            if (passwordTextField.text == nil) {
                passwordLabel.textColor = UIColor.red
            }
            
            if (userNameTextField.text == nil) {
                userNameLabel.textColor = UIColor.red
                
            }
            
        }
    }
}
