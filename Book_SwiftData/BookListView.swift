//
//  ContentView.swift
//  Book_SwiftData
//
//  Created by Redwan on 2/11/24.
//

import SwiftUI
import SwiftData

struct BookListView: View {
    @Query(sort: \Book.title) var books: [Book]
    @Environment(\.modelContext) var context
    
    @State var createNewBook = false
    var body: some View {
        NavigationStack{
            Group{
                if books.isEmpty {
                    ContentUnavailableView("Enter Your first Book" , systemImage: "book.fill")
                } else {
                    List{
                        ForEach(books){ book in
                            NavigationLink{
                                Text(book.author)
                            } label: {
                                HStack(spacing: 10){
                                    book.icon
                                    VStack(alignment: .leading){
                                        Text(book.title).font(.title2)
                                        Text(book.author).foregroundStyle(.secondary)
                                        if let rating = book.rating{
                                          HStack{
                                                ForEach(0..<rating, id: \.self){
                                                    _ in
                                                    Image(systemName: "star.fill")
                                                        .imageScale(.small)
                                                        .foregroundStyle(.yellow)
                                                }
                                            }
                                        }
                                        
                                    }
                                }
                            }
                            
                        }
                        .onDelete{
                            indexSet in indexSet.forEach{
                                index in let book = books[index]
                                context.delete(book)
                            }
                        }
                    }
                }
            }
            
            .listStyle(.plain)
            .navigationTitle("My Books")
            .toolbar{
                Button{
                    createNewBook = true
                }label: {
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large)
                    
                }
                .sheet(isPresented: $createNewBook){
                    NewBookView()
                        .presentationDetents([.medium])
                    
                }
            }
        
        }
    }
}

#Preview {
    BookListView()
        .modelContainer(for: Book.self, inMemory:  true)
}
