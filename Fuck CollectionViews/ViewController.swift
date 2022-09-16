//
//  ViewController.swift
//  Fuck CollectionViews
//
//  Created by Theo Vora on 9/15/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
    
    let pizzas = Array(repeating: UIImage(named: "PepCheese"), count: 10)
    
    // MARK: - Outlets
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var pizzaCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initSetup()
        applyConstraints()
        applyColors()
    }
    
    func initSetup() {
        pizzaCollectionView.delegate = self
        pizzaCollectionView.dataSource = self
        pizzaCollectionView.isPagingEnabled = true
        pizzaCollectionView.showsHorizontalScrollIndicator = false
        pageControl.numberOfPages = pizzas.count
    }
    
    func applyConstraints() {
        NSLayoutConstraint.activate([
            pizzaCollectionView.topAnchor.constraint(equalTo: stackView.topAnchor),
            pizzaCollectionView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            pizzaCollectionView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            pizzaCollectionView.heightAnchor.constraint(equalTo: pizzaCollectionView.widthAnchor)
        ])
    }
    
    func applyColors() {
        stackView.border(color: .systemGray, thickness: 0.4)
        pizzaCollectionView.border(color: .blue)
//        pageControl.border(color: .red)
        label.border(color: .green)
        pageControl.currentPageIndicatorTintColor = .systemGray
        pageControl.pageIndicatorTintColor = .systemGray3
        pageControl.backgroundColor = .systemGray6
        pageControl.layer.cornerRadius = 12.0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pizzas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pizzaCell", for: indexPath) as? PizzaCollectionViewCell else { return UICollectionViewCell() }
        cell.border(color: .red)
        cell.image = pizzas[indexPath.item]
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let length = collectionView.bounds.width
        return CGSize(width: length, height: length)
    }
}
