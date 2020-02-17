//
//  AboutView.swift
//  Bullseye
//
//  Created by kenneth yeong on 16/2/20.
//  Copyright © 2020 kenneth yeong. All rights reserved.
//

import SwiftUI

struct AboutView: View {
  let beige = Color(red: 255/255.0, green: 214/255.0, blue: 179/255.0)
  struct AboutHeadingStyle: ViewModifier {
    func body(content: Content) -> some View {
      return content
      .foregroundColor(Color.black)
      .font(Font.custom("Arial Rounded MT Bold", size: 30))
      .padding(.bottom, 20)
      .padding(.top, 20)
    }
  }
  
  struct AboutBodyStyle: ViewModifier {
    func body(content: Content) -> some View {
      return content
      .foregroundColor(Color.black)
      .font(Font.custom("Arial Rounded MT Bold", size: 16))
      .padding(.bottom, 20)
      .padding(.leading, 60)
      .padding(.trailing, 60)
    }
  }
  
  
  
  var body: some View {
    Group {
      VStack {
        
        Text("🎯 Bullseye 🎯")
          .modifier(AboutHeadingStyle())
        
        Text("This is bullseye, the game where you can win points and earn fame by dragging a slider.")
          .modifier(AboutBodyStyle())
        
        Text("Your goal is to place the slider as close tas possible to the target value. The closer you are, the more points you score")
          .modifier(AboutBodyStyle())
          .multilineTextAlignment(.center)
       
        Text("Enjoy!")
          .modifier(AboutBodyStyle())
        
      }
      .navigationBarTitle("About Bullseye")
      .background(beige)
    }
    .background(Image("Background"))
    
  }

}

struct AboutView_Previews: PreviewProvider {
  static var previews: some View {
      AboutView().previewLayout(.fixed(width: 896, height: 414))
  }
}
