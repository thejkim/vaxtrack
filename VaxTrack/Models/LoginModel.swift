//
//  LoginModel.swift
//  Capstone Project iOS
//
//  Created by user195697 on 4/29/21.
//

import Foundation

class LoginModel: NSObject {
    
    //properties
    
    var uid: Int?
    var type: String?
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    init(uid: Int, type: String) {
        
        self.uid = uid
        self.type = type
 
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "UID: \(uid ?? 0), Type: \(type ?? "")"
    }
}
