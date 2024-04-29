//
//  TableFromJsonVC.swift
//  MainApp
//
//  Created by Viraj Joshi on 18/04/24.
//

import UIKit

class TableFromJsonVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var CustomDataSourceDelegate : CustomDataSourceDelegate!
    var webService = StudentWebService()
    var arrData : [StudentModel] = [
        StudentModel(fromDictionary: ["name":"Viraj Joshi","id":"01","img":"img-1","mark":100])
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view.
    }
    
    func getData(){
        webService.getStudentList { arr in
            arrData = arr
            print(arr)
        }
        print(arrData)
        setupTblView()
    }

    func setupTblView(){
        if CustomDataSourceDelegate == nil {
            CustomDataSourceDelegate = .init(arrData: arrData, delegate: self, tbl: tableView)
        }
    }

}

extension TableFromJsonVC : TblViewDelegate {
    func didselect(tbl: UITableView, indexPath: IndexPath) {
//        print(arrData[indexPath.row].name)
    }
    
    
}
