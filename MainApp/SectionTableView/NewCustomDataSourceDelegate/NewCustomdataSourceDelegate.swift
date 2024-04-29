//
//  NewCustomdataSourceDelegate.swift
//  MainApp
//
//  Created by Viraj Joshi on 18/04/24.
//

import Foundation


import UIKit

class NewCustomdataSourceDelegate: NSObject {
    
    typealias T = Model
    typealias tbl = UITableView
    typealias del = TblViewDelegate
    
    internal var arrSource: [T]
    internal var tblvw: tbl
    internal var delegate: del
    
    var dict = [String: [T]]()
    
    var isSearched = false
    var filteredArr = [T]()
    
    
    //MARK:- Initializers
    required init(arrData: [T], delegate: del, tbl: tbl ) {
        arrSource = arrData
        tblvw = tbl
        self.delegate = delegate
        super.init()
        setupTbl()
//        filterData(query: query)
        setUpDict()
    }
    
    func filterData(query: String?){
        filteredArr.removeAll()
        print(query)
        if let query = query{
            filteredArr = arrSource.filter({ student in
                return student.name.lowercased().starts(with: query.lowercased())
            })
        }
        print(filteredArr)
        isSearched = true
        reload(arr: filteredArr)
    }
    
    
    func setUpDict(){
        dict.removeAll()
        for student in (isSearched ? filteredArr: arrSource){
            var char = String(student.name[student.name.startIndex])
            if dict[char] == nil{
                dict[char] = [student]
            }else{
                
                dict[char]?.append(student)
                
            }
        }
        
        print(dict)
    }
    
    
    fileprivate func setupTbl(){
        let nib = UINib(nibName: "SectionedCell", bundle: nil)
        tblvw.register(nib, forCellReuseIdentifier: "SectionedCell")
//        tblvw.register(cellType: CustomTVC.self)
        tblvw.dataSource = self
        tblvw.delegate = self
        self.tblvw.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tblvw.reloadData()
        
    }
    
    func reload(arr:[T ]){
//        arrSource = arr
        setUpDict()
        tblvw.reloadData()
        
    }
    
    
}

extension NewCustomdataSourceDelegate:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didselect(tbl: tblvw, indexPath: indexPath)
    }
   
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(dict.keys)[section]
    }
}
extension NewCustomdataSourceDelegate:UITableViewDataSource
{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dict.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array(dict.values)[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblvw.dequeueReusableCell(withIdentifier: "SectionedCell", for: indexPath)as! SectionedCell
        cell.configCell(data: Array(dict.values)[indexPath.section][indexPath.row])
        return cell
    }
}



