//
//  ContentView.swift
//  Bullseye
//
//  Created by kenneth yeong on 12/2/20.
//  Copyright © 2020 kenneth yeong. All rights reserved.
//

import SwiftUI

struct ContentView: View {

  @State var alertIsVisible: Bool = false
  @State var sliderValue: Double = 50.0
  @State var scoreThisRound: Int = 0
  @State var roundNumber: Int = 1
  var target: Int = Int.random(in: 1...100)

  var body: some View {
    

    VStack {
      Spacer()
      HStack {
        // Target row
        Text("Put the bullseye as close as you can to: ")
        Text("\(target)")
                
      }
      Spacer()
      //Slider row
      HStack {
        Text("1")
        Slider(value: self.$sliderValue, in: 1...100)
        Text("100")
      }
      Spacer()
      //Button row
      Button(action: {
        print("Button pressed!")
        self.alertIsVisible = true
      }) {
        Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
      }.alert(isPresented: $alertIsVisible) { () ->
        Alert in

//        scoreThisRound = pointsForCurrentRound()
        roundNumber += 1
        return Alert(title: Text("Hello there!"),
                     message: Text(
                      "The slider's value is \(sliderValueRounded()).\n" +
                      "You scored \(pointsForCurrentRound()) points this round."),
                     dismissButton: .default(Text("Awsome!")))
      }
      Spacer()
      // Score row
      HStack {
        Button(action: {
          print("Start over button pressed")
        }) {
          Text("Start Over")
        }
        Spacer()
        Text("Score: ")
        Text("99999")
        Spacer()
        Text("Round: ")
        Text("000")
        Spacer()
        Button(action: {
          print("Info button pressed")
        }) {
          Text("Info")
        }
      }.padding(.bottom, 20)
    }
  }
  func sliderValueRounded() -> Int {
    return Int(sliderValue.rounded())
  }
  
  func pointsForCurrentRound() -> Int {

    return (100 - abs(target-sliderValueRounded()))
  }
}


struct ContentView_Previews:
  PreviewProvider {
  static var previews: some View {
    ContentView().previewLayout(.fixed(width: 896, height: 414))
  }
}
