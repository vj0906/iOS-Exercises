//
//  WebService.swift
//  MainApp
//
//  Created by Viraj Joshi on 18/04/24.
//

import Foundation

class WebService: NSObject {
    func getStudentList(block : ([Model]) -> Swift.Void){
        var responsemodel =  [Model]()
        let dict = readJsonFile(ofName: "employeeList")
        if let arr = dict["StudentList"] as? [[String : Any]]{
            responsemodel =  arr.map({ Model(fromDictionary: $0)})
        }
        block(responsemodel)
    }
    
    
    func readJsonFile(ofName: String) -> [String : Any] {
        guard let strPath = Bundle.main.path(forResource: ofName, ofType: ".json") else {
            return [:]
        }
        do {
          
            let data = try Data(contentsOf: URL(fileURLWithPath: strPath), options: .alwaysMapped)
            
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            if let dictJson = jsonResult as? [String : Any] {
                return dictJson
            }
        } catch {
            print("Error!! Unable to parse ")
        }
        return [:]
    }
}
