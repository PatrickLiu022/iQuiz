//
//  ViewController.swift
//  iQuiz
//
//  Created by Patrick Liu on 5/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    var mathQuizVC: MathQuizViewController! = nil
    
    @IBOutlet weak var quizTableView: UITableView!
    @IBOutlet weak var settingsTableView: UITableView!
    
    let quizTypes = ["Mathematics", "Marvel Super Heroes", "Science"]
    let quizImages = [
        UIImage(named: "math-chalkboard"),
        UIImage(named: "marvel-image"),
        UIImage(named: "science-logo")
    ]
    let quizDescription = [
        "Test your basic math skills from elementary school",
        "Put your geek side to the test",
        "Test your basic science skills from elementary school"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let quizNib = UINib(nibName: "QuizTypeTableViewCell", bundle: nil)
        
        quizTableView.register(quizNib, forCellReuseIdentifier: "QuizTypeTableViewCell")
        quizTableView.delegate = self
        quizTableView.dataSource = self
    }

    @IBAction func displayAlert() {
        let alert = UIAlertController(title: "Settings go here", message: "OK", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (action) in
            print("Cancel")
        }))
        self.present(alert, animated: true)
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            print("Math")
            performSegue(withIdentifier: "MathQuizVCSegue", sender: self)
        } else if indexPath.row == 1 {
            performSegue(withIdentifier: "MarvelQuizVCSegue", sender: self)
        } else {
            performSegue(withIdentifier: "ScienceQuizVCSegue", sender: self)
        }
        
    }
    
//    func switchViewController(_ from: UIViewController?, to: UIViewController?) {
//        if from != nil {
//            from?.willMove(toParent: nil)
//            from!.view.removeFromSuperview()
//            from!.removeFromParent()
//        }
//
//        if to != nil {
//            self.addChild(to!)
//            self.view.insertSubview(to!.view, at: 0)
//            to!.didMove(toParent: self)
//        }
//    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = quizTableView.dequeueReusableCell(withIdentifier: "QuizTypeTableViewCell", for: indexPath) as! QuizTypeTableViewCell
        cell.quizTitle?.text = quizTypes[indexPath.row]
        cell.quizImageView?.image = quizImages[indexPath.row]
        cell.quizDescription?.text = quizDescription[indexPath.row]
        return cell
    }
}
