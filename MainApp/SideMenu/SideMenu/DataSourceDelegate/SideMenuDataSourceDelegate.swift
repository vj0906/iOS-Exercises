//
//  SideMenuDataSourceDelegate.swift
//  MainApp
//
//  Created by Viraj Joshi on 25/04/24.
//

import Foundation
import UIKit

class SideMenuDataSourceDelegate : NSObject {
    
    typealias tblview = UITableView
    typealias delegate = TblViewDelegate
    
    var arr : [SideMenuModel]
    var tblv  : tblview
    var del : delegate
    fileprivate var selectedSection: IndexPath?
    var tblViewDataSourceDelegate:SideMenuDataSourceDelegate?
 
    
    init( arr:[SideMenuModel],tblv : tblview , del : delegate){
        self.arr = arr
        self.tblv = tblv
        self.del = del
        super.init()
        setupTableView()
    }
    
    func reload(arr : [SideMenuModel] , selectedSection : IndexPath) {
        self.arr = arr
        self.selectedSection = selectedSection
        tblv.reloadData()
    }
    
    
    
    fileprivate func setupTableView(){
        let nib = UINib(nibName: "SideMenuTVC", bundle: nil)
        tblv.register(nib, forCellReuseIdentifier: "SideMenuTVC")
        tblv.delegate = self
        tblv.dataSource = self
    }
}

extension SideMenuDataSourceDelegate : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        del.didselect(tbl: tblv, indexPath: indexPath)
    }
}
extension SideMenuDataSourceDelegate :UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aMenuOptionData = arr[indexPath.row]
        let aMenuItenCell = tableView.dequeueReusableCell(withIdentifier: "SideMenuTVC", for: indexPath) as! SideMenuTVC
        aMenuItenCell.configCell(data: aMenuOptionData)
//        if arr.count-1 == indexPath.row {
//            aMenuItenCell.sepView.isHidden = true
//        }
        
        return aMenuItenCell
    }
}
