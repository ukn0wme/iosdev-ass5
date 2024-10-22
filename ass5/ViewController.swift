//
//  ViewController.swift
//  ass5
//
//  Created by Daniyal Nurgazinov on 23.10.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer?

    // This function will play the sound corresponding to the note.
    func playSound(note: String) {
        if let path = Bundle.main.path(forResource: note, ofType: "wav") {
            let url = URL(fileURLWithPath: path)
            do {
                // Stop any currently playing sound before playing the new one
                audioPlayer?.stop()
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Error: Could not play sound for \(note)")
            }
        } else {
            print("Error: Could not find file for \(note)")
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Any additional setup after loading the view
    }

    @IBAction func notePressed(_ sender: UIButton) {
        // Add animation to change button opacity temporarily
            UIView.animate(withDuration: 0.2, animations: {
                sender.alpha = 0.5  // Reduce opacity to give visual feedback
            }) { _ in
                // Bring it back to full opacity after a short delay
                UIView.animate(withDuration: 0.2) {
                    sender.alpha = 1.0
                }
            }
            
            // Play the sound as usual
            if let note = sender.titleLabel?.text {
                playSound(note: note)
            }
    }
}
