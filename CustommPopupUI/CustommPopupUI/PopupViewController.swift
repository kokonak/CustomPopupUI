//
//  PopupViewController.swift
//  CustommPopupUI
//
//  Created by kokonak on 2020/06/09.
//  Copyright © 2020 kokonak. All rights reserved.
//

import UIKit

final class PopupViewController: UIViewController {
    
    private let popupView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 20
        return view
    }()

    private lazy var okButton: UIButton = {
        let button = UIButton()
        button.setTitle("OK", for: .normal)
        button.backgroundColor = UIColor(red:0.03, green:0.02, blue:0.20, alpha:1.00)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(okButtonTouch), for: .touchUpInside)
        return button
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome!"
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()

    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "this is a custom popup ui example"
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .fullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = UIColor.white.withAlphaComponent(0.5)

        view.addSubview(popupView)
        popupView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            popupView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            popupView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            popupView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
        ])

        popupView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: popupView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -20)
        ])

        popupView.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            textLabel.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -20),
        ])

        popupView.addSubview(okButton)
        okButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            okButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 20),
            okButton.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 20),
            okButton.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -20),
            okButton.bottomAnchor.constraint(equalTo: popupView.bottomAnchor, constant: -20),
            okButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        popupView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showPopup()
    }
    
    @objc private func okButtonTouch() {
        closePopup()
    }

    private func showPopup() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.6,
            initialSpringVelocity: 0.2,
            options: .curveLinear
        ) {
            self.popupView.transform = CGAffineTransform.identity
        }
    }

    private func closePopup() {
        UIView.animate(withDuration: 0.2, animations: {
            self.popupView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        }, completion: { (finisehd: Bool) in
            self.dismiss(animated: false, completion: nil)
        })
    }
}
