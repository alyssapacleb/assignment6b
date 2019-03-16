//
//  RecruitmentViewController.swift
//  group21_assignment6
//
//  Created by Argandona Vite, Angel R on 3/14/19.
//  Copyright © 2019 Pacleb, Alyssa June N. All rights reserved.
//

import UIKit

// NEW NEW NEW GalleryItem AND PLIST
class GalleryItem {
    var imageName:String
    init(imageName:String) {
        self.imageName = imageName
    }
}

class RecruitmentViewController: UIViewController, UITextFieldDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    // Collection Cell Identifier
    let indentifier = "AdventurerCollectionCell"
    
    // Items Per Row
    let itermsPerRow:CGFloat = 3
    
    //
    var imagecollection = [GalleryItem]()
    
    // Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var classTextField: UITextField!
    @IBOutlet weak var AdventurersCollectionView: UICollectionView!
    
    // Button actions
    @IBAction func cancelRecruitment(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveRecruit(_ sender: Any) {
        self.addAdventurer()
    }
    
    private func accessAdventCollectionPlist(){
        //let inputFile = Bundle.main.path(forResource: "Property List", ofType: "plist")
        //let inputArray = NSArray(contentsOfFile: inputFile!)
        if let path = Bundle.main.path(forResource: "Property List", ofType: "plist") {
            let dictRoot = NSDictionary(contentsOfFile: path)
            if let dict = dictRoot {
                debugPrint(dict["imageName"] as! String)
            }
        }
        /*for input in inputArray as! [Dictionary<String, String>] {
            for (key,value) in input {
                print("\(key), \(value)")
                imagecollection.append(GalleryItem(imageName: input["imageName"]!))
            }
        }*/
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accessAdventCollectionPlist()
    }
    
    // Check text field
    func addAdventurer() {
        if !(nameTextField.text!.trimmingCharacters(in: .whitespaces).isEmpty) && !(classTextField.text!.trimmingCharacters(in: .whitespaces).isEmpty){
            print("yes")
            self.dismiss(animated: true, completion: nil)
        } else { print("Please enter a valid name and class, asshole.")}
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagecollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdventurerCollectionCell", for: indexPath) as! avatarCell
        let collection = imagecollection[indexPath.row]
        cell.displayContent(image:UIImage(named:collection.imageName)!)
        
        return cell
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
