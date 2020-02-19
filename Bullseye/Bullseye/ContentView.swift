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
  @State var score: Int = 0
  @State var round: Int = 1
  @State var target: Int = Int.random(in: 1...100)
  @State var currentTarget: Int = 0
  @State var currentScore: Int = 0
  let midnightBlue = Color(red: 0/255.0, green: 51/255.0, blue: 102/255.0)
  
  struct LabelStyle: ViewModifier {
    func body(content: Content) -> some View {
      return content
      .foregroundColor(Color.white)
      .modifier(Shadow())
      .font(Font.custom("Arial Rounded MT Bold", size: 18))
    }
  }
  struct ValueStyle: ViewModifier {
    func body(content: Content) -> some View {
      return content
      .foregroundColor(Color.black)
      .font(Font.custom("Arial Rounded MT Bold", size: 18))
    }
  }
  struct ButtonLargeTextStyle: ViewModifier {
    func body(content: Content) -> some View {
      return content
      .foregroundColor(Color.black)
      .font(Font.custom("Arial Rounded MT Bold", size: 18))
    }
  }
  struct ButtonSmallTextStyle: ViewModifier {
    func body(content: Content) -> some View {
      return content
      .foregroundColor(Color.black)
      .font(Font.custom("Arial Rounded MT Bold", size: 12))
    }
  }
  struct Shadow: ViewModifier {
    func body(content: Content) -> some View {
      return content
      .shadow(color: Color.black, radius: 5, x: 3, y: 3)
    }
  }

  var body: some View {
    
    VStack {
      Spacer()
      HStack {
        // Target row
        Text("Put the bullseye as close as you can to: ").modifier(LabelStyle())
        Text("\(target)").modifier(ValueStyle())
                
      }
      Spacer()
      //Slider row
      HStack {
        Text("1").modifier(LabelStyle())
        Slider(value: self.$sliderValue, in: 1...100).accentColor(Color.green)
        Text("100").modifier(LabelStyle())
      }
      Spacer()
      //Button row
      Button(action: {
        print("Button pressed!")
        self.alertIsVisible = true
        self.round += 1
        self.currentTarget = self.getTarget()
        self.currentScore = self.pointsForCurrentRound()
        
      }) {
        Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
        .modifier(ButtonLargeTextStyle())
        
      }.alert(isPresented: $alertIsVisible) { () ->
        Alert in
        
        return Alert(title: Text(alertTitle()),
                     message: Text(
                      "The slider's value is \(sliderValueRounded()).\n" +
                      "You scored \(pointsForCurrentRound()) points this round."),
                     dismissButton: .default(Text("Awesome!")){
                      self.score += self.pointsForCurrentRound()
                      self.target = self.updateTarget()
          })
        
      }
      .background(Image("Button"))
      .modifier(Shadow())
      
      
      Spacer()
      // Score row
      HStack {
        Button(action: {
          print("Start over button pressed")
          self.startNewGame()
        }) {
          HStack {
            Image("StartOverIcon")
            Text("Start Over").modifier(ButtonSmallTextStyle())
          }
        }
        .background(Image("Button"))
        .modifier(Shadow())
        
        Spacer()
        Text("Score: ").modifier(LabelStyle())
        Text("\(score)").modifier(ValueStyle())
        Spacer()
        Text("Round: ").modifier(LabelStyle())
        Text("\(round)").modifier(ValueStyle())
        Spacer()
        
        NavigationLink(destination: AboutView()){
          HStack {
            Image("InfoIcon")
            Text("Info").modifier(ButtonSmallTextStyle())
          }
          
        }
          .background(Image("Button"))
          .modifier(Shadow())
        
      }.padding(.bottom, 20)
    }
    .background(Image("Background"), alignment: .center)
    .accentColor(midnightBlue)
    .navigationBarTitle("Bullseye")
  }
  func sliderValueRounded() -> Int {
    return Int(sliderValue.rounded())
  }
  func startNewGame() {
    self.score = 0
    self.round = 0
    self.sliderValue = 50.0
    self.target = self.updateTarget()
  }
  func pointsForCurrentRound() -> Int {
    let maximumScore = 100
    let difference = amountOff()
    let bonus: Int
    if difference == 0 {
      bonus = 100
    }else if difference == 1 {
      bonus = 50
    }else {
      bonus = 0
    }
    return maximumScore - difference + bonus
  }
  func getTarget() -> Int {
    return target
  }
  func updateTarget() -> Int {
    return Int.random(in: 1...100)
  }
  func amountOff() -> Int {
    return abs(currentTarget-sliderValueRounded())
  }
  func alertTitle() -> String {
    let difference:Int = amountOff()
    let title: String
    if difference == 0 {
      title = "Perfect!"
    }else if difference < 5 {
      title = "You almost had it!"
    }else if difference <= 10 {
      title = "Not Bad"
    }else {
      title = "Are you even trying"
    }
    return title
  }
}

struct ContentView_Previews:
  PreviewProvider {
  static var previews: some View {
    ContentView().previewLayout(.fixed(width: 896, height: 414))
  }
}
