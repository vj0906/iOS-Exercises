//
//  SectionTVC.swift
//  MainApp
//
//  Created by Viraj Joshi on 18/04/24.
//

import UIKit

class SectionTVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var webService = WebService()
    var newCustomDataSourceDelegate: NewCustomdataSourceDelegate!
    var arrData = [Model]()
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
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
        if newCustomDataSourceDelegate == nil {
            newCustomDataSourceDelegate = .init(arrData: arrData, delegate: self, tbl: tableView)
        }
    }
}

extension SectionTVC : TblViewDelegate{
    func didselect(tbl: UITableView, indexPath: IndexPath) {
        
        
        
        
        let story = UIStoryboard(name: "EmployeeDetails", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "EmployeeDetails")as! EmployeeDetailsVC
        
        var tempArr = Array(newCustomDataSourceDelegate.dict.values)
        vc.employee = tempArr[indexPath.section][indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension SectionTVC : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searching....")
        self.newCustomDataSourceDelegate.filterData(query: searchText)
    }
}





