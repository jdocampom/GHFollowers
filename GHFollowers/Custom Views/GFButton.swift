//
//  GFButton.swift
//  GHFollowers
//
//  Created by Juan Diego Ocampo on 13/08/2022.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(NSLocalizedString(title, comment: ""), for: .normal)
        self.configure()
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 10
        self.titleLabel?.textColor = .white
        self.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    }
    
}
