//
//  ViewController.swift
//  screen_1
//
//  Created by Viraj Joshi on 04/04/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TextBox: UITextField!
    @IBOutlet weak var txtbox: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        TextBox.layer.cornerRadius=20;
        txtbox.layer.cornerRadius=40
        txtbox.layer.masksToBounds=false
        
    }
}

