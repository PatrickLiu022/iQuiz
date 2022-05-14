import UIKit

struct answerData {
    var isCorrect: Bool
    var userAnswer: String
}

class MarvelQuizViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!

	let answers = ["Henry", "Tony", "Bucky", "Clint"]
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
        if let destVC = segue.destination as? MarvelQuizAnswerOneViewController {
            destVC.isCorrect?.text = isCorrect ? "You are Correct!" : "You are Wrong!"
            destVC.userAnswer?.text = "Answer: Bucky"
        }
    }
}

extension MarvelQuizViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        nextButton.isEnabled = true
        if (indexPath.row == 2) {
            isCorrect = true
        } else {
            isCorrect = false
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