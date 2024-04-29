//
//  EmployeeDetailsTVC.swift
//  MainApp
//
//  Created by Viraj Joshi on 29/04/24.
//

import UIKit

class EmployeeDetailsTVC: UITableViewCell {

    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var DetailsLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configCell(title: String, value: String){
        TitleLabel.text = title
        DetailsLabel.text = value
    }
    
}
