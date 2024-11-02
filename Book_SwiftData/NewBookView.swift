//
//  NewBookView.swift
//  Book_SwiftData
//
//  Created by Redwan on 2/11/24.
//

import SwiftUI

struct NewBookView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    @State var title = ""
    @State var author = ""
    var body: some View {
        NavigationStack{
            Form{
                TextField("Book Title", text: $title)
                TextField("Author", text: $author)
                Button("Create"){
                    let newBook = Book(title: title, author: author)
                    context.insert(newBook)
                    dismiss()
                }
                .frame(maxWidth: .infinity , alignment: .trailing)
                .buttonStyle(.borderedProminent)
                .padding(.vertical)
                .disabled(title.isEmpty || author.isEmpty)
                .navigationTitle("New Book")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .topBarLeading){
                        Button("Cancel"){
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NewBookView()
}
