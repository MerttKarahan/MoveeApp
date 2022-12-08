//
//  SplashViewController.swift
//  MoveeApp
//
//  Created by Karahan, Mert on 5.12.2022.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            let tabbarViewController = TabBarViewController()
            let navigationController = UINavigationController(rootViewController: tabbarViewController)
            UIApplication.window?.rootViewController = navigationController
        }
    }
}
