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
    
    
    let gasObj = FillupRealmWOKey()//FillupObj(miles: 0.00, gallons: 0.00, ppg: 0.00)
    let localGas = FillupObj(miles: 0.00, gallons: 0.00, ppg: 0.00)
    
    var realm:Realm!
    
    var history: Results<FillupRealm>!
    
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
        
//        gasObj.gallons = Double((gallonsText.text! as NSString).doubleValue)
//        
//        gasObj.miles = Double((milesText.text! as NSString).doubleValue)
//        
//        gasObj.cost = Double((costText.text! as NSString).doubleValue)

        localGas.gallons = Double((gallonsText.text! as NSString).doubleValue)
        
                localGas.miles = Double((milesText.text! as NSString).doubleValue)
        
                localGas.ppg = Double((costText.text! as NSString).doubleValue)
        
//        print("calc pressed")
//        
//        print(gasObj.cost)
//        print(gasObj.date)
//        print(gasObj.gallons)
//        print(gasObj.miles)
        
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
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.value2, reuseIdentifier: nil)
        
        let calcedMPG = localGas.mpg
        let cPM = localGas.cPM
        let totalCost = localGas.miles*cPM
        
        print("Calced MPG")
        print(calcedMPG)
        
        print("INDEX PATH")
        print(indexPath.row)
        
        if(indexPath.row == 1){
            cell.textLabel?.text = "MPG:"
            cell.detailTextLabel?.text = String(format:" %0.2f", calcedMPG)
        }
        if(indexPath.row == 2){
            cell.textLabel?.text = "Cost Per Mile:"
            cell.detailTextLabel?.text = String(format:"$%0.2f", cPM)
        }
        if(indexPath.row == 3){
            cell.textLabel?.text = "Total Cost:"
            cell.detailTextLabel?.text = String(format:"$%0.2f", totalCost)
        }
      
        
        
        return cell
    }
    
    
    @IBAction func addFillupToDatabase(_ sender: AnyObject) {
        
        //Stop accidental default and (potentially) irreversable additions to the Database
        if(localGas.ppg != 0.0 && localGas.gallons != 0.0 && localGas.miles != 0.0){
            
            
        //Set the gasObj ID to be the users id so querying the Database for this users info becomes posible
        gasObj.user_ID = LoginViewController.GlobalUser.user.user_ID
        gasObj.cost = localGas.ppg
        
            gasObj.gallons = localGas.gallons
           
        
            print(gasObj.user_ID)
            
            do {
                realm = try Realm()
            } catch let error { print(error) }
        
            
            
            //gasObj. = String(history.count)
            
            do{
            try! realm.write{
                realm.add(gasObj)
            }
            } catch let error {print(error)}
        }
    }

}

