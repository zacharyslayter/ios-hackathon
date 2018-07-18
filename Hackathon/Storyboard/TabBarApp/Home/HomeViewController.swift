//
//  HomeViewController.swift
//  Shapes
//
//  Created by Zachary Slayter on 4/14/17.
//  Copyright © 2017 Credera. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var logInIcon: UIImageView!
    @IBOutlet var registerIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = HomeNavBar()
        
        logInIcon.setTint(color: Constants.ColorScheme.primary)
        registerIcon.setTint(color: Constants.ColorScheme.primary)
        
//        do {
//            try AccountLoginEndpoints.impl.login(username: "Test", password: "Test", onCompletion: { (account) in }, onError: { (error) in })
//        } catch {
//            print("caught exception)")
//        }
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func loginBtnClicked(_ sender: UIButton) {
        let loginViewController = UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController()
        if loginViewController != nil {
            navigationController?.pushViewController(loginViewController!, animated: true)
        }
    }
    
}
