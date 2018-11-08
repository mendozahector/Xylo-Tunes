//
//  ViewController.swift
//  Xylophone
//
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    var audioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func notePressed(_ sender: UIButton) {
        playSound(sender.tag)
        sender.showsTouchWhenHighlighted = true
        pulsate(button: sender)
    }
    
    func pulsate(button: UIButton) {
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
//        pulse.autoreverses = true
//        pulse.repeatCount = 0
//        pulse.initialVelocity = 0.5
//        pulse.damping = 1.0
        
        button.layer.add(pulse, forKey: "pulse")
    }
    
    func playSound(_ number: Int) {
        let soundURL = Bundle.main.url(forResource: "note\(number)", withExtension: "wav")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        } catch {
            print(error)
        }
        
        audioPlayer.play()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 6, options: .allowUserInteraction, animations: {
            
        }, completion: nil)
    }
}
