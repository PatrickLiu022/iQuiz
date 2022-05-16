//
//  MarvelQuizAnswerOneViewController.swift
//  iQuiz
//
//  Created by Patrick Liu on 5/14/22.
//

import UIKit

class MarvelQuizAnswerOneViewController: UIViewController {
    
    var resultsArray: [String] = ["", "", "--------", "Go to Next", "Go to Home"]
    var currentScore = 0
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as? MarvelQuizQuestionTwoViewController
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

extension MarvelQuizAnswerOneViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4 {
            performSegue(withIdentifier: "UnwindToHome", sender: self)
        }
        else if indexPath.row == 3 {
            performSegue(withIdentifier: "MarvelQuestionTwoVCSegue", sender: self)
        }
    }
}

extension MarvelQuizAnswerOneViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath)
        cell.textLabel?.text = resultsArray[indexPath.row]
        return cell
    }
}
