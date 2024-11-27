//
//  User.swift
//  UserAPP
//
//  Created by Ramin Bakhshaliyev on 06.09.24.
//

import Foundation

class User {
    var user_id: Int?
    var user_name: String?
    var user_phon: String?
    
    init(){
        
    }
    
    
    init(user_id: Int, user_name: String, user_phon: String) {
        self.user_id = user_id
        self.user_name = user_name
        self.user_phon = user_phon
    }
}
