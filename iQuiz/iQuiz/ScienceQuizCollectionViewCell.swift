//
//  ScienceQuizCollectionViewCell.swift
//  iQuiz
//
//  Created by Patrick Liu on 5/13/22.
//

import UIKit

class ScienceQuizCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var answerLabel: UILabel!
    
    func configure(with answer: String) {
        answerLabel.text = answer
    }
    
}
