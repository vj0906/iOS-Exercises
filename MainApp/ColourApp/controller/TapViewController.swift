//
//  TapViewController.swift
//  screen_1
//
//  Created by Viraj Joshi on 08/04/24.
//

import UIKit

class TapViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet var Main: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func warmTap(_ sender: Any) {
        Main.backgroundColor=#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        label.textColor=UIColor.black
    }
    
    @IBAction func coolTap(_ sender: Any) {
        Main.backgroundColor=#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        label.textColor=UIColor.white
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
