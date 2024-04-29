//
//  SampleCVC.swift
//  MainApp
//
//  Created by Viraj Joshi on 18/04/24.
//

import UIKit

class SampleCVC: UICollectionViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.cellView.setCustomCornerRadius(radius: 20)
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowRadius = 4
        self.imgUser.roundUpperCorners(radius: 15)

    }
    
    func configureCell(data: String, imageStr:String) {
     
        imgUser.image = UIImage(named: imageStr)
        lblName.text = data
    }

}
