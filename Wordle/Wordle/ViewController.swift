import UIKit
import AVFAudio
import AVFoundation
import AVKit

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    //MARK: IBOutlets
    @IBOutlet weak var deadLettersLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var restartAppWarning: UILabel!
    var didPlayVideo:Bool = false
    
    //MARK: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        restartAppWarning.isHidden = true
        didPlayVideo = false
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        if !didPlayVideo{
            playVideo()
            didPlayVideo = true
        }
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
    
    var progress = 0
    
    //MARK: viewWillAppear()
    override func viewWillAppear(_ animated: Bool) {
        
        restartAppWarning.isHidden = true
        
        submitButton.titleLabel?.font =  UIFont(name: "PP Editorial New", size: 20)
        
        for row in tags {
            for tag in row{
                let tmpLabel = self.view.viewWithTag(tag) as? UILabel
                tmpLabel?.text = " "
            }
        }//end "for row in tags"
        
        pickNewWord()
        
    }//end viewWillAppear()
    
    
    //MARK: User's Guess Submitted
    @IBAction func guessSubmitted(_ sender: Any) {
        
        //check if the texfield has a value
        textField.text = textField.text?.removeSpecialChars()
        if textField.text != "" && textField.text != nil{
            //checks the submitted word against the list of all actual words
            if textField.text!.isReal() && textField.text!.count >= 5{
                ///Temporary variable to hold the user's new guess. Only for use in the guessSubmitted IBAction function.
                let newGuess = guess(word: textField.text!)
                addGuess(newGuess)
                progress += 1
                print(newGuess)
            }else{
                print("That word is not valid")
            }
        }
        
        textField.text = ""
        
    }//end IBAction 'guessSubmitted'
    
    //MARK: - Display Guess on Table
    func addGuess(_ userGuess: guess){
        var row:[Int] = []
        
        
        let tags:[[Int]] =
        [
            [11,12,13,14,15],
            [21,22,23,24,25],
            [31,32,33,34,35],
            [41,42,43,44,45],
            [51,52,53,54,55]
        ]
        
        let testLabel = self.view.viewWithTag(tags[4][4]) as? UILabel
        if testLabel?.text != "" && testLabel?.text != nil && testLabel?.text != " "{
            submitButton.isEnabled = false; for tag in row{ let tmpLabel = self.view.viewWithTag(tag) as? UILabel; tmpLabel?.backgroundColor = .red};return
        }
        
        row = tags[progress]
        
        var count = 0
        for tag in row{
            let tmpLabel = self.view.viewWithTag(tag) as? UILabel
            tmpLabel?.text = userGuess.getChars()[count].uppercased()
            
            //MARK: Yellow Letters
            //Highlights a cell yellow if the letter is in the word, but not in the correct spot
            if word.lowercased().getChars().contains(userGuess.getChars()[count].lowercased()){tmpLabel?.backgroundColor = yellowColor}
                     
            //MARK: Green Letters
            //Highlights a cell green if the letter is in the word and in the correct spot
            if userGuess.getChars()[count].lowercased() == word.getChars()[count].lowercased(){tmpLabel?.backgroundColor = greenColor }
            
            //MARK: Dead Letters
            if !word.getChars().contains(userGuess.getChars()[count].lowercased()) {
                if !deadLetters.contains(userGuess.getChars()[count].lowercased()){
                    deadLetters.append(userGuess.getChars()[count].lowercased());
                }
            }
            ;count += 1
        }
        var deadString = ""
        for letter in deadLetters{
            deadString.append("\(letter) ")
        }
        deadLettersLabel.text = "Dead Letters: \(deadString)"
        
        
        if userGuess.word.lowercased() == word.lowercased(){
            for tag in row{
                let tmpLabel = self.view.viewWithTag(tag) as? UILabel
                tmpLabel?.backgroundColor = greenColor
            }; submitButton.isEnabled = false; textField.isEnabled = false; restartAppWarning.isHidden = false
        }
        
        
    }
    
}//end ViewController.swift

