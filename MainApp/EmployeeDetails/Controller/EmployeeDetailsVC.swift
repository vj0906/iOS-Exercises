//
//  EmployeeDetailsVC.swift
//  MainApp
//
//  Created by Viraj Joshi on 29/04/24.
//

import UIKit

class EmployeeDetailsVC: UIViewController {

    
    @IBOutlet weak var ImgView: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var DepartmentLabel: UILabel!
    @IBOutlet weak var IdLabel: UILabel!
    @IBOutlet weak var SportsLabel: UILabel!
    @IBOutlet weak var TblView: UITableView!
    @IBOutlet weak var MiddleView: UIView!
    @IBOutlet weak var DetailsView: UIView!
    
    var webService = WebService()
    var employeeDataSourceDelegate: EmployeeDataSourceDelegate!
    var employee: Model?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTblView()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.ImgView.layer.cornerRadius = self.ImgView.frame.height/2
            self.ImgView.layer.masksToBounds = true
        })
        
        self.title = "Employee Details"        
//        DetailsView.layer.borderWidth = 1
//        DetailsView.layer.cornerRadius = 20
        MiddleView.layer.cornerRadius=10
        MiddleView.layer.masksToBounds=true
        
        self.DetailsView.setCustomCornerRadius(radius: 20)
        self.DetailsView.layer.masksToBounds = false
        self.DetailsView.layer.shadowColor = UIColor.black.cgColor
        self.DetailsView.layer.shadowOpacity = 0.5
        self.DetailsView.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.DetailsView.layer.shadowRadius = 4
        
        let customBackButton = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(backButtonPressed))
        customBackButton.image = UIImage(systemName: "arrow.backward")

           // Assign the custom button as the left bar button item
           self.navigationItem.leftBarButtonItem = customBackButton
    }
    
    @objc func backButtonPressed() {
        // Implement your custom back button functionality here
        // Typically, you would want to pop the current view controller from the navigation stack
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupTblView(){
        
        if let employee = employee{
//            imgView.load(url: student.img)
            NameLabel.text = employee.name
            DepartmentLabel.text = employee.department
            IdLabel.text = String(employee.studentId ?? 0)
            SportsLabel.text = employee.sportsName ?? "unknown"
            
            if let imgStr = employee.img{
                let img = UIImage(named: imgStr)
                    ImgView.image = img

            }
            var arrData:[TblModel] = [
                TblModel(title: "DOB", value: employee.dob),
                TblModel(title: "Student Id", value: String(employee.studentId ?? 0)),
                TblModel(title: "Gender", value: String(employee.gender ?? "unknown")),
                TblModel(title: "Sem One Grade", value: String(employee.semOneGrade ?? 0.0)),
                TblModel(title: "Sem Two Grade", value: String(employee.semTwoGrade ?? 0.0)),
                TblModel(title: "Sem Three Grade", value: String(employee.semThreeGrade ?? 0.0)),
                TblModel(title: "Sem Four Grade", value: String(employee.semFourGrade ?? 0.0)),
                TblModel(title: "Sem Five Grade", value: String(employee.semFiveGrade ?? 0.0)),
                TblModel(title: "Sem Six Grade", value: String(employee.semSixGrade ?? 0.0)),
                TblModel(title: "Address", value: String(employee.address ?? "unknown")),
            ]
            
            if employeeDataSourceDelegate == nil {
                employeeDataSourceDelegate = .init(arrData: arrData, delegate: self, tbl: TblView)
            }
        }
        
        
    }
}

extension EmployeeDetailsVC: TblViewDelegate{
    func didselect(tbl: UITableView, indexPath: IndexPath) {
        
    }
}
