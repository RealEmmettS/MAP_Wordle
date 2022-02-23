//
//  OrganizationElements.swift
//  Wordle
//
//  Created by Emmett Shaughnessy on 2/17/22.
//

import Foundation
import UIKit


let greenColor:UIColor = UIColor(red: 0.56, green: 0.74, blue: 0.73, alpha: 1.00)
let yellowColor:UIColor = UIColor(red: 0.92, green: 0.80, blue: 0.55, alpha: 1.00)



//This file is for structs, classes, and arrays that are meant soley to help with organization and program efficiency.

///A guess submitted by the user. Function getChars() returns the guess word's characters in a [String]
struct guess:Equatable{
    let word: String
    
    func getChars() -> [String]{
        var characters:[String] = []
        
        if word != nil && word != ""{
            for character in word{
                characters.append(String(character))
            }
        }
        
        return characters
    }//end initialize()
    
}//end guess struct



