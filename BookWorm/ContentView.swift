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
    @FetchRequest(entity: Book.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Book.title, ascending: true)
    ]) var books : FetchedResults<Book>
    @State private var showingAddScreen = false
    
    var body : some View{
        NavigationView{
            List{
                ForEach(books, id: \.self){book in
                    NavigationLink(destination:DetailView(book: book)) {
                        EmojiRatingView(rating: book.rating)
                            .font(.largeTitle)
                        
                        VStack(alignment: .leading){
                            Text(book.title ?? "Unknown Title")
                                .font(.headline)
                            Text(book.author ?? "Unknown Author")
                                .foregroundColor(.secondary)
                        }
                    }
                    
                }
            .onDelete(perform: deleteBooks)
            }
            .navigationBarTitle("BookWorm")
            .navigationBarItems(leading: EditButton(),trailing: Button(action: {
                    self.showingAddScreen.toggle()
                }){
                    Image(systemName: "plus")
                }).sheet(isPresented: $showingAddScreen){
                    AddBookView().environment(\.managedObjectContext, self.moc)
            }
        }
    }
    
    func deleteBooks(at offsets : IndexSet){
        for offset in offsets{
        let book = books[offset]
        moc.delete(book)
        }
        try? moc.save()
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
