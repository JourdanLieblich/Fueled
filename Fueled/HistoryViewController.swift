//
//  SecondViewController.swift
//  Fueled
//
//  Created by Jourdan Lieblich on 12/4/16.
//  Copyright © 2016 Jourdan Lieblich. All rights reserved.
//

import UIKit
import RealmSwift

class HistoryViewController: UIViewController, UITableViewDataSource {


    @IBOutlet weak var historyTable: UITableView!
    
    var history: Results<FillupRealmWOKey>!
    var tempHistory : Results<FillupRealmWOKey>!
    var realm:Realm!
    let key = LoginViewController.GlobalUser.user.user_ID
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            realm = try Realm()
        } catch let error { print(error) }
        
        //let total:Int = realm.objects(FillupRealm).count
        print("user_ID == " + key)
        
        history = realm.objects(FillupRealmWOKey.self)//.filter("user_ID == " + key)
        
        print("caught")
        print("HISTORY COUNT: " + String(history.count))
        
        let fillup = history[3]
        print("Table View ID: " + fillup.user_ID)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("at the start of table view row nums?")

        return history.count
        
        
    
    }


    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("at the start of table view?")
        
        let fillup = history[indexPath.row]
         print("Table View ID: " + fillup.user_ID)
        //NSString *stringFromDate = [formatter stringFromDate:myNSDateInstance];
    
        
        let cell = UITableViewCell(style: UITableViewCellStyle.value2, reuseIdentifier: nil)
    
       
        
        cell.textLabel?.text = fillup.user_ID
        cell.detailTextLabel?.text = String(format:" %0.2f", fillup.cPM)
//        cell.textLabel?.text = "MPG:"
//        cell.detailTextLabel?.text = String(format:" %0.2f", calcedMPG)
        
        return cell
    
    }
    
}

