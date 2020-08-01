//
//  ViewController.swift
//  MusicWireframe
//
//  Created by Armando Carrillo on 31/07/20.
//  Copyright © 2020 Armando Carrillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isPlaying : Bool = true{
        didSet {
            if isPlaying {
                playPauseButton.setImage(UIImage(named: "pause")!, for: .normal)
            }else {
                playPauseButton.setImage(UIImage( named: "play")!, for: .normal)
            }
        }
    }

    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var reverseBackground: UIView!
    @IBOutlet weak var playPauseBackground: UIView!
    @IBOutlet weak var forwardBackground: UIView!
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reverseBackground.layer.cornerRadius = 35.0
        reverseBackground.clipsToBounds = true
        reverseBackground.alpha = 0.0
        
        playPauseBackground.layer.cornerRadius = 38.0
        playPauseBackground.clipsToBounds = true
        playPauseBackground.alpha = 0.0
        
        forwardBackground.layer.cornerRadius = 35.0
        forwardBackground.clipsToBounds = true
        forwardBackground.alpha = 0.0
    }

    @IBAction func playPauseButtonTapped(_ sender : UIButton) {
        if isPlaying {
            UIView.animate(withDuration: 0.5){
                self.albumImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
            
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.albumImageView.transform = CGAffineTransform.identity
            })
        }
    isPlaying = !isPlaying
        
    }
    
    @IBAction func touchedUpside(_ sender: UIButton) {
    }
    
    @IBAction func touchedDown(_ sender: UIButton) {
        
        let buttonBackground : UIView
        
        switch sender {
        case reverseButton:
            buttonBackground = reverseBackground
        case playPauseButton:
            buttonBackground = playPauseBackground
        case forwardBackground:
            buttonBackground = forwardBackground
        default:
            return
        }
        UIView.animate(withDuration: 0.25){
            buttonBackground.alpha = 0.3
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
    }
    
}

