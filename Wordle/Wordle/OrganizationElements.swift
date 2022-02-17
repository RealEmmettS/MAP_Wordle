//
//  OrganizationElements.swift
//  Wordle
//
//  Created by Emmett Shaughnessy on 2/17/22.
//

import Foundation
import UIKit

//This file is for structs, classes, and arrays that are meant soley to help with organization and program efficiency.

///A guess submitted by the user. Function getChars() returns the guess word's characters in a [String]
struct guess:Equatable{
    let word: String
    
    mutating func getChars() -> [String]{
        var characters:[String] = []
        
        if word != nil && word != ""{
            for character in word{
                characters.append(String(character))
            }
        }
        
        return characters
    }//end initialize()
    
}//end guess struct
