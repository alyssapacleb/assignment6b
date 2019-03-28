//
//  QuestViewController.swift
//  group21_assignment6
//
//  Created by Argandona Vite, Angel R on 3/14/19.
//  Copyright © 2019 Pacleb, Alyssa June N. All rights reserved.
//

import UIKit
import CoreData
import ObjectiveC


class QuestViewController: UIViewController {

    @IBOutlet weak var questImageView: UIImageView!
    @IBOutlet weak var questLabel1: UILabel!
    @IBOutlet weak var questLabel2: UILabel!
    @IBOutlet weak var questLabel3: UILabel!
    @IBOutlet weak var questTextView: UITextView!
    @IBAction func endQuest(_ sender: Any) {
        timer.invalidate()
        self.dismiss(animated: true, completion: endQuest)
    }
    
    var timer = Timer()
    
    var currentAdventurer: NSManagedObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Current adventurer: \(currentAdventurer)")
        //print(selectedAdventurer!.value(forKeyPath: "portrait") as! String)
        //questImageView.image = UIImage(named: selectedAdventurer!.value(forKeyPath: "portrait") as! String)!
        //TIMER EVERY TWO SECONDS.
        
        timer = Timer.scheduledTimer(timeInterval:2.0, target: self, selector: #selector(reloadTimer), userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view.
    }
    

    @objc func reloadTimer() {
        //PRINT FIRE EVERY 2 SECONDS
        print("Fire")
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




/*
 Instructions:
 This view will display and update the adventurer's stats in real time
 
 A UITextView will act as the "quest log" where the user can see how their adventurer is faring against the enemies.
 
 A timer will determine when the adventurer can act, and at every timer event, the adventurer will attack based on the attack multiplier and a range of randomness. This will damage the "enemy" for a certain number of hit points. If the enemy dies, a new one will immediately spawn. If the adventurer defeats enough enemies, the adventurer will level up.
 
 Another timer will determine when the enemy can act, and at every timer event, the enemy will either attack for damage within a range (randomized), or wait. When the enemy attacks, the adventurer takes damage. If the adventurer's hit points go to zero or less, the adventurer's current hit points will be set to zero, and the quest will end (i.e. the timers will stop running).
 
 The quest log will output text for all events that happen during the timer, and while the exact wording of this text is up to you, it should include relevant details such as who attacked whom and for how much damage.
 
 
 
 */

