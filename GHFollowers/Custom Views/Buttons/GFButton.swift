//
//  GFButton.swift
//  GHFollowers
//
//  Created by Sean Allen on 12/28/19.
//  Copyright © 2019 Sean Allen. All rights reserved.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(backgroundColor: UIColor, title: String, systemImage: String) {
        self.init(frame: .zero)
        set(color: backgroundColor, title: title, image: systemImage)
    }
    
    
    private func configure() {
        configuration = .filled()
        configuration?.cornerStyle = .medium
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func set(color: UIColor, title: String, image: String) {
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = .white
        configuration?.title = title
        configuration?.image = UIImage(systemName: image)
        configuration?.imagePlacement = .leading
        configuration?.imagePadding = 8
    }
}
