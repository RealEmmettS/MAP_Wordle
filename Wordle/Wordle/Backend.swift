//
//  Backend.swift
//  Wordle
//
//  Created by Emmett Shaughnessy on 2/17/22.
//

import Foundation

var word: String = ""

func pickNewWord(){
    let max = wordList.count
    
    //Replace 0 with the minimum, and replace 6 with the maximum
    let randomInt = Int.random(in: 0..<max)
    
    word = wordList[randomInt]
    print(word)
}

extension String{
    
    func getChars() -> [String]{
        var characters:[String] = []
        
        for character in self{
            characters.append(String(character))
        }
        
        return characters
    }//end initialize()
    
}
