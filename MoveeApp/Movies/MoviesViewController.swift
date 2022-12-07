//
//  MoviesViewController.swift
//  MoveeApp
//
//  Created by Karahan, Mert on 1.12.2022.
//

import UIKit

class MoviesViewController: UIViewController {
    
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private weak var movieTitleBackgrounView: UIView!
    @IBOutlet private weak var popularMovieTableView: UITableView!
    @IBOutlet private weak var responseTitleLabel: UILabel!
    
    var moviesViewModel: MoviesViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        moviesViewModel?.getPopularMovies()
        setTitle()
    }
}

extension MoviesViewController: MoviesViewModelDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.popularMovieTableView.reloadData()
        }
    }
}


private extension MoviesViewController {
    func tableViewSetup() {
        self.popularMovieTableView.delegate = self
        self.popularMovieTableView.dataSource = self
        self.popularMovieTableView.register(.init(nibName: "InfoCardTableViewCell", bundle: nil), forCellReuseIdentifier: "InfoCardTableViewCell")
    }
    
    func setTitle() {
        responseTitleLabel.text = "Popular"
    }
}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let items = moviesViewModel?.numberOfItems else { return 0 }
        return items
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCardTableViewCell", for: indexPath) as? InfoCardTableViewCell else { return UITableViewCell() }
        if let model = moviesViewModel?.itemAtIndex(at: indexPath.row) {
            cell.configure(model: model)
        }
        return cell
    }
    
}
