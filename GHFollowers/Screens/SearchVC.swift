//
//  SearchVC.swift
//  GHFollowers
//
//  Created by Juan Diego Ocampo on 13/08/2022.
//

import UIKit

class SearchVC: UIViewController {
    
    private let logoImageView = UIImageView()
    private let usernameTextField = GFTextField()
    private let getFollowersButton = GFButton(backgroundColor: .systemGreen, title: "GET_FOLLOWERS")
    
    private var isUsernameValid: Bool {
        guard let text = self.usernameTextField.text else { return false }
        return !text.isEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.configureLogoImageView()
        self.configureUsernameTextField()
        self.configureGetFollowersButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @objc private func pushFollowerLisrVC() {
        guard isUsernameValid else {
            self.presentGFAlertOnMainThread(title: "EMPTY_USERNAME_TITLE", message: "EMPTY_USERNAME_MESSAGE", buttonTitle: "OK")
            return
        }
        let followerListVC = FollowerListVC()
        followerListVC.username = self.usernameTextField.text
        followerListVC.title = self.usernameTextField.text
        self.navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    private func configureLogoImageView() {
        self.view.addSubview(self.logoImageView)
        self.logoImageView.translatesAutoresizingMaskIntoConstraints = false
        self.logoImageView.image = UIImage(named: "gh-logo")!
        NSLayoutConstraint.activate([
            self.logoImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 80),
            self.logoImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.logoImageView.heightAnchor.constraint(equalToConstant: 200),
            self.logoImageView.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    private func configureUsernameTextField() {
        self.view.addSubview(self.usernameTextField)
        self.usernameTextField.delegate = self
        NSLayoutConstraint.activate([
            self.usernameTextField.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 48),
            self.usernameTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            self.usernameTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
            self.usernameTextField.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    private func configureGetFollowersButton() {
        self.view.addSubview(self.getFollowersButton)
        self.getFollowersButton.addTarget(self, action: #selector(self.pushFollowerLisrVC), for: .touchUpInside)
        NSLayoutConstraint.activate([
            self.getFollowersButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            self.getFollowersButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            self.getFollowersButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
            self.getFollowersButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }

}

extension SearchVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.usernameTextField.resignFirstResponder()
        self.pushFollowerLisrVC()
        return true
    }
    
}
