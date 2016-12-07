//
//  FillupObj.swift
//  Fuel'd
//
//  Created by Jourdan Lieblich on 12/4/16.
//  Copyright © 2016 Jourdan Lieblich. All rights reserved.
//

import Foundation
import RealmSwift

class FillupObj{
    
    var ppg:Double = 0.0
    var miles:Double = 0.0
    var gallons:Double = 0.0
    var mpg:Double{
        get{
            if(gallons == 0.0){
                return 0.0
            }
            else{
                return miles/gallons
            }
            
        }
    }
    
    var cPM:Double{
        get{
            if(miles == 0.0){
                return 0.0
            }
            else{
                return (ppg*gallons)/miles
            }
        }
    }

    required init(miles : Double, gallons : Double, ppg: Double){
        self.miles = miles
        self.gallons = gallons
        self.ppg = ppg
    }
    

    
}
