//
//  UserSaveVC.swift
//  UserAPP
//
//  Created by Ramin Bakhshaliyev on 06.09.24.
//

import UIKit

class UserSaveVC: UIViewController {
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfUserPhone: UITextField!
    
    
    var viewModel = UserSaveViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func buttonSave(_ sender: Any) {
    
        if let userName = tfUserName.text , let userPhone = tfUserPhone.text{
            viewModel.save(user_name: userName, user_phone: userPhone)
        }
    }
    
    
    
    
}
