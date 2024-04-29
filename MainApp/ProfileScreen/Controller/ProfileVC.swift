//
//  ProfileVC.swift
//  MainApp
//
//  Created by Viraj Joshi on 15/04/24.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    var webService = StudentWebService()
    var CustomDataSourceDelegate : CustomDataSourceDelegate!
    var arrData : [StudentModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view.
    }
    func getData(){
        webService.getStudentList { arr in
            arrData = arr
        }
        setupTblView()
    }
    
    func setupTblView(){
        if CustomDataSourceDelegate == nil {
            CustomDataSourceDelegate = .init(arrData: arrData, delegate: self, tbl: tblView)
        }
    }


}

extension ProfileVC : TblViewDelegate {
    func didselect(tbl: UITableView, indexPath: IndexPath) {
        
    }
    
    
}
