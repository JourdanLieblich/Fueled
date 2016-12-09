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
        
        //Set up data structure to hold results of the query
//        var history: Results<FillupRealmWOKey>!
        
        //SELECT *              FROM FillupRealmWOKey         WHERE user_ID == key
        history = realm.objects(FillupRealmWOKey.self).filter("user_ID == '" + key + "'")
        
        if(history.isEmpty){
            print("ahoy")
        }
        
        print("caught")
        print("HISTORY COUNT: " + String(history.count))

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        historyTable.reloadData()
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

    
        
        let cell = UITableViewCell(style: UITableViewCellStyle.value2, reuseIdentifier: nil)
    
        
       print(fillup.miles)
        
        cell.textLabel?.text = fillup.date.description
        cell.detailTextLabel?.text = String(format:"MPG: %0.1f   Miles: %0.1f   Gallons: %0.1f", fillup.mpg, fillup.miles, fillup.gallons)

        
        return cell
    
    }
    
}

