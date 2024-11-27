//
//  ViewController.swift
//  UserAPP
//
//  Created by Ramin Bakhshaliyev on 06.09.24.
//

import UIKit

class MainPage: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var userTableView: UITableView!
    
    var userList = [UsersModel]()
    var viewModel = MainPageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        userTableView.delegate = self
        userTableView.dataSource = self
        
        _ = viewModel.userLists.subscribe(onNext:  { userList in
            self.userList = userList
            self.userTableView.reloadData()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.userDownload()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let user = sender as? UsersModel{
                let toGo_VC = segue.destination as! UserDeatilVC
                toGo_VC.user = user
            }
            
        }
    }
}


extension MainPage : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""{
            viewModel.userDownload()
        }else {
            viewModel.search(searchText: searchText)
        }
    }
}



extension MainPage : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = userList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "userTBC") as! UserTableViewCell
        
        cell.LableUserName.text = user.user_name
        cell.LableUserPhone.text = user.user_phon
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = userList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: user)
        tableView.deselectRow(at: indexPath, animated: true )
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deletAction = UIContextualAction(style: .destructive, title: "Delet"){contextualAction, view, bool in
            let user = self.userList[indexPath.row]
            
            let alert = UIAlertController(title: "Deletion", message: "\(user.user_name!) delete?", preferredStyle: .alert)
            
            let cancleAlert = UIAlertAction(title: "Cancle", style: .cancel)
            alert.addAction(cancleAlert)
            
            let yesAlert = UIAlertAction(title: "Yes", style: .destructive){ action in
                self.viewModel.delete(user:user)
                
            }
            alert.addAction(yesAlert)
            
            self.present(alert, animated: true)
            
        }
        return UISwipeActionsConfiguration(actions: [deletAction])
    }
}
