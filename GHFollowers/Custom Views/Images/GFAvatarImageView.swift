//
//  GFAvatarImageView.swift
//  GHFollowers
//
//  Created by Juan Diego Ocampo on 14/08/2022.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let placeholderImage = UIImage(named: "avatar-placeholder")!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.image = placeholderImage
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
