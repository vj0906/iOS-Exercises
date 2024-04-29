//
//  CustomDataSourceDelegate.swift
//  MainApp
//
//  Created by Viraj Joshi on 22/04/24.
//

import Foundation

import UIKit

class DynamicDataSourceDelegate: NSObject {
    
    typealias T = model
    typealias tbl = UITableView
    typealias del = TblViewDelegate
    
    internal var arrSource: [T]
    internal var tblvw: tbl
    internal var delegate: del
    
    
    var editingTitle: String?
    var deletingIndex: Int?
    
    //MARK:- Initializers
    required init(arrData: [T], delegate: del, tbl: tbl) {
        arrSource = arrData
        tblvw = tbl
        self.delegate = delegate
        super.init()
        setupTbl()
    }
    
    fileprivate func setupTbl(){
        let nib = UINib(nibName: "DynamicTVC", bundle: nil)
        tblvw.register(nib, forCellReuseIdentifier: "DynamicTVC")
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

extension DynamicDataSourceDelegate:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didselect(tbl: tblvw, indexPath: indexPath)
    }
    
    
    
}
extension DynamicDataSourceDelegate:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tblvw.dequeueReusableCell(withIdentifier: "DynamicTVC", for: indexPath)as! DynamicTVC
        cell.txtField.delegate = self
        cell.btnDelete.tag = indexPath.row
        deletingIndex = indexPath.row
        cell.btnAdd.addTarget(self, action: #selector(addAction(_:)), for: .touchUpInside)
        cell.btnDelete.addTarget(self, action: #selector(deleteAction), for: .touchUpInside)
        
        cell.configCell(data: arrSource[indexPath.row])
        return cell
    }
    
    
    
}


extension DynamicDataSourceDelegate{
    @objc func addAction(_ sender: UIButton){
        guard let title = editingTitle, !title.isEmpty else {
            return
        }
        
        // Calculate the insertion index for the second-to-last position.
        let insertIndex = max(0, arrSource.count - 1)
        
        // Insert the new item into the data source.
        arrSource.insert(model(title: title, isEditing: false), at: insertIndex)
        
        // Update the table view to reflect the change.
        tblvw.performBatchUpdates({
            let indexPath = IndexPath(row: insertIndex, section: 0)
            tblvw.insertRows(at: [indexPath], with: .automatic)
        }, completion: nil)
        
        
        // Clear the text field in the cell where the button was tapped.
        if let buttonPosition = sender.superview?.convert(sender.frame.origin, to: tblvw),
           let indexPath = tblvw.indexPathForRow(at: buttonPosition),
           let cell = tblvw.cellForRow(at: indexPath) as? DynamicTVC {
            cell.txtField.text = ""
        }
        
        
    }
    
    @objc func deleteAction(_ sender: UIButton){
        
        if let buttonPosition = sender.superview?.convert(sender.frame.origin, to: tblvw),
           let indexPath = tblvw.indexPathForRow(at: buttonPosition) {
            
            arrSource.remove(at: indexPath.row)
            tblvw.deleteRows(at: [indexPath], with: .automatic)
        } else {
            print("Error: Could not find the index path of the delete button")
        }
    }
}

extension DynamicDataSourceDelegate: UITextFieldDelegate{
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(valueChanged), for: .editingChanged)
    }
    
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.text = ""
            if let buttonPosition = textField.superview?.convert(textField.frame.origin, to: tblvw),
               let indexPath = tblvw.indexPathForRow(at: buttonPosition),
               let cell = tblvw.cellForRow(at: indexPath) as? DynamicTVC {
                addAction(cell.btnAdd)
            }
            textField.resignFirstResponder()
            return true
        }
    
    
    @objc func valueChanged(_ textField: UITextField){
        editingTitle = textField.text
    }
    
}
