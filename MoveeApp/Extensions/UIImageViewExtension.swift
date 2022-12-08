//
//  UIImageViewExtension.swift
//  MoveeApp
//
//  Created by Karahan, Mert on 2.12.2022.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(poster_path: String) {
        let url = URL(string: "https://image.tmdb.org/t/p/w500" + poster_path)
        self.kf.setImage(with: url)
    }
}
