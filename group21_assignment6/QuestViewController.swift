//
//  QuestViewController.swift
//  group21_assignment6
//
//  Created by Argandona Vite, Angel R on 3/14/19.
//  Copyright © 2019 Pacleb, Alyssa June N. All rights reserved.
//

import UIKit

class QuestViewController: UIViewController {

    @IBAction func endQuest(_ sender: Any) {
        self.dismiss(animated: true, completion: endQuest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func endQuest() {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
