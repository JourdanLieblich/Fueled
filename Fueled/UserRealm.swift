//
//  UserRealm.swift
//  Fueled
//
//  Created by Jourdan Lieblich on 12/4/16.
//  Copyright © 2016 Jourdan Lieblich. All rights reserved.
//

import Foundation
import RealmSwift

class UserRealm{
    
    dynamic var user_ID = NSUUID().uuidString
    
    dynamic var name: String = "John Doe"
    dynamic var vehicle: String = "Tractor"
    dynamic var city: String = "Compton"
    
    func login(u_ID:String, n:String, v:String, c:String){
        modID(ID: u_ID)
        modName(newName: n)
        modVechicle(newCar: v)
        modCity(newCity: c)
    }
    
    
    func modID(ID: String){
        user_ID = ID
    }
    
    func modName(newName: String){
        name = newName
    }
    
    func modVechicle(newCar: String){
        vehicle = newCar
    }
    
    func modCity(newCity:String){
        city = newCity
    }
    
}

