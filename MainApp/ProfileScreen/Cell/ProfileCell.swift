//
//  ProfileCell.swift
//  MainApp
//
//  Created by Viraj Joshi on 15/04/24.
//

import UIKit

class ProfileCell: UITableViewCell{
    
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var marksLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(data: StudentModel){
        idLbl.text = data.id
        nameLbl.text = data.name
        marksLbl.text = String(data.mark)
    }
    
}
