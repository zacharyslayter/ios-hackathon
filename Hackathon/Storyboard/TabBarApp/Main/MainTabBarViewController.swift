//
//  MainTabBarViewController.swift
//  Shapes
//
//  Created by Zachary Slayter on 4/14/17.
//  Copyright © 2017 Credera. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var viewControllerArray = Array<UIViewController>()
        
        // Initialize the Tab Bar controllers via their respective storyboards
        // The TabBarItems with titles & icons are in each Storyboard's first scene
        
        let homeVC: UIViewController? = UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController()
        if homeVC != nil {
            viewControllerArray.append(homeVC!)
        }
        
        let exploreVC: UIViewController? = UIStoryboard(name: "Explore", bundle: nil).instantiateInitialViewController()
        if exploreVC != nil {
            viewControllerArray.append(exploreVC!)
        }
        
        self.setViewControllers(viewControllerArray, animated: false)
        
        // Default to the Home Tab
        self.setSelectedTab(Constants.TabBarScreens.home)
        
    }
    
    func setSelectedTab(_ tabBarScreen: Constants.TabBarScreens) {
        self.selectedIndex = tabBarScreen.rawValue
    }
    
}
