//
//  Screen_2_ViewController.swift
//  screen_1
//
//  Created by Viraj Joshi on 08/04/24.
//

import UIKit

class Screen_2_ViewController: UIViewController {

    @IBOutlet weak var loginbtn: UIButton!
    @IBOutlet weak var RegisterBtn: UIButton!
    @IBOutlet weak var bgView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let lightOrange = UIColor(red: 255/255, green: 204/255, blue: 153/255, alpha: 1.0).cgColor
        let systemOrange = UIColor.systemOrange.cgColor
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bgView.bounds
        gradientLayer.colors = [lightOrange, systemOrange]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        bgView.layer.insertSublayer(gradientLayer, at: 0)
        
        loginbtn.layer.cornerRadius=20
        loginbtn.layer.masksToBounds=true
        RegisterBtn.layer.cornerRadius=20
        RegisterBtn.layer.masksToBounds=true
        RegisterBtn.layer.borderColor=UIColor.white.cgColor
        RegisterBtn.layer.borderWidth=2
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
