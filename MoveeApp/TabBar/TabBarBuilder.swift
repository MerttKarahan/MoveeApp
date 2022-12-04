//
//  TabBarBuilder.swift
//  MoveeApp
//
//  Created by Karahan, Mert on 1.12.2022.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTabBar()
    }
    
//    For set tab bar elements and set image
    func createTabBar() {
        
        let firstItem = MoviesBuilder.build()
        let secondItem = SeriesBuilder.build()
        
        firstItem.tabBarItem = UITabBarItem(title: nil, image: UIImage(named:"iconsTabbarMovie"), selectedImage: UIImage(named: "iconsTabbarMovieSelected"))
        secondItem.tabBarItem = UITabBarItem(title: nil, image: UIImage(named:"iconsTabbarSerie"), selectedImage: UIImage(named: "iconsTabbarSerieSelected"))
        
        self.setViewControllers([firstItem,secondItem], animated: true)
    }
}
