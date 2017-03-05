//
//  SignUpViewController.swift
//  ExampleOne
//
//  Created by Shaik Ghouse Basha on 2/3/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var mFirstNameTextField: UITextField!
    @IBOutlet weak var mLastNameTextField: UITextField!
    @IBOutlet weak var mUserNameTextField: UITextField!
    @IBOutlet weak var mPasswordTextField: UITextField!
    @IBOutlet weak var mComfirmPasswordTextField: UITextField!
    
    @IBOutlet weak var mMessageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signupButtonAction(_ sender: UIButton) {
        let firstname   =   mFirstNameTextField.text
        let lastname    =   mLastNameTextField.text
        let username    =   mUserNameTextField.text
        let password    =   mPasswordTextField.text
        let repassword  =   mComfirmPasswordTextField.text
        
        
        if(firstname == "" || lastname == "" || username == "" || password == "") {
            mMessageLabel.text = "inproper entries"
        }else {
            if(password != repassword) {
                mMessageLabel.text = "Password and Confirm Password doesn't match"
            }else {
                mMessageLabel.text = "User Successfully Created"
            }
        }
        
        let alertView = UIAlertController.init(title: "Error", message: mMessageLabel.text, preferredStyle: .alert)
        
        let okAction  = UIAlertAction (title: "Ok", style: .default, handler: nil)
        alertView.addAction(okAction)
        
        present(alertView, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
