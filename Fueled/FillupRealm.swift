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
    dynamic var mpg:Double{
        get{
            return miles/gallons
        }
    }
    
    dynamic var date = NSDate()
    dynamic var user_ID = NSUUID().uuidString
    
    
    override class func primaryKey() -> String?{
        return "user_ID"
    }
    
    override class func indexedProperties() -> [String]{
        return ["date"]
    }
    
    
    func freshFillup(m:Double, g:Double, c:Double, d:NSDate){
        modMiles(newMiles: m)
        modGallons(newGallons: g)
        modCost(newCost: c)
        modDate(newDate: d)
    }
    
    
    func modMiles(newMiles: Double){
        miles = newMiles
    }
    
    func modGallons(newGallons: Double){
        gallons = newGallons
    }
    
    func modCost(newCost: Double){
        cost = newCost
    }
    
    func modDate(newDate:NSDate){
        date = newDate
    }
    
}
