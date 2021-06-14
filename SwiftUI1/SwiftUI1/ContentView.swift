//
//  ContentView.swift
//  SwiftUI1
//
//  Created by Sushil Pratap on 17/1/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Spacer()
        Image("dog")
        Spacer()
//        Sf images look up & fix
        Image("bolt.fill")
        Text("Get Fucked!!")
            .font(.largeTitle)
        Text("Hello, Fucking World!")
            .foregroundColor(Color.red)
            .multilineTextAlignment(.center)
            .padding(.all)
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                
        }
        
    }
}
