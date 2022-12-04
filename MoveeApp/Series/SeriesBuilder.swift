//
//  SeriesBuilder.swift
//  MoveeApp
//
//  Created by Karahan, Mert on 1.12.2022.
//

import Foundation
import UIKit

struct SeriesBuilder {
    
    private init() {
        
    }
    
    static func build() -> UIViewController {
        let viewController = SeriesViewController()
        let viewModel = SeriesViewModel()
        let model = SeriesModel()
        
        viewController.seriesViewModel = viewModel
        viewModel.seriesModel = model
        return viewController
    }
}
