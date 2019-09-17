//
//  ViewController.swift
//  Bip The Guy
//
//  Created by Anastasia Kyratzoglou on 9/11/19.
//  Copyright © 2019 Anastasia Kyratzoglou. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //MARK: properties
    @IBOutlet weak var imageToPunch: UIImageView!
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //MARK: Functions
    func animateImage(){
        let bounds = self.imageToPunch.bounds
        let shrinkValue: CGFloat = 60
        
        // Shrink our image to punch by 60 pixels
        self.imageToPunch.bounds = CGRect(x: self.imageToPunch.bounds.origin.x + shrinkValue, y: self.imageToPunch.bounds.origin.y + shrinkValue, width: self.imageToPunch.bounds.size.width - shrinkValue, height: self.imageToPunch.bounds.size.height - shrinkValue)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [], animations: { self.imageToPunch.bounds = bounds }, completion: nil)
    }
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer){
        //Can we load in the file soundName
        if let sound = NSDataAsset(name: soundName){
            //check if sound.data is a sound file
            do{
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch{
                //if sound.data is not a valid file throws an error
                print("Error: file\(soundName) couldn't load.")
            }
        } else {
            // if reading in the NSDataAsset didnt work tell the developer report the error
            print("Error: file\(soundName) didn't load.")
        }
    }
    
    //MARK: Actions
    @IBAction func libraryPressed(_ sender: UIButton) {
    }
    
    @IBAction func cameraPressed(_ sender: UIButton) {
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        animateImage()
        playSound(soundName: "punchSound", audioPlayer: &audioPlayer)
    }
    

}
