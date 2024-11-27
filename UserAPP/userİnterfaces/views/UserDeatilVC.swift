//
//  UserDeatilVC.swift
//  UserAPP
//
//  Created by Ramin Bakhshaliyev on 06.09.24.
//

import UIKit

class UserDeatilVC: UIViewController {
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfUserPhone: UITextField!
    
    var user:UsersModel?
    
    var viewModel = UserDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let us = user{
            tfUserName.text = us.user_name
            tfUserPhone.text = us.user_phon
        }

        
    }
    
    @IBAction func buttonUpdate(_ sender: Any) {
        
        if let un = tfUserName.text, let up = tfUserPhone.text, let us = user{
            viewModel.update(user: us, user_name: un, user_phone: up)
            
            
        }
        
        
    }
    
}
