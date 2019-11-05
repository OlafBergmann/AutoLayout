//
//  SwipingController.swift
//  AutoLayout
//
//  Created by Olaf Bergmann on 05/07/2019.
//  Copyright © 2019 Olaf Bergmann. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [ Page(imageName: "box4now", headerText: "Join use today and send packages as fast like never befor",bodyText:"Sending packages never be that easy! Download the app and send packages from home." ), Page(imageName: "todo", headerText: "ToDo application",bodyText: "ToDo gona help you with what you have to do")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBottomControls()
        collectionView.backgroundColor  = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            
            if self.pageControl.currentPage == 0 {
                self.collectionView.contentOffset = .zero
            } else {
                let indexPath = IndexPath(item: self.pageControl.currentPage,section: 0)
                self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }) { (_) in
            
        }
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(x/view.frame.width)
    }
    
    fileprivate func setupBottomControls() {
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    @objc private func handlePrev() {
        
        let prevIndex = max(pageControl.currentPage-1, 0)
        
        let indexPath = IndexPath(item: prevIndex, section: 0)
        pageControl.currentPage = prevIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .red
        pc.pageIndicatorTintColor = .gray
        return pc
    } ()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func handleNext() {
        
        let nextIndex = min(pageControl.currentPage+1, pages.count-1)
        
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        
        cell.page = page
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
