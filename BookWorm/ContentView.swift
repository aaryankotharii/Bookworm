//
//  ContentView.swift
//  BookWorm
//
//  Created by Aaryan Kothari on 01/04/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import SwiftUI



struct ContentView: View{
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Book.entity(), sortDescriptors: []) var books : FetchedResults<Book>
    @State private var showingAddScreen = false
    
    var body : some View{
        NavigationView{
            Text("Count: \(books.count)")
            .navigationBarTitle("BookWorm")
                .navigationBarItems(trailing: Button(action: {
                    self.showingAddScreen.toggle()
                }){
                    Image(systemName: "plus")
                }).sheet(isPresented: $showingAddScreen){
                    AddBookView().environment(\.managedObjectContext, self.moc)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}








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
