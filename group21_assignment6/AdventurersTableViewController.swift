//
//  AdventurersTableViewController.swift
//  group21_assignment6
//
//  Created by Alyssa June Pacleb on 3/15/19.
//  Copyright © 2019 Pacleb, Alyssa June N. All rights reserved.
//

import UIKit
class Advent {
    
    // Description of animal to be displayed

    var imageName : String
    
    init(imageName: String){
        self.imageName = imageName
    }
}

class AdventurersTableViewController: UITableViewController {
    // Array of each adventurers class
    var advents = [Advent]()
    
    // Take data from the plist, convert each item into an Animal class.
    private func accessAdventPlist(){
        let inputFile = Bundle.main.path(forResource:"Property List", ofType: "plist")
        let inputArray = NSArray(contentsOfFile: inputFile!)
        for input in inputArray as! [Dictionary<String, String>] {
            advents.append(Advent(imageName: input["imageName"]!))
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        accessAdventPlist()
        tableView.rowHeight = 100

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return advents.count
    }
    
    // Populate the contents of each cell. NOT WORKING
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Each cell is assigned as the variable "cell"
        var cell : UITableViewCell?
        
        cell = tableView.dequeueReusableCell(withIdentifier: "adventCells", for: indexPath)
        let advent = advents[indexPath.row]
        cell!.imageView?.image = UIImage(named: advent.imageName)
        
        return cell!
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
