//
//  MainPageViewModel.swift
//  UserAPP
//
//  Created by Ramin Bakhshaliyev on 17.11.24.
//

import Foundation
import RxSwift

class MainPageViewModel {
    var userRepository = UsersDAOrepository()
    var userLists = BehaviorSubject<[UsersModel]>(value: [UsersModel]())
    
    init(){
        userLists = userRepository.userLists
        userDownload()
    }
    
    
    
    func delete(user:UsersModel) {
        userRepository.delete(user:user)
    }
    
    func search(searchText:String){
        userRepository.search(searchText:searchText)
    }
    
    func userDownload(){
        userRepository.userDownload()
    }
}
