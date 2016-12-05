//
//  FillupObj.swift
//  Fuel'd
//
//  Created by Jourdan Lieblich on 12/4/16.
//  Copyright © 2016 Jourdan Lieblich. All rights reserved.
//

import Foundation

class FillupObj{
    
    var ppg:Double
    var miles:Double
    var gallons:Double
    var mpg:Double{
        get{
            return miles/gallons
        }
    }
    
    init(miles : Double, gallons : Double, ppg: Double){
        self.miles = miles
        self.gallons = gallons
        self.ppg = ppg
    }
    
}
