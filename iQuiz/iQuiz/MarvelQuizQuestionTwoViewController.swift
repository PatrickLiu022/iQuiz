//
//  MarvelQuizQuestionTwoViewController.swift
//  iQuiz
//
//  Created by Patrick Liu on 5/16/22.
//

import UIKit

class MarvelQuizQuestionTwoViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    
    let answers = ["Silver Surfer", "Iron Man", "Spider Man", "Uncle Ben"]
    var isCorrect = false
    var score = 0
    var currentScore = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let cellQ2Nib = UINib(nibName: "AnswerCollectionViewCell", bundle: nil)
        collectionView.register(cellQ2Nib, forCellWithReuseIdentifier: "AnswerCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        nextButton.isEnabled = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVC = segue.destination as? MarvelQuizAnswerTwoViewController {
            let selectedAnswer = isCorrect ? "You are Correct!" : "You are Wrong!"
            let correctAnswer = "Answer: Silver Surfer"
            
            destVC.resultsArray[0] = selectedAnswer
            destVC.resultsArray[1] = correctAnswer
            destVC.currentScore = currentScore + score
        }
    }
}

extension MarvelQuizQuestionTwoViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        nextButton.isEnabled = true
        if (indexPath.row == 0) {
            isCorrect = true
            score = 1
            print("score: \(currentScore)")
        } else {
            isCorrect = false
            score = 0
            print("score: \(currentScore)")
        }
    }
}

extension MarvelQuizQuestionTwoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return answers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnswerCollectionViewCell", for: indexPath) as! AnswerCollectionViewCell
        cell.answerChoiceLabel.text = answers[indexPath.row]
        return cell
    }
}
