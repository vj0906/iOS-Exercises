//
//  STTLLoginViewController.swift
//  screen_1
//
//  Created by Viraj Joshi on 09/04/24.
//

import UIKit

class STTLLoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func eyetoggle(_ sender: Any) {
        password.isSecureTextEntry.toggle()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func btnLogin(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "main") as! TapViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
