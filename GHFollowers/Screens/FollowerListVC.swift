//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by Juan Diego Ocampo on 14/08/2022.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username: String!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.prefersLargeTitles = true
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            switch result {
            case .success(let followers):
                print("Followers Count: \(followers.count)")
                print("Followers List: \(followers)")
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "ERROR", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
