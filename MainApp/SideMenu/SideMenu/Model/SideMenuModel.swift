//
//  SideMenuModel.swift
//  MainApp
//
//  Created by Viraj Joshi on 22/04/24.
//

import Foundation

class SideMenuModel : NSObject {
    var TitleKey:String
    let storyboardID:String
    let Image:String
    var expanded : Bool
   
enum keys: String {
case TitleKey
    case storyboardID
    case Image
    case expanded
    
}
    init(dict : [String:Any]){
        self.TitleKey = dict[keys.TitleKey.rawValue] as? String ?? ""
        self.storyboardID = dict[keys.storyboardID.rawValue] as? String ?? ""
        self.Image = dict[keys.Image.rawValue] as? String ?? ""
        self.expanded = false
    }
}
