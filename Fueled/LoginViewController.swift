//
//  LoginViewController.swift
//  Fueled
//
//  Created by Jourdan Lieblich on 12/4/16.
//  Copyright © 2016 Jourdan Lieblich. All rights reserved.
//

import UIKit
import RealmSwift

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    let localUser = UserRealm()
    
    var realm:Realm!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            realm = try Realm()
        } catch let error { print(error) }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginPressed(_ sender: AnyObject) {
        
        let password = passwordField.text!
        
        let name = usernameField.text!
        
        GlobalUser.user.login(u_ID: password, n: name, v: "Tractor", c: "Compton");
        
        localUser.login(u_ID: password, n: name, v: "Tractor", c: "Compton")
        
//        let realm = try! Realm()
//        
        
//        if(realm.object(ofType: UserRealm.self, forPrimaryKey: password) == nil){
//            
//        
//        do{
//            
//            try! realm.write{
//            realm.add(localUser)
//            }
//        } catch let error {print(error)}
//        
//        }
//
    }
    
    struct GlobalUser{
        static var user = UserRealm()
    }
    
    
}
