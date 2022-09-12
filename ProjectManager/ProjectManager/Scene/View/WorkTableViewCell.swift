//
//  WorkTableViewCell.swift
//  ProjectManager
//
//  Created by Groot on 2022/09/08.
//

import UIKit

private enum Design {
    static let cellReuseIdentifier = "WorkTableViewCell"
    static let mainStackViewLeadingAnchor: CGFloat = 8
    static let mainStackViewTrailingAnchor: CGFloat = -8
}

final class WorkTableViewCell: UITableViewCell {
    static let reuseIdentifier = Design.cellReuseIdentifier
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalCentering
        stackView.axis  = .vertical
        
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title1)
        
        return label
    }()
    
    private let bodyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .footnote)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func setItems(title: String?, body: String?, date: String?) {
        titleLabel.text = title
        bodyLabel.text = body
        dateLabel.text = date
    }
    
    private func commonInit() {
        configureView()
        configureMainStackViewLayouts()
    }
    
    private func configureView() {
        contentView.addSubview(mainStackView)
        [titleLabel, bodyLabel, dateLabel].forEach { mainStackView.addArrangedSubview($0) }
    }
    
    private func configureMainStackViewLayouts() {
        NSLayoutConstraint.activate(
            [
                mainStackView.topAnchor
                    .constraint(equalTo: contentView.topAnchor),
                mainStackView.bottomAnchor
                    .constraint(equalTo: contentView.bottomAnchor),
                mainStackView.leadingAnchor
                    .constraint(equalTo: contentView.leadingAnchor,
                                constant: Design.mainStackViewLeadingAnchor),
                mainStackView.trailingAnchor
                    .constraint(equalTo: contentView.trailingAnchor,
                                constant: Design.mainStackViewTrailingAnchor)
            ]
        )
    }
}