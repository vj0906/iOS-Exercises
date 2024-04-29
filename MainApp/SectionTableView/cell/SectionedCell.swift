//
//  SectionedCell.swift
//  MainApp
//
//  Created by Viraj Joshi on 18/04/24.
//

import UIKit

class SectionedCell: UITableViewCell {

    
    
    
    
    @IBOutlet weak var viewLogo: UIView!
    @IBOutlet weak var imgLogo: UIImageView!
    
   
    @IBOutlet var lblDob: UILabel!
    
    @IBOutlet var lblName: UILabel!
    
    
    @IBOutlet var lblDepartment: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewLogo.layer.borderWidth = 1
        viewLogo.layer.borderColor = UIColor.systemRed.cgColor
        viewLogo.layer.masksToBounds = true
        viewLogo.layer.cornerRadius = viewLogo.frame.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(data : Model){
        lblDepartment.text = data.department
        lblName.text = data.name
        lblDob.text = data.dob

        if let imgStr = data.img{
            let img = UIImage(named: imgStr)
                imgLogo.image = img

        }

//        print(data.img)
    }

}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
