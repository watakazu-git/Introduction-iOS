//
//  SliderCell.swift
//  SelfIntroduction
//
//  Created by Watanabe Kazuyuki on 2023/04/30.
//

import UIKit

class SliderCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    
    var image: UIImage! {
        didSet {
            imgView.image = image
        }
    }
}
