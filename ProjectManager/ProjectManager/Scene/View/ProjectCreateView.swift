//
//  ProjectCreateView.swift
//  ProjectManager
//
//  Created by Groot on 2022/09/12.
//

import UIKit

private enum Design {
    static let titleTextFieldBorderWidth: CGFloat = 1
    static let bodyTextViewBorderWidth: CGFloat = 1
    static let mainStackViewTopAnchor: CGFloat = -8
    static let mainStackViewBottomAnchor: CGFloat = 8
    static let mainStackViewTrailngAnchor: CGFloat = -8
    static let mainStackViewLeadingAnchor: CGFloat = 8
    static let titleTextFieldPlaceholder = " Title"
}

final class ProjectCreateView: UIView {
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .systemBackground
        stackView.axis  = .vertical
        
        return stackView
    }()
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = Design.titleTextFieldBorderWidth
        textField.layer.borderColor = UIColor.systemGray5.cgColor
        textField.placeholder = Design.titleTextFieldPlaceholder
        textField.font = .preferredFont(forTextStyle: .title1)
        
        return textField
    }()
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        
        return datePicker
    }()
    
    private let bodyTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.borderWidth = Design.bodyTextViewBorderWidth
        textView.layer.borderColor = UIColor.systemGray5.cgColor
        textView.font = .preferredFont(forTextStyle: .body)
        
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func configureItem(title: String?, body: String?) {
        titleTextField.text = title
        bodyTextView.text = body
    }
    
    private func commonInit() {
        addSubview(mainStackView)
        backgroundColor = .systemBackground
        
        configureView()
        configureMainStackView()
        configureMainStackViewLayouts()
    }
    
    private func configureView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainStackView)
    }
    
    private func configureMainStackView() {
        [titleTextField, datePicker, bodyTextView].forEach { mainStackView.addArrangedSubview($0) }
    }
    
    private func configureMainStackViewLayouts() {
        NSLayoutConstraint.activate(
            [
                mainStackView.topAnchor
                    .constraint(equalTo: self.topAnchor,
                                constant: Design.mainStackViewTopAnchor),
                mainStackView.bottomAnchor
                    .constraint(equalTo: self.bottomAnchor,
                                constant: Design.mainStackViewBottomAnchor),
                mainStackView.leadingAnchor
                    .constraint(equalTo: self.leadingAnchor,
                                constant: Design.mainStackViewLeadingAnchor),
                mainStackView.trailingAnchor
                    .constraint(equalTo: self.trailingAnchor,
                                constant: Design.mainStackViewTrailngAnchor)
            ]
        )
    }
}