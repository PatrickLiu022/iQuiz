//
//  ScienceQuizCollectionViewController.swift
//  iQuiz
//
//  Created by Patrick Liu on 5/13/22.
//

import UIKit

class ScienceQuizCollectionViewController: UICollectionViewController {
    
    let dataSource: [String] = ["1", "2", "3", "4"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        if let answerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnswerCell", for: indexPath) as? ScienceQuizCollectionViewCell {
            answerCell.configure(with: dataSource[indexPath.row])
            cell = answerCell
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected \(dataSource[indexPath.row])")
    }
}
