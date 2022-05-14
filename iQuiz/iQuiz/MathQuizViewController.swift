//
//  MathQuizViewController.swift
//  iQuiz
//
//  Created by Patrick Liu on 5/13/22.
//

import UIKit

class MathQuizViewController: UIViewController {
    
    @IBOutlet weak var questionTableView: UITableView!
    @IBOutlet weak var answerSelectionTableView: UITableView!
    
    let answers = ["1", "2", "3", "4"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        questionTableView.delegate = self
        questionTableView.dataSource = self
        
        let answerNib = UINib(nibName: "AnswerSelectionTableViewCell", bundle: nil)
        answerSelectionTableView.register(answerNib, forCellReuseIdentifier: "AnswerSelectionTableViewCell")
        answerSelectionTableView.delegate = self
        answerSelectionTableView.dataSource = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MathQuizViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("To do")
    }
}

extension MathQuizViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.questionTableView {
            return 1
        } else if tableView == self.answerSelectionTableView {
            return answers.count
        }
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if tableView == self.questionTableView {
            let qCell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath)
            cell = qCell
        } else if tableView == self.answerSelectionTableView {
            let aCell = tableView.dequeueReusableCell(withIdentifier: "AnswerSelectionTableViewCell", for: indexPath) as! AnswerSelectionTableViewCell
            aCell.desc.text = answers[indexPath.row]
            cell = aCell
        }
        return cell
    }
}
