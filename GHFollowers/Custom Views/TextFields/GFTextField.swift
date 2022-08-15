//
//  GFTextField.swift
//  GHFollowers
//
//  Created by Juan Diego Ocampo on 13/08/2022.
//

import UIKit

class GFTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.systemGray4.cgColor
        self.textColor = .label
        self.tintColor = .label
        self.textAlignment = .center
        self.font = UIFont.preferredFont(forTextStyle: .title3)
        self.adjustsFontSizeToFitWidth = true
        self.minimumFontSize = 12
        self.backgroundColor = .tertiarySystemBackground
        self.autocorrectionType = .no
        self.placeholder = NSLocalizedString("ENTER_USERNAME", comment: "")
        self.returnKeyType = .go
        self.autocapitalizationType = .none
    }

}
