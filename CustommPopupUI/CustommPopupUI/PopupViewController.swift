//
//  PopupViewController.swift
//  CustommPopupUI
//
//  Created by kokonak on 2020/06/09.
//  Copyright © 2020 kokonak. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {
    
    private let popupView: UIView = UIView()
    private let okButton: UIButton = UIButton()
    private let titleLabel: UILabel = UILabel()
    private let textLabel: UILabel = UILabel()

    init() {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .fullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        self.popupView.backgroundColor = UIColor.white
        self.popupView.layer.cornerRadius = 20
        self.view.addSubview(self.popupView)
        
        self.titleLabel.text = "Welcome!"
        self.titleLabel.textAlignment = .center
        self.titleLabel.textColor = UIColor.black
        self.titleLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        self.popupView.addSubview(self.titleLabel)
        
        self.textLabel.text = "this is a custom popup ui example"
        self.textLabel.textAlignment = .center
        self.textLabel.textColor = UIColor.black
        self.textLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        self.popupView.addSubview(self.textLabel)
        
        self.okButton.setTitle("OK", for: .normal)
        self.okButton.backgroundColor = UIColor(red:0.03, green:0.02, blue:0.20, alpha:1.00)
        self.okButton.layer.cornerRadius = 10
        self.okButton.addTarget(self, action: #selector(okButtonTouch(_:)), for: .touchUpInside)
        self.popupView.addSubview(self.okButton)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
        self.popupView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let margin: CGFloat = 20
        self.popupView.frame = CGRect(x: margin, y: (self.view.frame.height - 200)/2, width: self.view.frame.width - margin * 2, height: 200)
        
        let width: CGFloat = self.popupView.frame.width - margin * 2
        self.titleLabel.frame = CGRect(x: margin, y: margin, width: width, height: 30)
        
        let buttonHeight: CGFloat = 40
        self.okButton.frame = CGRect(x: margin, y: self.popupView.frame.height - margin - buttonHeight, width: width, height: buttonHeight)
        
        let height: CGFloat = (self.okButton.frame.minY - margin) - (self.titleLabel.frame.maxY + margin)
        self.textLabel.frame = CGRect(x: margin, y: self.titleLabel.frame.maxY + margin, width: width, height: height)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showPopup()
    }
    
    @objc private func okButtonTouch(_ sender: UIButton) {
        self.closePopup()
    }
    
    func showPopup() {
        DispatchQueue.main.async {
            self.popupView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.2, options: .curveLinear, animations: {
                self.popupView.transform = CGAffineTransform(scaleX: 1, y: 1)
            }) { (finished: Bool) in
                self.popupView.transform = CGAffineTransform.identity
            }
        }
    }
    func closePopup() {
        DispatchQueue.main.async {
            let fakeView: UIView = self.popupView.snapshotView(afterScreenUpdates: false)!
            fakeView.frame = self.popupView.frame
            self.view.addSubview(fakeView)

            self.popupView.isHidden = true
            UIView.animate(withDuration: 0.2, animations: {
                fakeView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            }, completion: { (finisehd: Bool) in
                self.dismiss(animated: false, completion: nil)
            })
        }
    }
}
