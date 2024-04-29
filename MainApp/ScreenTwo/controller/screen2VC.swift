//
//  screen2VC.swift
//  MainApp
//
//  Created by Viraj Joshi on 11/04/24.
//

import UIKit

class screen2VC: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var innerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let lightOrange = UIColor(red: 255/255, green: 204/255, blue: 153/255, alpha: 1.0).cgColor
//        let darkerOrange = UIColor(red: 225/255, green: 174/255, blue: 133/255, alpha: 1.0)
        let systemOrange = UIColor.systemOrange.cgColor
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = innerView.bounds
        gradientLayer.colors = [lightOrange, systemOrange]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        innerView.layer.insertSublayer(gradientLayer, at: 0)
        
        loginBtn.layer.cornerRadius=20
        loginBtn.layer.masksToBounds=true
        registerBtn.layer.cornerRadius=20
        registerBtn.layer.masksToBounds=true
        registerBtn.layer.borderColor=UIColor.white.cgColor
        registerBtn.layer.borderWidth=2
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
