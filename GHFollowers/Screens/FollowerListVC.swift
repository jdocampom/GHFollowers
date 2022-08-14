//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by Juan Diego Ocampo on 14/08/2022.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username: String!
    var collectionView: UICollectionView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViewController()
        self.configureCollectionView()
        self.getFollowers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func configureViewController() {
        self.view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureCollectionView() {
        self.collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: UIHelpers.createThreeColumnFlowLayout(from: self.view))
        self.view.addSubview(self.collectionView)
        self.collectionView.backgroundColor = .systemPink
        self.collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }

    private func getFollowers() {
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

}
