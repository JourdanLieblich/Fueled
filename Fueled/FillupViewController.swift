//
//  FirstViewController.swift
//  Fueled
//
//  Created by Jourdan Lieblich on 12/4/16.
//  Copyright © 2016 Jourdan Lieblich. All rights reserved.
//

import UIKit
import RealmSwift

class FillupViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var milesText: UITextField!
    
    @IBOutlet weak var gallonsText: UITextField!
    
    @IBOutlet weak var costText: UITextField!
    
    @IBOutlet weak var calcButton: UIButton!
    
    @IBOutlet weak var historyButton: UIButton!
    
    @IBOutlet weak var resultsTableView: UITableView!
    
    
    let gasObj = FillupRealm()//FillupObj(miles: 0.00, gallons: 0.00, ppg: 0.00)
    //let fastGas = FillupObj(miles: 0.00, gallons: 0.00, ppg: 0.00)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshUI(){
        
    }
    
    @IBAction func calculateTapped(_ sender: AnyObject) {
        
        gasObj.gallons = Double((gallonsText.text! as NSString).doubleValue)
        
        gasObj.miles = Double((milesText.text! as NSString).doubleValue)
        
        gasObj.cost = Double((costText.text! as NSString).doubleValue)
        
//        fastGas.gallons = Double((gallonsText.text! as NSString).doubleValue)
//        
//        fastGas.miles = Double((milesText.text! as NSString).doubleValue)
//        
//        fastGas.ppg = Double((costText.text! as NSString).doubleValue)
        
        print("calc pressed")
        
        print(gasObj.cost)
        print(gasObj.date)
        print(gasObj.gallons)
        print(gasObj.miles)
        
        milesText.resignFirstResponder()
        gallonsText.resignFirstResponder()
        costText.resignFirstResponder()
        
        resultsTableView.reloadData()
        
    }
    
    
    
    @IBAction func viewTapped(_ sender: AnyObject) {
        milesText.resignFirstResponder()
        gallonsText.resignFirstResponder()
        costText.resignFirstResponder()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Table view")
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.value2, reuseIdentifier: nil)
        
        let calcedMPG = gasObj.mpg
        let cPM = gasObj.cPM
        
        print("Calced MPG")
        print(calcedMPG)
        
        print("INDEX PATH")
        print(indexPath.row)
        
        if(indexPath.row == 0){
            cell.textLabel?.text = "MPG:"
            cell.detailTextLabel?.text = String(format:" %0.2f", calcedMPG)
        }
        if(indexPath.row == 1){
            cell.textLabel?.text = "Cost Per Mile:"
            cell.detailTextLabel?.text = String(format:"$%0.2f", cPM)
        }
        
        
        return cell
    }
    
    
    @IBAction func addFillupToDatabase(_ sender: AnyObject) {
        
        //Stop accidental default and (potentially) irreversable additions to the Database
        if(gasObj.cost != 0.0 && gasObj.gallons != 0.0 && gasObj.miles != 0.0){
        
        let realm = try! Realm()
        
            try! realm.write{
                realm.add(gasObj)
            }
            
            
            
        }
    }

}

