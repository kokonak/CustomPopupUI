//
//  ViewController.swift
//  CustommPopupUI
//
//  Created by kokonak on 2020/06/09.
//  Copyright © 2020 kokonak. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    private lazy var showPopupButton: UIButton = {
        let button = UIButton()
        button.setTitle("show pop-up", for: .normal)
        button.backgroundColor = UIColor(red:0.03, green:0.02, blue:0.20, alpha:1.00)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(showPopup), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = UIColor.white

        view.addSubview(showPopupButton)
        showPopupButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showPopupButton.widthAnchor.constraint(equalToConstant: 150),
            showPopupButton.heightAnchor.constraint(equalToConstant: 50),
            showPopupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showPopupButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func showPopup() {
        let popupCon: PopupViewController = PopupViewController()
        present(popupCon, animated: false, completion: nil)
    }
}

