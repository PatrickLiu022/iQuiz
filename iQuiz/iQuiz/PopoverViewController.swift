//
//  PopoverViewController.swift
//  iQuiz
//
//  Created by Patrick Liu on 5/19/22.
//

import UIKit

class PopoverViewController: UIViewController {
    
    var questionsString = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("bundlePath = \(Bundle.main.bundlePath)")
        print("home directory = \(NSHomeDirectory())")
        
        let fm = FileManager.default
        let urls = fm.urls(for: .libraryDirectory, in: .localDomainMask)
        print("urls = \(urls)")
        let docs = fm.urls(for: .documentDirectory, in: .userDomainMask)
        print("docs = \(docs)")
        
        NSLog("==== contentsOfDirectory:")
        let applicationHome = NSHomeDirectory()
        if let files = try? fm.contentsOfDirectory(atPath: applicationHome ){
          for file in files {
            NSLog("... \(file)")
          }
        }
    
        NSLog("==== Enumerating .")
        let dirEnum = fm.enumerator(atPath: applicationHome)
        while let file = dirEnum?.nextObject() as? String {
            print(".../\(file)")
        }


        print("======== Documents directory")
        if let files = try? fm.contentsOfDirectory(atPath: NSHomeDirectory() + "/Documents" ){
          for file in files {
            NSLog("... \(file)")
          }
        }

//        let archiveURL = URL(fileURLWithPath: NSHomeDirectory() + "/Documents/scores.archive")
//        print(archiveURL)
//        let readScores = NSDictionary(contentsOf: archiveURL)
//        print(readScores!)
        
        let lightMode = UserDefaults.standard.bool(forKey: "enabled_preference")
        print("Light mode is \(lightMode) enabled")
        
        UserDefaults.standard.set(1.0, forKey: "slider_preference")
        print("1.0 missiles set to launch")
    }
    
    // Settings stored in settings application
    @IBAction func goToSettings(_ sender: Any) {
        UIApplication.shared.open(URL.init(string: UIApplication.openSettingsURLString)!, options: [:])
    }
    
    // Download JSON when user presses Check Now - 1 point
    @IBAction func loadData() {
        // Download JSON - 2 points
        let request = URLRequest(url: URL(string: "http://tednewardsandbox.site44.com/questions.json")!)
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let _ = self else { return }
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        let questions = try JSONSerialization.jsonObject(with: data)
                        let questionsJson = try JSONSerialization.data(withJSONObject: questions)
                        
                        let questionsString = String(data: questionsJson, encoding: .utf8)!
                        print("questions: \(questionsString)")
                        let archivePath = NSHomeDirectory() + "/Documents/scores.archive"
                        let nsScores = questionsJson as? NSDictionary
                        nsScores?.write(toFile: archivePath, atomically: true)
                    } catch {
                        // Notify users with alert if network is not available - 1 point
                        let alert = UIAlertController(title: "Network Not Available", message: "OK", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            (action) in
                            print("Cancel")
                        }))
                        self?.present(alert, animated: true)
                    }
                }
            } else {
                
            }
        }.resume()
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
