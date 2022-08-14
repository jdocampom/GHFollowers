//
//  FollowerCell.swift
//  GHFollowers
//
//  Created by Juan Diego Ocampo on 14/08/2022.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    
    static let reuseID = "FollowerCell"
    
    private let padding = CGFloat(10)
    private let avatarImageView = GFAvatarImageView(frame: .zero)
    private let usernameLabel = GFTitleLabel(textAlignment: .center, fontSize: 15)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.configureAvatarImageView()
        self.configureUsernameLabel()
    }
    
    func set(with follower: Follower) {
        self.usernameLabel.text = follower.login
    }
    
    private func configureAvatarImageView() {
        self.addSubview(self.avatarImageView)
        NSLayoutConstraint.activate([
            self.avatarImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: self.padding),
            self.avatarImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: self.padding),
            self.avatarImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: self.padding * -1),
            self.avatarImageView.heightAnchor.constraint(equalTo: self.avatarImageView.widthAnchor)
        ])
    }
    
    private func configureUsernameLabel() {
        self.addSubview(self.usernameLabel)
        NSLayoutConstraint.activate([
            self.usernameLabel.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 12),
            self.usernameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: self.padding),
            self.usernameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: self.padding * -1),
            self.usernameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
}
