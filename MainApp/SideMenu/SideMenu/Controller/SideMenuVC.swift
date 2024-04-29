//
//  SideMenuVC.swift
//  MainApp
//
//  Created by Viraj Joshi on 25/04/24.
//

import UIKit

class SideMenuVC: UIViewController {

    @IBOutlet weak var ProfileImageView: UIImageView!
    @IBOutlet weak var tblView: UITableView!
//    @IBOutlet var tblViewHeight: NSLayoutConstraint!
    @IBOutlet weak var tblViewHeight: NSLayoutConstraint!
    @IBOutlet weak var imageBGView: UIView!
    var arrSideMenu : [SideMenuModel] = []
    var sidemenuDataSourceDelegate : SideMenuDataSourceDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()

        tblView.isScrollEnabled = false
        
        setUpTblView()
        tblViewHeight.constant = CGFloat(arrSideMenu.count * 50)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.ProfileImageView.layer.cornerRadius = self.ProfileImageView.frame.height/2
            self.ProfileImageView.layer.masksToBounds = true
            self.ProfileImageView.layer.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            self.imageBGView.layer.backgroundColor=#colorLiteral(red: 0.897996366, green: 0.8987259269, blue: 0.9176015258, alpha: 1)
        })
    }
    func readPropertyList(ofName: String) -> Any? {
        if let path = Bundle.main.path(forResource: ofName, ofType: "plist") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileUrl, options: .init(rawValue: 0))
                let plistData = try PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
                return plistData
            } catch let error {
                debugPrint(error.localizedDescription)
            }
        }
        return nil
    }
    
    func setUpTblView(){
        if let arr = readPropertyList(ofName: "SideMenu") as? [[String:Any]] {
            self.arrSideMenu = arr.map({ SideMenuModel(dict: $0) })
        }
        if sidemenuDataSourceDelegate == nil {
            sidemenuDataSourceDelegate = .init(arr: arrSideMenu, tblv: tblView, del: self)
        }
    }
    

    @IBAction func LogOutAction(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "email")
        UserDefaults.standard.removeObject(forKey: "password")
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier:"Main" )as! UIViewController
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
}

extension SideMenuVC: TblViewDelegate{
    func didselect(tbl: UITableView, indexPath: IndexPath) {
        let story = UIStoryboard(name: arrSideMenu[indexPath.row].storyboardID, bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: arrSideMenu[indexPath.row].storyboardID)as! UIViewController
        self.navigationController?.pushViewController(vc, animated: false)
    }
}
