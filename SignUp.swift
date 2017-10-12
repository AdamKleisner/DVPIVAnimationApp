//
//  SignUp.swift
//  DVPIVAnimationApp
//
//  Created by Adam Kleisner on 10/30/16.
//  Copyright © 2016 Adam Kleisner. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
//    var newUser = user()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [AnyHashable: Any]?)
        -> Bool {
            
            //FIRApp.configure()
            return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpButton(_ sender: AnyObject) {
        
        //this was how I was doing users but a good reference for how I can do the video storing
//        newUser.setUserName(usernameTextField.text!)
//        newUser.setPassword(passwordTextField.text!)
//        newUser.setUserEmail(userEmailTextField.text!)
        
//        let post: [String : AnyObject] = ["userName": usernameTextField.text!,
//                                          "userPassword": passwordTextField.text!,
//                                          "userEmail": userEmailTextField.text!]
//        
//        let database = FIRDatabase.database().reference()
//        
//        database.child("Users").childByAutoId().setValue(post)
        if (usernameTextField.text != nil && passwordTextField.text != nil) {
            
        
        FIRAuth.auth()?.createUser(withEmail: usernameTextField.text!, password: passwordTextField.text!, completion: {
        user, error in
            
            if error != nil{
                
                if let errCode = FIRAuthErrorCode(rawValue: error!._code) {
                    
                    
                    switch errCode {
                    case .errorCodeInvalidEmail:
                        
                        let alert = UIAlertController(title: "Invalid Email", message: "Your email was invalid", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)

                        self.usernameTextField.textColor = UIColor.red
                        
                        break;
                    case .errorCodeEmailAlreadyInUse:
                        
                        let alert = UIAlertController(title: "Email already in use", message: "Your email already has an account", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        
                        self.usernameTextField.textColor = UIColor.red
                        
                        break;
                    case .errorCodeWeakPassword:
                        
                        let alert = UIAlertController(title: "Password is weak", message: "Your password is too weak, try adding numbers or making it longer.", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        
                        self.passwordTextField.textColor = UIColor.red
                        
                        break;
                    default:
                        print ("default")
                        break;
                    }
                }
                
                
            }else {
                print("user created")
                self.dismiss(animated: true, completion: nil)
            }
        
        })
        
        }else {
            
            let alert = UIAlertController(title: "Empty Inputs", message: "One or your inputs is empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

