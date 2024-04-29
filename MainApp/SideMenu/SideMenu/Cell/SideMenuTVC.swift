//
//  SideMenuTVC.swift
//  MainApp
//
//  Created by Viraj Joshi on 25/04/24.
//

import UIKit

class SideMenuTVC: UITableViewCell {

    @IBOutlet var imgView: UIImageView!
    
    @IBOutlet var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configCell(data: SideMenuModel){
//        print(data.Image)
        imgView.image = UIImage(systemName: data.Image)
        lblTitle.text = data.TitleKey
    }
    
}
