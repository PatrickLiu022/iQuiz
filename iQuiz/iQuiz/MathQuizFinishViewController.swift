//
//  MathQuizFinishViewController.swift
//  iQuiz
//
//  Created by Patrick Liu on 5/16/22.
//

import UIKit

class MathQuizFinishViewController: UIViewController {

    var finalScore = 0
    @IBOutlet weak var scoreLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scoreLabel.text = "Final Score: \(finalScore)/3"
    }
    
    @IBAction func unwindHome() {
        performSegue(withIdentifier: "UnwindToHome", sender: self)
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
