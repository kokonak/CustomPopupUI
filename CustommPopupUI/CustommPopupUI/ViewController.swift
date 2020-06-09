//
//  ViewController.swift
//  CustommPopupUI
//
//  Created by kokonak on 2020/06/09.
//  Copyright © 2020 kokonak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let showPopupButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        
        self.showPopupButton.setTitle("show pop-up", for: .normal)
        self.showPopupButton.backgroundColor = UIColor(red:0.03, green:0.02, blue:0.20, alpha:1.00)
        self.showPopupButton.layer.cornerRadius = 10
        self.showPopupButton.addTarget(self, action: #selector(showPopup(_:)), for: .touchUpInside)
        self.view.addSubview(self.showPopupButton)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.showPopupButton.frame.size = CGSize(width: 150, height: 50)
        self.showPopupButton.center = self.view.center
    }

    @objc func showPopup(_ sender: UIButton) {
        let popupCon: PopupViewController = PopupViewController()
        self.present(popupCon, animated: false, completion: nil)
    }

}

