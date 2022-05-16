import UIKit

class MarvelQuizViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!

	let answers = ["Henry", "Tony", "Bucky", "Clint"]
    var isCorrect = false
    var score = 0

	
	override func viewDidLoad() {
		super.viewDidLoad()
        let cellNib = UINib(nibName: "AnswerCollectionViewCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "AnswerCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        nextButton.isEnabled = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVC = segue.destination as? MarvelQuizAnswerOneViewController {
            
            let selectedAnswer = isCorrect ? "You are Correct!" : "You are Wrong!"
            let correctAnswer = "Answer: Bucky"
            
            destVC.resultsArray[0] = selectedAnswer
            destVC.resultsArray[1] = correctAnswer
            destVC.currentScore = score
        }
    }
}

extension MarvelQuizViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        nextButton.isEnabled = true
        if (indexPath.row == 2) {
            isCorrect = true
            score = 1
        } else {
            isCorrect = false
            score = 0
        }
    }
}


extension MarvelQuizViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return answers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnswerCollectionViewCell", for: indexPath) as! AnswerCollectionViewCell
        cell.answerChoiceLabel.text = answers[indexPath.row]
        return cell
    }
}
