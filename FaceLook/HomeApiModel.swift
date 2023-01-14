//
//  HomeApiModel.swift
//  FaceLook
//
//  Created by shoeb on 14/01/23.
//

import UIKit

class HomeApiModel: NSObject {
    
    var id : Int?
    var email : String?
    var first_name : String?
    var last_name : String?
    var avatar : String?
    
    init(dictionary : [String : Any]){
        super.init()
        id = dictionary["id"] as? Int
        email = dictionary["email"] as? String
        first_name = dictionary["first_name"] as? String
        last_name = dictionary["last_name"] as? String
        avatar = dictionary["avatar"] as? String
    }
    
}
