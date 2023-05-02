//
//  SliderCell.swift
//  SelfIntroductionApp
//
//  Created by Watanabe Kazuyuki on 2023/04/30.
//

import UIKit

class SliderCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage! {
        didSet {
            imageView.image = image
        }
    }
    
}
