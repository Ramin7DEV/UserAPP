//
//  UserSaveViewModel.swift
//  UserAPP
//
//  Created by Ramin Bakhshaliyev on 17.11.24.
//

import Foundation


class UserSaveViewModel {
    
    var userRepository = UsersDAOrepository()
    
    func save(user_name:String,user_phone:String){
        userRepository.save(user_name: user_name, user_phone: user_phone)
    }
}
