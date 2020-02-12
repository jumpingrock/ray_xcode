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
  @State var whoseThereIsVisible: Bool = false

  var body: some View {
    

    VStack {

      Text("Welcome to my first app!")
        .fontWeight(.semibold)
        .foregroundColor(Color.green)

      Button(action: {
        print("Button pressed!")
        self.alertIsVisible = true
      }) {
        Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
      }.alert(isPresented: $alertIsVisible) { () ->
        Alert in
        return Alert(title: Text("Hello there!"),
                     message: Text("This is my first pop-up"),
                     dismissButton: .default(Text("Awsome!")))
    
      }
      Button(action: {
        self.whoseThereIsVisible = true
      }) {
        Text("Knock knock!")
      }.alert(isPresented: $whoseThereIsVisible) { () ->
        Alert in
        return Alert(title: Text("whose there"),
                     message: Text("I am"),
                     dismissButton: .default(Text("I am boning yo mama!")))
      }
    }
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
