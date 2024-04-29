//
//  StudentModel.swift
//  MainApp
//
//  Created by Viraj Joshi on 18/04/24.
//

import Foundation
class StudentModel : NSObject {
    var name : String!
    var id:String!
    var img : String!
    var mark : Int!
    
    init(fromDictionary dictionary : [String : Any]){
        name = dictionary["name"] as? String
        id = dictionary["id"] as? String
        img = dictionary["img"] as? String
        mark = dictionary["mark"] as? Int
    }
}
