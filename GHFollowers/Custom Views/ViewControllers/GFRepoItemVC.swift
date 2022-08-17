//
//  GFRepoItemVC.swift
//  GHFollowers
//
//  Created by Juan Diego Ocampo on 15/08/2022.
//

import UIKit

class GFRepoItemVC: GFItemInfoVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, with: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, with: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GITHUB_PROFILE")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }

}
