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
    
    //let localUser = UserRealm()
    
    var realm:Realm!
    
    var userQuery: Results<UserRealm>!
    
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
    
    
    @IBAction func loginViewTapped(_ sender: AnyObject) {
        passwordField.resignFirstResponder()
        usernameField.resignFirstResponder()
    
    }
    
    @IBAction func loginPressed(_ sender: AnyObject) {
        
        passwordField.resignFirstResponder()
        usernameField.resignFirstResponder()
        
        
        if(passwordField.text?.isEmpty ?? true){
            print("Enter a password")
        }
        
        else{
        let password = passwordField.text!
        
        let name = usernameField.text!
        
        GlobalUser.user.login(u_ID: password, n: name, v: "Tractor", c: "Compton");
        
        
        
        do {
            realm = try Realm()
        } catch let error { print(error) }
        
        let key = password
        
        //SELECT *              FROM UserRealm         WHERE user_ID == key
        userQuery = realm.objects(UserRealm.self).filter("user_ID == '" + key + "'")
        
        if(userQuery.isEmpty){
            
            //INSERT INTO UserRealm
            try! realm.write{
                let localUser = UserRealm()
                
                //VALUES
                localUser.login(u_ID: password, n: name, v: "Tractor", c: "Compton")
                
                realm.add(localUser)
                print("Welcome New user!")
            }
        }
            
            performSegue(withIdentifier: "Login", sender: self)
            
        }
    }
    
    struct GlobalUser{
        static var user = UserRealm()
    }
    
    
}
