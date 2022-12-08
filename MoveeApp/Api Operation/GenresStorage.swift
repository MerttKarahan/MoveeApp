//
//  GenresStorage.swift
//  MoveeApp
//
//  Created by Karahan, Mert on 6.12.2022.
//

import Foundation

struct GenresStorage {
    static var sharedGenresInstance = GenresStorage()
    var genresList: [GenresItems] = []
}
