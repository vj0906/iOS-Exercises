//
//  DynamicTVC.swift
//  MainApp
//
//  Created by Viraj Joshi on 22/04/24.
//

import UIKit

class DynamicTVC: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    func configCell(data: model){
        
        label.text = data.title
        if data.isEditing{
            label.isHidden = true
            btnDelete.isHidden = true
        }else{
            txtField.isHidden = true
            btnAdd.isHidden = true
        }
        
    }
    
}
