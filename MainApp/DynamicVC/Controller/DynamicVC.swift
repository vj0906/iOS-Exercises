//
//  ViewController.swift
//  MainApp
//
//  Created by Viraj Joshi on 22/04/24.
//

import UIKit

class DynamicVC: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    var dataSourceDelegate: DynamicDataSourceDelegate!
    
    var arrData = [
//        model(title: "go to gym", isEditing: false),
        model(title: "Enter Title", isEditing: true)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        hideKeyboardWhenTappedAround()
    }
    

    func setUpTable(){
        if dataSourceDelegate == nil {
            dataSourceDelegate = .init(arrData: arrData, delegate: self, tbl: tblView)
        }
    }
}

extension DynamicVC: TblViewDelegate{
    func didselect(tbl: UITableView, indexPath: IndexPath) {
        
    }
}
