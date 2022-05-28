//
//  ContentView.swift
//  Swift-Basics
//
//  Created by Sanjay Ananthanarayan on 5/28/22.
//

import SwiftUI

struct ContentView: View {
    var colors: [Color] = [
        .red,
        .green,
        Color(red: 0.3, green: 0.7, blue: 1),
        Color(red: 1, green: 1, blue: 0),
        .gray,
        .purple,
        .indigo
    ]
    
    @State var screenTapped: Bool = false
    
    let colorList1: [Color] = [
        .red,
        .green,
        .blue
    ]
    
    let colorList2: [Color] = [
        .black,
        .white,
        .black,
        .white,
        .black
    ]
    
    let rotateAngle: CGFloat = 360
    
    var body: some View {
        ZStack {
            
            //Background
            LinearGradient(colors: screenTapped ? colorList1: colorList2, startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.6).ignoresSafeArea()
            
            // Some lines of Text
            VStack{
                Spacer()
                
                Text(screenTapped ? "The Basics of SwiftUI" : "To know what you know and what you do not know, that is true knowledge")
                    .font( screenTapped ? .largeTitle : .title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.red)
                    .padding()
                    .rotation3DEffect( screenTapped ? .zero :.degrees(rotateAngle), axis: (x: 0, y: 1, z: 0))
                Text("Another line of text")
                    .font( screenTapped ? .title : .largeTitle)
                    .foregroundColor( screenTapped ? .blue : .white)
                    .padding()
                    .rotation3DEffect( screenTapped ? .zero : .degrees(rotateAngle), axis: (x: 1, y: 0, z: 0))
                Text("Yet another line of text")
                    .font(.caption)
                    .padding()
                    .rotation3DEffect( screenTapped ? .zero :.degrees(rotateAngle), axis: (x: 0, y: 0, z: 1))
                
                Spacer()
                
                if screenTapped {
                    Text("Tap Screen")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.orange)
                        .padding()
                        .background(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .opacity( screenTapped ? 1 : 0)
                }
                
                Spacer()
                
                // Shapes
                HStack(spacing: -30) {
                    ForEach(0 ..< colors.count) { i in Rectangle()
                            .fill(colors[i].opacity(0.7))
                            .cornerRadius(10)
                            .frame(width: 50, height: 50)
                            .rotationEffect(.degrees(screenTapped ? 30 : 0))
                    }
                }
            }
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 1)){
                screenTapped.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
