//
//  ViewController.swift
//  AutoLayout
//
//  Created by Olaf Bergmann on 13/06/2019.
//  Copyright © 2019 Olaf Bergmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let box4NowImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "box4now"))
        //enables autlayout for out imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(descriptionTextView)
        setupLayout()
        
    }
    
    private func setupLayout() {
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topImageContainerView.addSubview(box4NowImageView)
        box4NowImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        box4NowImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        box4NowImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    

}

