//
//  ContentView.swift
//  Book_SwiftData
//
//  Created by Redwan on 2/11/24.
//

import SwiftUI

struct BookListView: View {
    @State var createNewBook = false
    var body: some View {
        NavigationStack{
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
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
}
