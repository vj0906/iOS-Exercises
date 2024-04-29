//
//  screensVC.swift
//  MainApp
//
//  Created by Viraj Joshi on 12/04/24.
//

import UIKit

class screensVC: UIViewController {

    @IBOutlet weak var btn1SC: UIButton!
    @IBOutlet weak var btn2SC: UIButton!
    @IBOutlet weak var btn3SC: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btn1SC.layer.cornerRadius=10
        btn2SC.layer.cornerRadius=10
        btn3SC.layer.cornerRadius=10
        // Do any additional setup after loading the view.
    }
    
    @IBAction func screen1Action(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Storyboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Storyboard") as! screen1VC
        
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func screen2Action(_ sender: Any) {
        let storyboard = UIStoryboard(name: "screen2", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "screenTwo") as! screen2VC
        
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func screen3Action(_ sender: Any) {
        let storyboard = UIStoryboard(name: "screen3", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "screenThree") as! screen3VC
        
        navigationController?.pushViewController(vc, animated: true)
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
