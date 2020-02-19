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
  var score: Int = 0
  var round: Int = 0
  
  
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    startOver()
    
    let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
    slider.setThumbImage(thumbImageNormal, for: .normal)
    let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
    slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
    
    let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
    let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
    slider.setMinimumTrackImage(trackLeftImage, for: .normal)
    
    let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
    let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
    slider.setMaximumTrackImage(trackRightImage, for: .normal)
    
  }
  
  @IBAction func showAlert () {
    
    let title: String = titleDes()
    
    let alert = UIAlertController(title: title, message: "You scored \(calPoints())", preferredStyle: .alert)
    
    let action = UIAlertAction(title: "Awesome", style: .default, handler: {
      action in
      self.startNewRound()
    })
    
    alert.addAction(action)
    
    present(alert, animated: true, completion: nil)
    
  }
  
  @IBAction func sliderMoved (_ slider: UISlider) {
    currentValue = Int(slider.value.rounded())
  }
  
  @IBAction func startOver () {
    targetValue = Int.random(in: 1...100)
    currentValue = 50
    slider.value = Float(currentValue)
    round = 1
    score = 0
    updateLabel()
  }
  
  func startNewRound () {
    round += 1
    score += calPoints()
    targetValue = Int.random(in: 1...100)
    currentValue = 50
    slider.value = Float(currentValue)
    updateLabel()
  }
  
  func updateLabel() {
    targetLabel.text = String(targetValue)
    scoreLabel.text = String(score)
    roundLabel.text = String(round)
  }
  
  func difference () -> Int {
    return  abs(targetValue - currentValue)
  }
  
  func calPoints() -> Int {
    let scoreDiff:Int = difference()
    var scoreCal: Int = 0
    
    if scoreDiff == 0 {
      scoreCal += 100
    }else if scoreDiff == 1 {
      scoreCal += 50
    }
    return (100 - scoreDiff + scoreCal)
  }
  
  func titleDes() -> String {
    
    let scoreCal:Int = difference()
    let titleDesc: String
    
    if scoreCal == 0 {
      titleDesc = "Perfect!"
    }else if scoreCal < 5 {
      titleDesc = "You almost had it!"
    }else if scoreCal < 10 {
      titleDesc = "Pretty good!"
    }else {
      titleDesc = "Not even close..."
    }
    return titleDesc
  }

}

