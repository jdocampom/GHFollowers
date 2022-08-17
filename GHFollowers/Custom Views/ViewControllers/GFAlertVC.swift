//
//  GFAlertVC.swift
//  GHFollowers
//
//  Created by Juan Diego Ocampo on 14/08/2022.
//

import UIKit

class GFAlertVC: UIViewController {
    
    private let containerView   = GFAlertContainerView()
    private let titleLabel      = GFTitleLabel(textAlignment: .center, fontSize: 20)
    private let messageLabel    = GFBodyLabel(textAlignment: .center)
    private let actionButton    = GFButton(backgroundColor: .systemPink, title: "OK")
    private let padding         = CGFloat(20)

    private var alertTitle: String?
    private var alertMessage: String?
    private var buttonTitle: String?
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle     = title
        self.alertMessage   = message
        self.buttonTitle    = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        self.configureContainerView()
        self.configureTitleLabel()
        self.configureActionButton()
        self.configureMessageLabel()
    }
    
    private func configureContainerView() {
        self.view.addSubview(self.containerView)
        NSLayoutConstraint.activate([
            self.containerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.containerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.containerView.widthAnchor.constraint(equalToConstant: 280),
            self.containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    private func configureTitleLabel() {
        self.containerView.addSubview(self.titleLabel)
        self.titleLabel.text = self.alertTitle ?? "SOMETHING_WENT_WRONG"
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: self.padding),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: self.padding),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: self.padding * -1),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    private func configureActionButton() {
        self.containerView.addSubview(self.actionButton)
        self.actionButton.setTitle(self.buttonTitle ?? "OK", for: .normal)
        self.actionButton.addTarget(self, action: #selector(self.dismissAlertVC), for: .touchUpInside)
        NSLayoutConstraint.activate([
            self.actionButton.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: self.padding * -1),
            self.actionButton.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: self.padding),
            self.actionButton.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: self.padding * -1),
            self.actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func configureMessageLabel() {
        self.containerView.addSubview(self.messageLabel)
        self.messageLabel.text = self.alertMessage ?? "UNABLE_TO_COMPLETE_REQUEST"
        self.messageLabel.numberOfLines = 4
        NSLayoutConstraint.activate([
            self.messageLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 8),
            self.messageLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: self.padding),
            self.messageLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: self.padding * -1),
            self.messageLabel.bottomAnchor.constraint(equalTo: self.actionButton.topAnchor, constant: -12)
        ])
    }
    
    @objc private func dismissAlertVC() {
        self.dismiss(animated: true)
    }

}
