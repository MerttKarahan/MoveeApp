//
//  MoviesBuilder.swift
//  MoveeApp
//
//  Created by Karahan, Mert on 1.12.2022.
//

import Foundation
import UIKit

struct MoviesBuilder {
    
    private init() {
    }
    
    static func build() -> UIViewController {
        let viewController = MoviesViewController()
        let viewModel = MoviesViewModel()
        
        viewController.moviesViewModel = viewModel
        viewModel.moviesViewModelDelegate = viewController
        return viewController
    }
}
