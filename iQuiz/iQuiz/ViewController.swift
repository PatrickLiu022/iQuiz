//
//  ViewController.swift
//  iQuiz
//
//  Created by Patrick Liu on 5/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let myData = ["Mathematics", "Marvel Super Heroes", "Science"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "QuizTypeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "QuizTypeTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // TableView Funcs

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("At \(indexPath.row)")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizTypeTableViewCell", for: indexPath) as! QuizTypeTableViewCell
        cell.myLabel?.text = myData[indexPath.row]
        cell.myImageView?.backgroundColor = .cyan
        return cell
    }
}
