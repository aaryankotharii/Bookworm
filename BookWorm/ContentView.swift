//
//  ContentView.swift
//  BookWorm
//
//  Created by Aaryan Kothari on 01/04/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import SwiftUI

//struct pushButton: View{
//
//    let title : String
//    @Binding var isOn : Bool
//
//    var onColors = [Color.pink,Color.yellow]
//    var offColors = [Color(white : 0.6),
//                     Color(white : 0.4)]
//
//    var body: some View{
//        Button(title){
//            self.isOn.toggle()
//        }.padding()
//            .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .bottomLeading, endPoint: .topTrailing))
//        .clipShape(Capsule())
//        .shadow(radius: isOn ? 0 : 5)
//    }
//}
//
//struct ContentView2: View {
//    @State var rememberMe = false
//    var body: some View {
//        VStack {
//            pushButton(title: "RememberMe", isOn: $rememberMe)
//            Text(rememberMe ? "On" : "Off")
//        }
//    }
//}

struct ContentView: View{
    @Environment(\.horizontalSizeClass) var sizeClass
    var body : some View{
        Text(sizeClass.debugDescription)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
