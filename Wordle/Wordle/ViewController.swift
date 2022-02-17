//
//  ViewController.swift
//  Wordle
//
//  Created by Emmett Shaughnessy on 2/17/22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var deadLettersLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    
    //MARK: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
    }
    
    //MARK: -Tags
    //UIButton tags are formatted like this –> row:index. For example, row 1 letter 2 would have a tag of 12 and row 4 letter 5 would have a tag of 45.
    let tags:[[Int]] =
    [
        [11,12,13,14,15],
        [21,22,23,24,25],
        [31,32,33,34,35],
        [41,42,43,44,45],
        [51,52,53,54,55]
    ]
    
    //MARK: viewWillAppear()
    override func viewWillAppear(_ animated: Bool) {
        
        for row in tags {
            for tag in row{
                let tmpLabel = self.view.viewWithTag(tag) as? UILabel
                tmpLabel?.text = " "
            }
        }//end "for row in tags"
        
        
    }//end viewWillAppear()
    
    
    //MARK: User's Guess Submitted
    @IBAction func guessSubmitted(_ sender: Any) {
        
        //check if the texfield has a value
        if textField.text != "" && textField.text != nil{
            //checks the submitted word against the list of all actual words
            if textField.text!.isReal(){
                ///Temporary variable to hold the user's new guess. Only for use in the guessSubmitted IBAction function.
                let newGuess = guess(word: textField.text!)
                print(newGuess)
            }else{
                print("That word doesn't exist")
            }
        }
        
    }//end IBAction 'guessSubmitted'
    
}

