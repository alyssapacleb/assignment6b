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

class Enemy {
    
    var name: String
    var level: Int
    var hp: Int
    var attack: Int
    
    init(name: String, level: Int, hp: Int, attack: Int) {
        
        self.name = name
        self.level = level
        self.hp = hp
        self.attack = attack
        
    }
    
}

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
    
    // Adventurer variables to be set when view loads
    var adv_name: String?
    var adv_profession: String?
    var adv_attack: Int?
    var adv_defense: Int?
    var adv_evasion: Int?
    var adv_currenthp: Int?
    var adv_maxhp: Int?
    var adv_level: Int?
    var adv_portrait: UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Current adventurer: \(currentAdventurer!)")
        //print(currentAdventurer!.value(forKey:"name") as! String)

        adv_name = (selectedAdventurer!.value(forKeyPath: "name") as! String)
        adv_profession = (selectedAdventurer!.value(forKeyPath: "profession") as! String)
        adv_attack = (selectedAdventurer!.value(forKeyPath: "attack_modifier") as! IntegerLiteralType)
        adv_defense = (selectedAdventurer!.value(forKeyPath: "defense") as! IntegerLiteralType)
        adv_evasion = (selectedAdventurer!.value(forKeyPath: "evasion") as! IntegerLiteralType)
        adv_portrait = UIImage(named: (selectedAdventurer!.value(forKeyPath: "portrait") as! String))!
        adv_currenthp = (selectedAdventurer!.value(forKeyPath: "current_hitpoints") as! IntegerLiteralType)
        adv_maxhp = (selectedAdventurer!.value(forKeyPath: "total_hitpoints") as! IntegerLiteralType)
        adv_level = (selectedAdventurer!.value(forKeyPath: "level") as! IntegerLiteralType)
        
        questImageView.image = adv_portrait!
        questLabel1.text = adv_name!
        questLabel3.text = String(adv_level!)
        //questLabel2.text = adv_profession! + "\nAttack: " + String(adv_attack!) + "\nHP: " + String(adv_currenthp!) + "/" + String(adv_maxhp!)
        questLabel2.text = adv_profession! + "\nAttack: " + String(adv_attack!) + "\nDefense: " + String(adv_defense!) + "\nEvasion: " + String(adv_evasion!) + "\nHP: " + String(adv_currenthp!) + "/" + String(adv_maxhp!)
        
        //TIMER EVERY TWO SECONDS.
        timer = Timer.scheduledTimer(timeInterval:2.0, target: self, selector: #selector(reloadTimer), userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view.
    }
    
    // This function is used to set/update the text labels
    func setLabels() {
        
        questLabel3.text = String(adv_level!)
        //questLabel2.text = adv_profession! + "\nAttack: " + String(adv_attack!) + "\nHP: " + String(adv_currenthp!) + "/" + String(adv_maxhp!)
        questLabel2.text = adv_profession! + "\nAttack: " + String(adv_attack!) + "\nDefense: " + String(adv_defense!) + "\nEvasion: " + String(adv_evasion!) + "\nHP: " + String(adv_currenthp!) + "/" + String(adv_maxhp!)
        
    }
    
    //THIS FUNCTION LOADS UP THE TIMER EVERY 2 SECONDS
    @objc func reloadTimer() {
        // var TEXTVIEW DISPLAY = (name) attacks for (AtMod*random number between 5-10) damage
        var damage = arc4random_uniform(5)+1 // MULTIPLY BY ATTACK MODIFIER
        var strDamage = String(damage)
        var theHeroName = "Yuffie" //CHANGE TO NSOBJECT WITH KEY VALUE NAME
        //var theEnemyHealth = arc4random_uniform(15)+55
        //var strEnemyHealth = String(theEnemyHealth)
        print(theHeroName + " attacks for " + strDamage + " damage")
        //print("enemy health: " + strEnemyHealth)
        
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

