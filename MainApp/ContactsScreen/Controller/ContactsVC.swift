//
//  ContactsVC.swift
//  MainApp
//
//  Created by Viraj Joshi on 15/04/24.
//

import UIKit

class ContactsVC: UIViewController {
    @IBOutlet weak var tabelView: UITableView!
    var list: [String : [String]] = [
        "A": ["Alice", "Ajay", "Aakash"],
        "B": ["Bob", "Beth", "Ben"],
        "C": ["Charlie", "Chaman", "Chris"],
        "D": ["David", "Den", "Doc"]
    ]
    
    @IBOutlet weak var tableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }

}

extension ContactsVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Array(list.values)[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.keys.count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return Array(list.keys)
    }
    
    
}

extension ContactsVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(list.keys)[section]
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            let sectionKey = Array(list.keys)[indexPath.section]
            if let sectionValues = list[sectionKey] {
                cell.textLabel?.text = sectionValues[indexPath.row]
            }
            
            return cell
    }
}
