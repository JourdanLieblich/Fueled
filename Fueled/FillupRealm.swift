//
//  FillupRealm.swift
//  
//
//  Created by Jourdan Lieblich on 12/4/16.
//
//

import Foundation
import RealmSwift

class FillupRealm: Object{
    
    dynamic var miles:Double = 0.0
    dynamic var gallons:Double = 0.0
    dynamic var cost:Double = 0.0
    
    dynamic var date = NSDate()
    dynamic var user_ID = NSUUID().uuidString
    
    
    override class func primaryKey() -> String?{
        return "user_ID"
    }
    
    override class func indexedProperties() -> [String]{
        return ["date"]
    }
    
    
    
}
