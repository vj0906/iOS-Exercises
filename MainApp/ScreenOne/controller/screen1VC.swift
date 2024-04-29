//
//  screen1VC.swift
//  MainApp
//
//  Created by Viraj Joshi on 11/04/24.
//

import UIKit

class screen1VC: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        textfield.layer.cornerRadius=30
        textfield.layer.masksToBounds=true
        // Do any additional setup after loading the view.
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
