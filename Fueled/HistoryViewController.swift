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
    
//    var history: Results<FillupRealm>!
//    var tempHistory : Results<FillupRealm>!
//    var realm:Realm!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //let key = LoginViewController.GlobalUser.user.user_ID
        
//        do {
//            realm = try Realm()
//        } catch let error { print(error) }
//        
//        //let total:Int = realm.objects(FillupRealm).count
//        history = realm.objects(FillupRealm.self)
        
//        for i in 0 ..< total{
//            
//            if(tempHistory[i].user_ID == key){
//                //history.insert(tempHistory[i])
//                history.append(tempHistory[i])
//            }
//            
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let fillup = history[indexPath.row]
        
        //NSString *stringFromDate = [formatter stringFromDate:myNSDateInstance];
    
        let cell = UITableViewCell()//tableView.dequeueReusableCell(withIdentifier: "Fillup") as! FillupRealm
    
        //cell.textLabel!.text = fillup.user_ID
        
        return cell
    
    }
    
}

