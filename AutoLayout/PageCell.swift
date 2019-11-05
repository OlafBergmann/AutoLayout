//
//  PageCell.swift
//  AutoLayout
//
//  Created by Olaf Bergmann on 05/07/2019.
//  Copyright © 2019 Olaf Bergmann. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard let unwrappedPage = page else { return }
            box4NowImageView.image = UIImage(named: unwrappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18) ])
            attributedText.append(NSAttributedString(string: "\n\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    private let box4NowImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "box4now"))
        //enables autlayout for out imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Get Box4Now now!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18) ])
        attributedText.append(NSAttributedString(string: "\n\n\nSending packages never be that easy! Download the app and send packages from home.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    private func setupLayout() {
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContainerView.addSubview(box4NowImageView)
        box4NowImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        box4NowImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        box4NowImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        addSubview(descriptionTextView)
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
