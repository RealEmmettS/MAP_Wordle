//
//  Extra.swift
//  Wordle
//
//  Created by Emmett Shaughnessy on 2/17/22.
//

import Foundation
import UIKit

//Keybaord dismissing
extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}//end 'extension UIViewController'

extension String{
    
    func isReal() -> Bool {
        
        if self.count != 5{
            return false
        }
        
        for word in allWords{
            if self.lowercased() == word.lowercased(){
                return true
            }
        }
        return false
    }
    
    
    func removeSpecialChars() -> String {
        let allowedChars : Set<Character> =
            Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ")
        return String(self.filter {allowedChars.contains($0) })
    }
    
}//end 'extension String'


//https://stackoverflow.com/a/25739498
extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
