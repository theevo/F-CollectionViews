//
//  ViewController.swift
//  Fuck CollectionViews
//
//  Created by Theo Vora on 9/15/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var pizzaCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pizzaCollectionView.delegate = self
        pizzaCollectionView.dataSource = self
        
        applyConstraints()
        applyColors()
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
        pageControl.border(color: .red)
        label.border(color: .green)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pizzaCell", for: indexPath) as? PizzaCollectionViewCell else { return UICollectionViewCell() }
        cell.backgroundColor = UIColor.systemRed
        cell.image = UIImage(named: "PepCheese")
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let length = collectionView.bounds.width
        return CGSize(width: length, height: length)
    }
}
