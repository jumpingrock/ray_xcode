//
//  ViewController.swift
//  BullsEye2
//
//  Created by venki6 on 19/2/20.
//  Copyright © 2020 com.jumpingrock. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var currentValue: Int = 0
  var targetValue: Int = 0
  var points: Int = 0
  var rounds: Int = 1
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    currentValue = Int(slider.value.rounded())
//    targetValue = Int.random(in: 1...100)
    startNewRound()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func showAlert () {
//    print("Hit me pressed")
    points += calPoints()
    rounds += 1
    let alert = UIAlertController(title: "Hello, World!", message: "The value of the slider is now: \(currentValue)" +
      "\nThe target value is: \(targetValue)" +
      "\nYour points \(calPoints())", preferredStyle: .alert)
    
    let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
    
    alert.addAction(action)
    
    present(alert, animated: true, completion: nil)
    
    startNewRound()
  }
  
  @IBAction func sliderMoved (_ slider: UISlider) {
    currentValue = Int(slider.value.rounded())
  }
  
  @IBAction func startOver () {
    targetValue = Int.random(in: 1...100)
    currentValue = 50
    rounds = 1
    points = 0
    updateLabel()
  }
  
  func startNewRound () {
    targetValue = Int.random(in: 1...100)
    currentValue = 50
    slider.value = Float(currentValue)
    updateLabel()
  }
  
  func updateLabel() {
    targetLabel.text = String(targetValue)
    scoreLabel.text = String(points)
    roundLabel.text = String(rounds)
  }
  
  func calPoints() -> Int {
    let scoreCal: Int = abs(targetValue - currentValue)
    var baseScore: Int = 100
    if scoreCal == 0 {
      baseScore *= 2
    }else if scoreCal == 1 {
      baseScore += 50
    }else {
      baseScore -= scoreCal
    }
    return baseScore
  }

}

