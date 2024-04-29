//
//  DataSrcDelegate.swift
//  MainApp
//
//  Created by Viraj Joshi on 16/04/24.
//

protocol TblViewDelegate {
    func didselect(tbl: UITableView, indexPath: IndexPath)
}

import Foundation
import UIKit

class CustomDataSourceDelegate: NSObject {
    
    typealias T = StudentModel
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
        let nib = UINib(nibName: "ProfileCell", bundle: nil)
        tblvw.register(nib, forCellReuseIdentifier: "ProfileCell")
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


extension CustomDataSourceDelegate:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didselect(tbl: tblvw, indexPath: indexPath)
    }
   
}
extension CustomDataSourceDelegate:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblvw.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath)as! ProfileCell
        cell.configCell(data: arrSource[indexPath.row])
        return cell
    }
}

