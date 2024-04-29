//
//  colourAppVC.swift
//  MainApp
//
//  Created by Viraj Joshi on 11/04/24.
//

import UIKit

class colourAppVC: UIViewController {

    @IBOutlet weak var Label: UILabel!
    @IBOutlet var uiView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func warmTap(_ sender: Any) {
        uiView.backgroundColor=#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        Label.textColor=#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    @IBAction func coolTap(_ sender: Any) {
        uiView.backgroundColor=#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        Label.textColor=#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
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
