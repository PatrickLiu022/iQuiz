//
//  ScienceQuizAnswerTwoViewController.swift
//  iQuiz
//
//  Created by Patrick Liu on 5/16/22.
//

import UIKit

class ScienceQuizAnswerTwoViewController: UIViewController {

    var resultsArray: [String] = ["", "", "--------", "Go To Next", "Go To Home"]
    var currentScore = 0
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as? ScienceQuizQuestionThreeViewController
        destVC?.currentScore = currentScore
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

extension ScienceQuizAnswerTwoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4 {
            performSegue(withIdentifier: "UnwindToHome", sender: self)
        }
        else if indexPath.row == 3 {
            performSegue(withIdentifier: "ScienceQuizQuestionThreeVCSegue", sender: self)
        }
    }
}

extension ScienceQuizAnswerTwoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)
        cell.textLabel?.text = resultsArray[indexPath.row]
        return cell
    }
}
