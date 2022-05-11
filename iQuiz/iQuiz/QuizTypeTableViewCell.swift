//
//  QuizTypeTableViewCell.swift
//  iQuiz
//
//  Created by Patrick Liu on 5/11/22.
//

import UIKit

class QuizTypeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var quizTitle: UILabel!
    @IBOutlet weak var quizImageView: UIImageView!
    @IBOutlet weak var quizDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
