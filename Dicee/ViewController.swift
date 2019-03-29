//
//  ViewController.swift
//  Dicee
//
//  Created by Christian Engelberth Olsen on 04/03/2019.
//  Copyright © 2019 Christian Engelberth Olsen. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    let diceImgArr = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    
    var diceImgArrayList = [String]();
    
    @IBOutlet weak var leftDiceImage: UIImageView!
    @IBOutlet weak var rightDiceImage: UIImageView!
    
    var motionSensorOn : Bool = true;
    var randomDiceIndex1: Int = 0
    var randomDiceIndex2: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateNumbers()
        updateDiceImages()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func ShakeButton(_ sender: UIButton) {
        if(motionSensorOn){
            motionSensorOn = false;
           sender.setTitle("Shake Off", for: .normal)
             sender.backgroundColor = UIColor.red;
        } else if (!motionSensorOn){
            motionSensorOn = true;
               sender.setTitle("Shake On", for: .normal)
            sender.backgroundColor = UIColor.green;
        }
    
    }
    
    @IBAction func rollButtonPressed(_ sender: Any) {
        
        generateNumbers()
        updateDiceImages()
        
    }
    
    //Generate the RandomNumbers
    func generateNumbers(){
        randomDiceIndex1 = Int.random(in: 0 ... 5)
        randomDiceIndex2 = Int.random(in: 0 ... 5)
    }
    
    //Method for setting the Dice Images
    func updateDiceImages(){
        leftDiceImage.image = UIImage(named: diceImgArr[randomDiceIndex1])
        rightDiceImage.image = UIImage(named: diceImgArr[randomDiceIndex2])
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if(motionSensorOn){
            generateNumbers()
            updateDiceImages()
        }
       
    }
    
}

