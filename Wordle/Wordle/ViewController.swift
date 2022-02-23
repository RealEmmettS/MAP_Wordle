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
    
    var progress = 0
    
    //MARK: viewWillAppear()
    override func viewWillAppear(_ animated: Bool) {
        
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
        if textField.text != "" && textField.text != nil{
            //checks the submitted word against the list of all actual words
            if textField.text!.isReal() && textField.text!.count >= 5{
                ///Temporary variable to hold the user's new guess. Only for use in the guessSubmitted IBAction function.
                let newGuess = guess(word: textField.text!)
                addGuess(newGuess)
                print(newGuess)
            }else{
                print("That word is not valid")
            }
        }
        
    }//end IBAction 'guessSubmitted'
    
    //MARK: Display Guess on Table
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
        
        row = tags[progress]
        
        var count = 0
        for tag in row{
            let tmpLabel = self.view.viewWithTag(tag) as? UILabel
            tmpLabel?.text = userGuess.getChars()[count].uppercased()
            
            //Highlights a cell yellow if the letter is in the word, but no the correct spot
            if word.lowercased().getChars().contains(userGuess.getChars()[count].lowercased()){tmpLabel?.backgroundColor = yellowColor}
                        
            //Highlights a cell green if the letter is in the word and in the correct spot
            if userGuess.getChars()[count].lowercased() == word.getChars()[count].lowercased(){tmpLabel?.backgroundColor = greenColor };count += 1}
        
        
        if userGuess.word.lowercased() == word.lowercased(){
            for tag in row{
                let tmpLabel = self.view.viewWithTag(tag) as? UILabel
                tmpLabel?.backgroundColor = greenColor
            }; submitButton.isEnabled = false
        }
        
        
        progress += 1
    }
    
}//end ViewController.swift

