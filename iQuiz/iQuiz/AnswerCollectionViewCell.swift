//
//  AnswerCollectionViewCell.swift
//  iQuiz
//
//  Created by Patrick Liu on 5/14/22.
//

import UIKit

class AnswerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var answerChoiceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override var isSelected: Bool {
        didSet {
            self.answerChoiceLabel.backgroundColor = isSelected ? UIColor.systemPurple : UIColor.systemTeal
        }
    }

}
