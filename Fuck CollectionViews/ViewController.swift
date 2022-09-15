//
//  ViewController.swift
//  Fuck CollectionViews
//
//  Created by Theo Vora on 9/15/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var pizzaCollectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pizzaCollectionView.delegate = self
        pizzaCollectionView.dataSource = self
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
