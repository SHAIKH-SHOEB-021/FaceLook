//
//  ViewController.swift
//  FaceLook
//
//  Created by shoeb on 14/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameTXT: UITextField!
    @IBOutlet weak var passwordTXT: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //Login Screen Code Here
    @IBAction func loginBTN(_ sender: Any) {
        if(usernameTXT.text == "Shoeb@123" && passwordTXT.text == "12345"){
            let homeVC = self.storyboard?.instantiateViewController (withIdentifier: "HomeViewController") as!
            HomeViewController
            self.navigationController?.pushViewController(homeVC,animated:true)
        }else{
            let alert = UIAlertController(title: "Alert", message: "Wrong username or password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: {
                return})
        }
    }
    
}

