//
//  CollectionViewCell.swift
//  MentalHealthSupporter
//
//  Created by fumitaka katou on 2021/07/01.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {


    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var topicName: UILabel!
    var image: UIImage? {
        didSet {
            cellImage.image = image
        }
    }
    var topic: String? {
        didSet {
            topicName.text = topic
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        // cellの枠の太さ
        self.layer.borderWidth = 1.0
        // cellの枠の色
        self.layer.borderColor = UIColor.black.cgColor
        // cellを丸くする
        self.layer.cornerRadius = 8.0
    }
}
