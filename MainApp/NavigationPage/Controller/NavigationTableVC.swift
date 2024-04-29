//
//  NavigationTableVC.swift
//  MainApp
//
//  Created by Viraj Joshi on 19/04/24.
//

import UIKit

class NavigationTableVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let pages : [String] = ["Welcome Page","screens","stack","Colourapp","login1","Main","NOAView","Contacts","CountryTV","TableFromJson","Section","CollectionView","AdvancedTV"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource=self
        tableView.delegate=self
    }
    
}

extension NavigationTableVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pages.count
    }
    
    
}

extension NavigationTableVC: UITableViewDelegate{

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text=pages[indexPath.row]
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: pages[indexPath.row], bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: pages[indexPath.row]) as! UIViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}



