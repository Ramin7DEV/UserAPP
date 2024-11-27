//
//  UsersDAOrepository.swift
//  UserAPP
//
//  Created by Ramin Bakhshaliyev on 17.11.24.
//

import Foundation
import RxSwift
import CoreData

class UsersDAOrepository{
    var userLists = BehaviorSubject<[UsersModel]>(value: [UsersModel]())
    
    let context = appDelegate.persistentContainer.viewContext
    
    
    func save(user_name:String,user_phone:String){
        let user = UsersModel(context: context)
        user.user_name = user_name
        user.user_phon = user_phone
        
        appDelegate.saveContext()
        
    }
    
    func update(user:UsersModel, user_name: String, user_phone: String) {
        user.user_name = user_name
        user.user_phon = user_phone
        
        appDelegate.saveContext()
        
    }
    
    func delete(user:UsersModel) {
        context.delete(user)
        appDelegate.saveContext()
        userDownload()
    }
    
    func search(searchText:String){
        do{
            let fr = UsersModel.fetchRequest()
            fr.predicate = NSPredicate(format: "user_name CONTAINS[c] %@", searchText)
            
            
            let list = try context.fetch(fr)
            userLists.onNext(list)
            
        }catch{
            print(error.localizedDescription)
        }
    }
    
    
    func userDownload(){
        do{
            let list = try context.fetch(UsersModel.fetchRequest())
            userLists.onNext(list)
            
        }catch{
            print(error.localizedDescription)
        }
    }
}
