//
//  ViewController.swift
//  iQuiz
//
//  Created by Patrick Liu on 5/11/22.
//

import UIKit

class ViewController: UIViewController {

    var jsonData = ""
    
    @IBOutlet weak var quizTableView: UITableView!
    @IBOutlet weak var optionsControl: UIBarButtonItem!
    
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


    @IBAction func displayPopover() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let optionsVC = storyboard.instantiateViewController(
                   withIdentifier: "PopoverViewController")
         
        optionsVC.modalPresentationStyle = .popover
        optionsVC.popoverPresentationController?.barButtonItem =
                   optionsControl
        self.present(optionsVC, animated: true) {
        }
        
    }
    
    
    @IBAction func unwind(_ seg: UIStoryboardSegue) {}
    @IBAction func unwind2(_ seg: UIStoryboardSegue) {}
    @IBAction func unwind3(_ seg: UIStoryboardSegue) {}
    @IBAction func unwind4(_ seg: UIStoryboardSegue) {}
    
    @IBAction func unwind5(_ seg: UIStoryboardSegue) {}
    @IBAction func unwind6(_ seg: UIStoryboardSegue) {}
    @IBAction func unwind7(_ seg: UIStoryboardSegue) {}
    @IBAction func unwind8(_ seg: UIStoryboardSegue) {}
    
    @IBAction func unwind9(_ seg: UIStoryboardSegue) {}
    @IBAction func unwind10(_ seg: UIStoryboardSegue) {}
    @IBAction func unwind11(_ seg: UIStoryboardSegue) {}
    @IBAction func unwind12(_ seg: UIStoryboardSegue) {}
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            performSegue(withIdentifier: "MathQuizVCSegue", sender: self)
        } else if indexPath.row == 1 {
            performSegue(withIdentifier: "MarvelQuizVCSegue", sender: self)
        } else {
            performSegue(withIdentifier: "ScienceQuizVCSegue", sender: self)
        }
        
    }
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
