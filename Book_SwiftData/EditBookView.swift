//
//  EditBookView.swift
//  Book_SwiftData
//
//  Created by Redwan on 3/11/24.
//

import SwiftUI

struct EditBookView: View {
    //let book: Book
    @State var status = Status.onShelf
    @State private var  rating: Int?
    @State var title = ""
    @State var author = ""
    @State var summary = ""
    @State var dateAdded = Date.distantPast
    @State var dateStarted = Date.distantPast
    @State var dateCompleted = Date.distantPast
    var body: some View {
        HStack{
            Text("Status")
            Picker("Status", selection: $status){
                ForEach(Status.allCases){
                    status in Text(status.descr).tag(status)
                }
            }
            .buttonStyle(.bordered)
        }
        VStack(alignment: .leading)
        {
            GroupBox{
                
                LabeledContent{
                    DatePicker("",selection: $dateAdded, displayedComponents: .date)
                }label: {
                    Text("Date Added ")
                }
                
            }
            
            
        }
           
        
            
        
    }
}

#Preview {
    EditBookView()
}
