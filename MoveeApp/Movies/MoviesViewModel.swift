//
//  MoviesViewModel.swift
//  MoveeApp
//
//  Created by Karahan, Mert on 1.12.2022.
//

import Foundation
import UIKit

protocol MoviesViewModelDelegate: AnyObject {
    func reloadData()
}

class MoviesViewModel {
    weak var moviesViewModelDelegate: MoviesViewModelDelegate?
    var moviesModelResponse: MoviesModelResponse?
    
    var numberOfItems: Int {
        self.moviesModelResponse?.results.count ?? 0
    }
    
    func itemAtIndex(at index: Int) -> InfoCardViewUIModel? {
        return self.infoCardViewUIModel(index: index)
    }
    
    func infoCardViewUIModel(index: Int) -> InfoCardViewUIModel {
        return InfoCardViewUIModel(poster_image: moviesModelResponse?.results[index].poster_path,
                                   title: moviesModelResponse?.results[index].title,
                                   subtitle: "",
                                   release_date: moviesModelResponse?.results[index].release_date,
                                   vote_average: String(moviesModelResponse?.results[index].vote_average ?? 1.1),
                                   average_image: "star",
                                   infoIcon: "calendar")
    }
    
    func getPopularMovies() {
        MovieAppOperations.sharedInstance.getPopularMovies { response in
            switch response {
            case .success(let successResponse):
                self.moviesModelResponse = successResponse
                self.moviesViewModelDelegate?.reloadData()
            case.failure(let error): break
                
            }
        }
    }
}
