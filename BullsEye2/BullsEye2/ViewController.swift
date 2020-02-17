//
//  ViewController.swift
//  Bullseye2
//
//  Created by kenneth yeong on 17/2/20.
//  Copyright © 2020 kenneth yeong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  @IBAction func showAlert() {
//    print("hello")
    let alert = UIAlertController(title: "Hello, World!", message: "This is my first app!", preferredStyle: .alert)
    let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
    
    alert.addAction(action)
    
    present(alert, animated: true, completion: nil)
  }
  
  
}

