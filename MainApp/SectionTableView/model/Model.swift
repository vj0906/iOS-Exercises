//
//  Model.swift
//  MainApp
//
//  Created by Viraj Joshi on 18/04/24.
//

import Foundation
class Model : NSObject {
    var name : String!
    var dob:String!
    var department : String!
    var img: String?
    
    
    
    init(fromDictionary dictionary : [String : Any]){
        name = dictionary["name"] as? String
        dob = dictionary["dob"] as? String
        department = dictionary["department"] as? String
        if let tempImg: String = dictionary["img"] as? String {
            img = tempImg
        }
    }
}
