//
//  EmployeeDataSourceDelegate.swift
//  MainApp
//
//  Created by Viraj Joshi on 29/04/24.
//

import Foundation
import UIKit

class TblModel{
    var title:String
    var value: String
    
    init(title: String, value: String) {
        self.title = title
        self.value = value
    }
    
}

class EmployeeDataSourceDelegate: NSObject {
    
    typealias T = TblModel
    typealias tbl = UITableView
    typealias del = TblViewDelegate
    
    internal var arrSource: [T]
    internal var tblvw: tbl
    internal var delegate: del
    
    
    //MARK:- Initializers
    required init(arrData: [T], delegate: del, tbl: tbl) {
        arrSource = arrData
        tblvw = tbl
        self.delegate = delegate
        super.init()
        setupTbl()
    }
    
    fileprivate func setupTbl(){
        let nib = UINib(nibName: "EmployeeDetailsTVC", bundle: nil)
        tblvw.register(nib, forCellReuseIdentifier: "EmployeeDetailsTVC")
//        tblvw.register(cellType: CustomTVC.self)
        tblvw.dataSource = self
        tblvw.delegate = self
        self.tblvw.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tblvw.reloadData()
        
    }
    
    func reload(arr:[T ]){
        arrSource = arr
        tblvw.reloadData()
        
    }
    
    
}

extension EmployeeDataSourceDelegate:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didselect(tbl: tblvw, indexPath: indexPath)
    }
   
}
extension EmployeeDataSourceDelegate:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblvw.dequeueReusableCell(withIdentifier: "EmployeeDetailsTVC", for: indexPath)as! EmployeeDetailsTVC
        cell.configCell(title: arrSource[indexPath.row].title, value: arrSource[indexPath.row].value)
        return cell
    }
}
