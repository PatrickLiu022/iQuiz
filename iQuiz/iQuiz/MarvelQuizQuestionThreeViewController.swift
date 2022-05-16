//
//  MarvelQuizQuestionThreeViewController.swift
//  iQuiz
//
//  Created by Patrick Liu on 5/16/22.
//

import UIKit

class MarvelQuizQuestionThreeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!

    let answers = ["62", "78", "3", "85"]
    var isCorrect = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "AnswerCollectionViewCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "AnswerCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        nextButton.isEnabled = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVC = segue.destination as? MarvelQuizAnswerThreeViewController {
            
            let selectedAnswer = isCorrect ? "You are Correct!" : "You are Wrong!"
            let correctAnswer = "Answer: 85"
            
            destVC.resultsArray[0] = selectedAnswer
            destVC.resultsArray[1] = correctAnswer
        }
    }
}

extension MarvelQuizQuestionThreeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        nextButton.isEnabled = true
        if (indexPath.row == 3) {
            isCorrect = true
        } else {
            isCorrect = false
        }
    }
}


extension MarvelQuizQuestionThreeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return answers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnswerCollectionViewCell", for: indexPath) as! AnswerCollectionViewCell
        cell.answerChoiceLabel.text = answers[indexPath.row]
        return cell
    }
}
