//
//  Backend.swift
//  Wordle
//
//  Created by Emmett Shaughnessy on 2/17/22.
//

import Foundation
import UIKit
import AVFoundation
import AVKit
import AVFAudio

var word: String = ""
var score = UserDefaults.standard.integer(forKey: "score") {
    didSet{
        UserDefaults.standard.set(score, forKey: "score")
    }
}

var deadLetters:[String] = []{
    didSet{
        //print("Newest letter: \(deadLetters.last!)")
        //print(deadLetters.uniqued())
        deadLetters = deadLetters.uniqued()
    }
}


func pickNewWord(){
    let max = wordList.count
    
    //Replace 0 with the minimum, and replace 6 with the maximum
    let randomInt = Int.random(in: 0..<max)
    
    word = wordList[randomInt]
    print("Word: \(word)")
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

//MARK: Play Video
extension ViewController {
    
    func playVideo() {
        guard let path = Bundle.main.path(forResource: "Wordle_2_intro_video", ofType:"mp4") else {
            debugPrint("Wordle_2_intro_video.mp4 not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
        playerController.showsPlaybackControls = false
        playerController.exitsFullScreenWhenPlaybackEnds = true
        present(playerController, animated: true) {
            player.play()
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerController.player!.currentItem)
    }
    
    @objc func playerDidFinishPlaying(note:NSNotification){
        print("finished")
        dismiss(animated: true, completion: nil)
    }
    
}
