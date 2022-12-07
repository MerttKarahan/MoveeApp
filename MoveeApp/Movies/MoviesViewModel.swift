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
    private var moviesModelResponse: MoviesModelResponse?
//    var genres: GenresModelResponse?
    private var itemGenres: [String] = []
    
    var numberOfItems: Int {
        self.moviesModelResponse?.results.count ?? 0
    }
    
    func itemAtIndex(at index: Int) -> InfoCardViewUIModel? {
        itemGenres.removeAll()
        return self.infoCardViewUIModel(index: index)
    }
    
    private func fetchGenres(index: Int) -> [String] {
        guard let genres = moviesModelResponse?.results[index].genre_ids else {return []}
        for element in GenresStorage.sharedGenresInstance.genresList {
            if genres.contains(element.id ?? 0) {
                itemGenres.append(element.name ?? "")
            }
        }
        return itemGenres
    }
    
    private func infoCardViewUIModel(index: Int) -> InfoCardViewUIModel {
        return InfoCardViewUIModel(poster_image: moviesModelResponse?.results[index].poster_path,
                                   title: moviesModelResponse?.results[index].title,
                                   subtitle: fetchGenres(index: index).joined(separator: ", "),
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
    
    func getGenres() {
        MovieAppOperations.sharedInstance.getGenres { response in
            switch response {
            case .success(let successResponse):
                GenresStorage.sharedGenresInstance.genresList = successResponse.genres
            case .failure(let error): break
            }
        }
    }
}
