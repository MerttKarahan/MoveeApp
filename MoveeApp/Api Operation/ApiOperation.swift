//
//  ApiOperation.swift
//  MoveeApp
//
//  Created by Karahan, Mert on 1.12.2022.
//

import Foundation
import Alamofire

struct APIConstants {
    static var baseURL = "https://api.themoviedb.org/3"
    static var api_key: [String: Any] = ["api_key": "578da68e9b251f54713c69cb126db0d5"]
}


enum MovieAPIPaths: String {
    case popularMovies = "/movie/popular"
    case popularTvShows = "/tv/popular"
    case movieDetail = "/movie/%%"
    case tvDetail = "/tv/%%"
    case movieVideo = "/movie/%%/videos"
    case tvShowVideo = "/tv/%%/videos"
    case search = "/search/multi"
    case genres = "/genre/movie/list"
    
    
    var fullPath: String {
        return APIConstants.baseURL + self.rawValue
    }
    
    func fullPathWith(parameter: String) -> String {
        // replacingOccurrences string içerisinde verilen yere verilen string'i basar
        return APIConstants.baseURL + self.rawValue.replacingOccurrences(of: "%%", with: parameter)
    }
}

class MovieAppOperations{
    
    static let sharedInstance = MovieAppOperations()
    
    func getPopularMovies(finishGetPopularMovies: @escaping((Result<MoviesModelResponse, AFError>) -> Void)) {
        
        let request = AF.request(MovieAPIPaths.popularMovies.fullPath,
                                 method: .get,
                                 parameters: APIConstants.api_key,
                                 encoding: URLEncoding.default,
                                 headers: nil)
        
        request.responseDecodable(of: MoviesModelResponse.self) {response in
            if let value = response.value {
                finishGetPopularMovies(.success(value))
            } else if let error = response.error {
                finishGetPopularMovies(.failure(error))
            }
        }
    }
    
    func getGenres(finishGetGenres: @escaping((Result<GenresModelResponse, AFError>) -> Void)) {
        let request = AF.request(MovieAPIPaths.genres.fullPath,
                                 method: .get,
                                 parameters: APIConstants.api_key,
                                 encoding: URLEncoding.default,
                                 headers: nil)
        
        request.responseDecodable(of: GenresModelResponse.self) {response in
            if let value = response.value {
                finishGetGenres(.success(value))
            } else if let error = response.error {
                finishGetGenres(.failure(error))
            }
        }
    }
}
