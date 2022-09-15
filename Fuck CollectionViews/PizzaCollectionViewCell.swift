//
//  PizzaCollectionViewCell.swift
//  Fuck CollectionViews
//
//  Created by Theo Vora on 9/15/22.
//

import UIKit

class PizzaCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var pizzaImageView: UIImageView!
    
    var image: UIImage? {
        didSet {
            DispatchQueue.main.async {
                self.pizzaImageView.image = self.image
            }
        }
    }
}
