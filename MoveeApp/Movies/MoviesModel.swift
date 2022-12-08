//
//  MoviesModel.swift
//  MoveeApp
//
//  Created by Karahan, Mert on 1.12.2022.
//

import Foundation
import UIKit

struct MoviesModelResponse: Decodable {
    var page: Int?
    var results: [MoviesModelItem]
}

struct MoviesModelItem: Decodable {
    
    var title: String?
    var poster_path: String?
    var genre_ids: [Int]
    var release_date: String?
    var vote_average: Double
}

struct GenresModelResponse: Decodable {
    var genres: [GenresItems]
}

struct GenresItems: Decodable {
    var id: Int?
    var name: String?
}
