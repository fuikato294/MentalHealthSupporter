//
//  CustomTableViewCell.swift
//  MentalHealthSupporter
//
//  Created by fumitaka katou on 2021/06/23.
//

import UIKit
import FirebaseUI

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var stepButton: UIButton!
    @IBOutlet weak var stepLabelText: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    // データの受け取り口
    var title : String? {
        didSet {
            stepLabelText.text = title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // PostDataの内容をセルに表示
    func setPostData(_ stepData: StepData) {

        // checkボタンの表示
        if stepData.isCompleted {
            let buttonImage = UIImage(named: "check complete")
            self.checkButton.setImage(buttonImage, for: .normal)
        } else {
            let buttonImage = UIImage(named: "check incomplete")
            self.checkButton.setImage(buttonImage, for: .normal)
        }
    }

}
