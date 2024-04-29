//
//  NOA_VC.swift
//  MainApp
//
//  Created by Viraj Joshi on 11/04/24.
//

import UIKit

class NOA_VC: UIViewController,UIScrollViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var TextFields: UITextField!
    @IBOutlet weak var blockView: UIView!
    @IBOutlet weak var eyeBtn: UIButton!
    @IBOutlet weak var PassFieldStack: UIStackView!
    @IBOutlet weak var PassField: UITextField!
    @IBOutlet weak var RememberCheck: UIButton!
    @IBOutlet weak var SignInBn_1: UIButton!
    @IBOutlet weak var SignInBtn_2: UIButton!
    @IBOutlet weak var scroll: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //basic UI changes
        blockView.layer.cornerRadius=12
        
        TextFields.layer.borderWidth=1
        TextFields.layer.cornerRadius=10
        TextFields.layer.borderColor=#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        PassField.addPadding()
        
        PassFieldStack.layer.borderWidth=1
        PassFieldStack.layer.cornerRadius=10
        PassFieldStack.layer.borderColor=#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        SignInBn_1.layer.cornerRadius=10
        SignInBtn_2.layer.cornerRadius=10
        
        //auto scroll on opening keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        TextFields.text = UserDefaults.standard.string(forKey: "userEmail");
        PassField.text = UserDefaults.standard.string(forKey: "userPassword")
        TextFields.keyboardType = .emailAddress
        
        
        self.TextFields.delegate = self
        self.PassField.delegate = self
        hideKeyboardWhenTappedAround()
    }
    
    //return button functioning
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == TextFields{
            PassField.becomeFirstResponder()
        }else{
            textField.resignFirstResponder()
        }
        return true
    }
    
    //other actions
    @IBAction func eyeBtnToggle(_ sender: Any) {
        PassField.isSecureTextEntry.toggle()
        eyeBtn.isSelected.toggle()
    }
    
    @IBAction func RememberCheckAction(_ sender: Any) {
        RememberCheck.isSelected.toggle()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        scroll.contentInset = contentInsets
        scroll.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scroll.contentInset = .zero
        scroll.scrollIndicatorInsets = .zero
    }
    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset = CGPoint(x: 0, y: min(scrollView.contentOffset.y, 0))
    }
    
    deinit {
        // Unregister keyboard notifications when the view controller is deallocated
        NotificationCenter.default.removeObserver(self)
    }
    @IBAction func SignInBtn(_ sender: Any) {
        if let email = TextFields.text, let pass = PassField.text{
            
            if !email.validateEmailId(){
                openMyAlert(title: "Invalid Email", message: "Enter Valid Email Address", alertStyle: .alert, actionTitles: ["OK"], actionStyles: [.default], actions: [{ _ in}])
                return
            }else if !pass.validatePassword() {
                openMyAlert(title: "Enter Password", message: "Please Enter Password", alertStyle: .alert, actionTitles: ["OK"], actionStyles: [.default], actions: [{ _ in}])
            }else{
                
                
                if RememberCheck.isSelected {
                    // Save email and password in UserDefaults
                    UserDefaults.standard.setValue(TextFields.text, forKey: "userEmail")
                    UserDefaults.standard.setValue(PassField.text, forKey: "userPassword")
                }
                else {
                    UserDefaults.standard.setValue("", forKey: "userEmail")
                    UserDefaults.standard.setValue("", forKey: "userPassword")
                }
            }
            
            
        }
        let storyboard = UIStoryboard(name: "HelloWorld", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HelloWorld") as! WelcomeViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension UITextField{
    
    func addPadding(){
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
