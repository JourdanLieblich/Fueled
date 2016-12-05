//
//  FirstViewController.swift
//  Fueled
//
//  Created by Jourdan Lieblich on 12/4/16.
//  Copyright © 2016 Jourdan Lieblich. All rights reserved.
//

import UIKit

class FillupViewController: UIViewController {

    @IBOutlet weak var milesText: UITextField!
    
    @IBOutlet weak var gallonsText: UITextField!
    
    @IBOutlet weak var costText: UITextField!
    
    @IBOutlet weak var calcButton: UIButton!
    
    @IBOutlet weak var historyButton: UIButton!
    
    @IBOutlet weak var resultsTableView: UITableView!
    
    
    let gasObj = FillupRealm()//FillupObj(miles: 0.00, gallons: 0.00, ppg: 0.00)
    
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
        
        print("calc pressed")
        
        print(gasObj.cost)
        print(gasObj.date)
        print(gasObj.gallons)
        print(gasObj.miles)
        
        milesText.resignFirstResponder()
        gallonsText.resignFirstResponder()
        costText.resignFirstResponder()
        
        //resultsTableView.reloadData()
        
    }
    
    
    
    @IBAction func viewTapped(_ sender: AnyObject) {
        milesText.resignFirstResponder()
        gallonsText.resignFirstResponder()
        costText.resignFirstResponder()
    }
    

}

