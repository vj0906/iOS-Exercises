//
//  NavigationVC.swift
//  MainApp
//
//  Created by Viraj Joshi on 10/04/24.
//

import UIKit

class NavigationVC: UIViewController {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    //    @IBOutlet weak var btn3: UIButton!
//    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btnTen: UIButton!
    @IBOutlet weak var btnEle: UIButton!
    @IBOutlet weak var btnTwe: UIButton!
    @IBOutlet weak var btnThi: UIButton!
    @IBOutlet weak var btnFou: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btn1.layer.cornerRadius=10
        btn2.layer.cornerRadius=10
//        btn3.layer.cornerRadius=10
//        btn4.layer.cornerRadius=10
        btn5.layer.cornerRadius=10
        btn6.layer.cornerRadius=10
        btn7.layer.cornerRadius=10
        btn8.layer.cornerRadius=10
        btn9.layer.cornerRadius=10
        btnTen.layer.cornerRadius=10
        btnEle.layer.cornerRadius=10
        btnTwe.layer.cornerRadius=10
        btnThi.layer.cornerRadius=10
        btnFou.layer.cornerRadius=10
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login2Action(_ sender: Any) {
        let storyboard = UIStoryboard(name:"Main", bundle:nil)
        let vc = storyboard.instantiateViewController(withIdentifier:"STTLLogin2") as! ViewController
        
        navigationController?.pushViewController(vc, animated:true)
    }
    @IBAction func BtnTenAction(_ sender: Any) {
        let storyboard = UIStoryboard(name:"Contacts", bundle:nil)
        let vc = storyboard.instantiateViewController(withIdentifier:"contacts") as! ContactsVC
        
        navigationController?.pushViewController(vc, animated:true)
    }
    @IBAction func NOABtnAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "NOAView", bundle:nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NOAMain") as! NOA_VC
        navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func login1Action(_ sender: Any) {
        let storyboard = UIStoryboard(name:"login1", bundle:nil)
        let vc = storyboard.instantiateViewController(withIdentifier:"login1") as! Login1VC
        
        navigationController?.pushViewController(vc, animated:true)
    }
    @IBAction func stackViewAction(_ sender: Any) {
        let storyboard = UIStoryboard(name:"stack", bundle:nil)
        let vc = storyboard.instantiateViewController(withIdentifier:"stack") as! StackVC
        
        navigationController?.pushViewController(vc, animated:true)
    }
    @IBAction func ColourChangeAction(_ sender: Any) {
        let storyboard = UIStoryboard(name:"Colourapp", bundle:nil)
        let vc = storyboard.instantiateViewController(withIdentifier:"TapView") as! colourAppVC
        
        navigationController?.pushViewController(vc, animated:true)
    }
    @IBAction func helloWorld(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Welcome Page", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "welcomeView") as! WelcomeViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func screensAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "screens", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "screens") as! screensVC
        
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func CountryPgAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "CountryTV", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "countrytv") as! CountryTVC
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func profileBtnAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "TableFromJson", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TableFromJson") as! TableFromJsonVC
        
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func collectionViewBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "CollectionView", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CollectionVC") as! CollectionVC
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func sectionProfileBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Section", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Section") as! SectionTVC
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
