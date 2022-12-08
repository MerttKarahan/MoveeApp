//
//  InfoCardTableViewCell.swift
//  MoveeApp
//
//  Created by Karahan, Mert on 1.12.2022.
//

import UIKit

class InfoCardTableViewCell: UITableViewCell {

    
    @IBOutlet private weak var shadowView: UIView!
    @IBOutlet private weak var infoCarView: InfoCard!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setCellDesign()
    }
    
    func configure(model: InfoCardViewUIModel) {
        infoCarView.configure(model: model)
    }
    
    func setCellDesign() {
        self.layer.masksToBounds = false
        self.contentView.layer.masksToBounds = false
        infoCarView.layer.cornerRadius = 8
        infoCarView.layer.masksToBounds = true

        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowOffset = .init(width: 0, height: 5)
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOpacity = 0.1
        shadowView.layer.shadowRadius = 10
        shadowView.layer.cornerRadius = 8

    }
}
