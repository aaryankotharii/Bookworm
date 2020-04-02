//
//  DetailView.swift
//  BookWorm
//
//  Created by Aaryan Kothari on 02/04/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import CoreData
import SwiftUI

struct DetailView: View {
    let book : Book
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert = false
    
    var body: some View {
        GeometryReader{gr in
            VStack{
                ZStack(alignment: .bottomLeading) {
                    Image(self.book.genre ?? "Fantasy")
                        .frame(maxWidth: gr.size.width)
                    Text(self.book.genre?.uppercased() ?? "FANTASY")
                        .font(.caption)
                        .fontWeight(.black)
                    .padding(8)
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
                }
                
                Text(self.book.author ?? "Unknown author")
                    .font(.title)
                    .foregroundColor(.secondary)
                Text(self.book.review ?? "No review")
                .padding()
                
                RatingView(rating: .constant(Int(self.book.rating)))
                    .font(.largeTitle)
                Spacer()
            }
            
        }.navigationBarTitle(Text(book.title ?? "Unknown book" ),displayMode: .inline)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Delete Book"), message: Text("Are you sure?"), primaryButton: .destructive(Text("Delete")){
                    self.deleteBook()
                    }, secondaryButton: .cancel())
        }
        .navigationBarItems(trailing: Button(action: {
            self.showAlert = true
        }){
           Image(systemName: "trash")
        })
    }
    
    func deleteBook(){
        moc.delete(book)
        
        //try? self.moc.save()
        
        presentationMode.wrappedValue.dismiss()
    }
}

struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    static var previews: some View {
        let book = Book(context: moc)
        book.title = "Test book"
        book.author = "Test author"
        book.genre = "Fantasy"
        book.rating = 4
        book.review = "Good"
        
        return NavigationView{
        DetailView(book: book)
        }
    }
}
