//
//  ViewController.swift
//  MainApp
//
//  Created by Viraj Joshi on 10/04/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rememberMe: UIButton!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var eyeBTN: UIButton!
    @IBOutlet weak var emailField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
              emailField.keyboardType = .emailAddress
              passField.keyboardType = .decimalPad
            
        
        emailField.text = UserDefaults.standard.string(forKey: "userEmail");
        passField.text = UserDefaults.standard.string(forKey: "userPassword")
    }
    

    @IBAction func eyeBtnToggle(_ sender: Any) {
        passField.isSecureTextEntry.toggle()
        eyeBTN.isSelected.toggle()
    }
    
    @IBAction func rememberMeBtn(_ sender: Any) {
        rememberMe.isSelected.toggle()
    }
    @IBAction func LoginAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name:"Dashboard", bundle:nil)
        let vc = storyboard.instantiateViewController(withIdentifier:"Dashboard") as! DashboardVC
        
        navigationController?.pushViewController(vc, animated:true)
        
        if rememberMe.isSelected {
            // Save email and password in UserDefaults
            UserDefaults.standard.setValue(emailField.text, forKey: "userEmail")
            UserDefaults.standard.setValue(passField.text, forKey: "userPassword")
        }
        else {
            UserDefaults.standard.setValue("", forKey: "userEmail")
            UserDefaults.standard.setValue("", forKey: "userPassword")
        }
    }
}

