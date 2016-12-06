//
//  SecondViewController.swift
//  Fueled
//
//  Created by Jourdan Lieblich on 12/4/16.
//  Copyright © 2016 Jourdan Lieblich. All rights reserved.
//

import UIKit
import RealmSwift

class HistoryViewController: UIViewController {

    var history: Results<FillupRealm>!
    var tempHistory : Results<FillupRealm>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let key = LoginViewController.GlobalUser.user.user_ID
//        
//        let realm = try! Realm()
//        let total:Int = realm.objects(FillupRealm).count
//        tempHistory = realm.objects(FillupRealm)
//        
//        for i in 0 ..< total{
//            
//            //history.
//            
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

