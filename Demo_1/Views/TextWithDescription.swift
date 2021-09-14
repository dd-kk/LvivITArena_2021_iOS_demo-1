//
//  TextWithDescription.swift
//  Demo_1
//
//  Created by Dmytro Kovryhin on 05.10.2021.
//

import UIKit

class TextWithDescription: UIView {
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let iconImageView = UIImageView(image: .init(named: "spot_hand"))
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .orange
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.font = .boldSystemFont(ofSize: 16)
        addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.numberOfLines = 0
        addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(greaterThanOrEqualToConstant: 60),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            iconImageView.heightAnchor.constraint(equalToConstant: 24.0),
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
        super.updateConstraints()
    }
}
