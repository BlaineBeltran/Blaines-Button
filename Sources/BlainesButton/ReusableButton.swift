//
//  ReusableButton.swift
//  Creating A Module
//
//  Created by Blaine Beltran on 3/11/23.
//

import UIKit

/// The custom button that was created by Blaine to be used by others.
public class BlainesButton: UIButton {
    
    public override var isHighlighted: Bool {
        didSet {
            self.alpha = isHighlighted ? 0.4 : 1
        }
    }
    
    public var label: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.text = "Hello - From Blaine"
        textLabel.textColor = .white
        return textLabel
    }()
    
    public var icon: UIImageView = {
        let image = UIImage(systemName: "house.fill")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .white
        return imageView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemPink
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureButton() {
        
        self.layer.cornerRadius = 15
        
        stackView.addArrangedSubviews(icon, label)
        addSubview(stackView)
        
       
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
