//
//  CustomTc.swift
//  MainApp
//
//  Created by Viraj Joshi on 18/04/24.
//

import UIKit

class CustomTc: UITableViewCell {

    @IBOutlet weak var LblOne: UILabel!
    @IBOutlet weak var LblTwo: UILabel!
    @IBOutlet weak var LblThree: UILabel!
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var logoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        logoView.layer.borderWidth = 1
        logoView.layer.borderColor = UIColor.systemRed.cgColor
        logoView.layer.masksToBounds = true
        logoView.layer.cornerRadius = logoView.frame.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(data : StudentModel){
        LblOne.text = data.name
        LblTwo.text = data.id
        LblThree.text = String(data.mark)
        logoLabel.text = String(data.name[data.name.startIndex])
//        print(data.img)
    }
    
}
