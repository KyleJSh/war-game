//
//  SoundManager.swift
//  War Game
//
//  Created by Kyle Sherrington on 2021-04-05.
//

import Foundation
import AVFoundation

class SoundManager {
    
    var audioPlayer:AVAudioPlayer?
    
    // create enum for sound files
    enum SoundEffect {
        case shuffle
        case tick
        case success
        case fail
    }
    
    func playSound(effect:SoundEffect) {
        
        var soundFilename = ""
        
        switch effect {
        case .shuffle:
            soundFilename = "shuffle"
        case .tick:
            soundFilename = "tick"
        case .success:
            soundFilename = "success"
        case .fail:
            soundFilename = "fail"
        }
        
        let bundlePath = Bundle.main.path(forResource: soundFilename, ofType: "mp3")
        
        guard bundlePath != nil else {
            // couldn't find sound file
            return
        }
        
        let url = URL(fileURLWithPath: bundlePath!)
        
        do {
            
            // try to get sound
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            
            // play sound
            audioPlayer?.play()
            
        }
        catch {
            print("Couldn't get sound")
            return
        }
        
    }
    
}
