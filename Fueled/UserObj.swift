//
//  UserObj.swift
//  Fuel'd
//
//  Created by Jourdan Lieblich on 12/4/16.
//  Copyright © 2016 Jourdan Lieblich. All rights reserved.
//

import Foundation
import RealmSwift


class UserObj{//: Object{
    
    dynamic var name:String
    var vehicle:Vehicle
    dynamic var user_ID:Int
    
    required init() {
        name = ""
        user_ID = 0
        vehicle = Vehicle()
    }
    
    

}
