//
//  InformationView.swift
//  MoveeApp
//
//  Created by Karahan, Mert on 1.12.2022.
//

import UIKit

class InformationView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }
    
    private func configureView() {
        guard let view = self.loadViewFromNib(nibName: "InformationView") else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
}
