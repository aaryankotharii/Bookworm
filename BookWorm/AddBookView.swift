//
//  AddBookView.swift
//  BookWorm
//
//  Created by Aaryan Kothari on 01/04/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    let genres = ["Fantasy","Horror","Kids","Mystery","Poetry","Romance","Thriller"]

    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Name of book", text: $title)
                    TextField("Author's Name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self){
                            Text($0)
                        }
                        }
                }
                
                Section{
                    RatingView(rating: $rating)
                    
                    TextField("review", text: $review)
                }
                
                Section{
                    Button("Save"){
                        // add book
                        let newBook = Book(context: self.moc)
                        
                         newBook.title = self.title
                         newBook.author = self.author
                         newBook.genre = self.genre
                        newBook.review = self.review
                        newBook.rating = Int16(self.rating)
                        
                        try? self.moc.save()
                        
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }.navigationBarTitle("Add Book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
