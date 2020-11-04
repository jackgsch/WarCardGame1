//
//  ContentView.swift
//  WarCardGame
//
//  Created by 90305189 on 9/16/20.
//  Copyright © 2020 Jack Gschwendtner. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var randNum1 = 2
    @State private var randNum2 = 2
    
    @State private var score1 = 0
    @State private var score2 = 0
    
    var body: some View {
        
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                Image("logo")
                
                Spacer()
                
                HStack {
                    Image("card" + String(randNum1))
                    Image("card" + String(randNum2))
                } // HStack
                
                Spacer()
                
                Button(action: {
                    // Randomize state properties for randNum1 + randNum2
                    self.randNum1 =
                        Int.random(in: 2...14)
                    self.randNum2 =
                        Int.random(in: 2...14)
                    
                    // Update Scores
                    if self.randNum1 > self.randNum2 {
                        self.score1 += 1
                    } else if self.randNum2 > self.randNum1 {
                        self.score2 += 1
                    }
                    
                }) {
                    
                    Image("dealbutton")
                        .renderingMode(.original)
                    
                }
                
                Spacer()
                
                HStack {

                    VStack {
                        Text("Player:")
                            .bold()
                            .padding(.bottom, 20)
                        Text(String(score1))
                    } .padding(.leading, 20)
                        .foregroundColor(.white) // Player VStack
                    
                    Spacer()
                    
                    Image("back")
                        .resizable()
                        .frame(width: 120, height: 168) // 5 x 7 aspect ratio
                    
                    Spacer()
                    
                    VStack {
                        Text("CPU:")
                            .bold()
                            .padding(.bottom, 20)
                        Text(String(score2))
                    } .padding(.trailing, 20)
                    .foregroundColor(.white) // CPU VStack
                }  // HStack
                
                Spacer()
                
            } // VStack
        } // ZStack
    } // var body: some view
} // struc

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
