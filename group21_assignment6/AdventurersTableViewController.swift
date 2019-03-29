//
//  AdventurersTableViewController.swift
//  group21_assignment6
//
//  Created by Pacleb, Alyssa June N on 3/26/19.
//  Copyright © 2019 Pacleb, Alyssa June N. All rights reserved.
//

import UIKit
import CoreData

var adventurers: [String] = []
var Adventurers: [NSManagedObject] = []
var selectedAdventurer: NSManagedObject?

class AdventurersTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Adventurers)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Adventurer")
        
        do {
            Adventurers = try managedContext.fetch(fetchRequest)
            tableView.reloadData()
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Adventurers.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = Adventurers[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "adventCell", for: indexPath) as! AdventurersTableViewCell
        let cellImage = UIImage(named: person.value(forKeyPath: "portrait") as! String)!
        let label1 = person.value(forKeyPath: "name") as! String
        let label2 = person.value(forKeyPath: "profession") as! String + "\n" + "Attack:  " + String(person.value(forKeyPath: "attack_modifier") as! Int16) + "\n" + "Defense:  " + String(person.value(forKeyPath: "defense") as! Int16) + "\n" + "Evasion:  " + String(person.value(forKeyPath: "evasion") as! Int16) + "\n" + "HP:       " + String(person.value(forKeyPath: "total_hitpoints") as! Int16) + "/" + String(person.value(forKeyPath: "total_hitpoints") as! Int16)
        let label3 = String(person.value(forKeyPath: "level") as! Int16)

        // Configure the cell...
        cell.displayContent(image: cellImage, label1: label1, label2: label2, label3: label3)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedAdventurer = Adventurers[indexPath.row]
        self.performSegue(withIdentifier: "QuestViewSegue", sender: self)
        //print(selectedAdventurer!)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }*/

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
            }
            let managedContext = appDelegate.persistentContainer.viewContext
            managedContext.delete(Adventurers[indexPath.row])
            do {
                try managedContext.save()
            } catch {
                return
            }
            Adventurers.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            //print(Adventurers)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "QuestViewSegue" {
            let ExchangeViewData = segue.destination as! QuestViewController
            ExchangeViewData.currentAdventurer = selectedAdventurer!
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}


/*
 Instructions:
 The adventurers' data are stored via Core Data.
 
 The adventurers will have attributes that at least include name, profession, level, current and total hit points, attack power multiplier, and a portrait.
 
 This list of adventurers and their stats should automatically update whenever the table view is displayed (but the order of adventurers does not have to be consistent).
 
 The adventurers will regain all their hitpoints whenever they return to this main screen.
 
 The user can delete an adventurer at any time and this will both remove that adventurer from the table as well as remove their data from persistent storage.
 
 */
