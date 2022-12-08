//
//  CellView.swift
//  MoveeApp
//
//  Created by Karahan, Mert on 1.12.2022.
//

import UIKit
final class InfoCard: UIView {
    
    @IBOutlet private weak var originalTitle: UILabel!
    @IBOutlet private weak var posterImage: UIImageView!
    @IBOutlet private weak var genreIds: UILabel!
    @IBOutlet private weak var dateIcon: UIImageView!
    @IBOutlet private weak var releaseDate: UILabel!
    @IBOutlet private weak var voteAverage: UILabel!
    @IBOutlet private weak var voteAverageView: UIView!
    @IBOutlet private weak var starIcon: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
        self.setVoteAverageView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupUI()
        self.setVoteAverageView()
    }
    
    private func setupUI() {
        guard let view = self.loadViewFromNib(nibName: "InfoCard") else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func configure(model: InfoCardViewUIModel) {
        originalTitle.text = model.title
        posterImage.setImage(poster_path: model.poster_image ?? "")
        genreIds.text = model.subtitle
        voteAverage.text = model.vote_average
        releaseDate.text = model.release_date
        starIcon.image = UIImage(named: model.average_image ?? "")
        dateIcon.image = UIImage(named: model.infoIcon ?? "")
    }
    
    func setVoteAverageView() {
        voteAverageView.layer.cornerRadius = 11
    }
}
