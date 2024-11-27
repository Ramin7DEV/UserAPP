//
//  UserDetailViewModel.swift
//  UserAPP
//
//  Created by Ramin Bakhshaliyev on 17.11.24.
//

import Foundation


class UserDetailViewModel {
    
    var userRepository = UsersDAOrepository()

    func update(user:UsersModel, user_name: String, user_phone: String) {
        userRepository.update(user: user, user_name: user_name, user_phone: user_phone)
        
    }
    
    
    
    
}
