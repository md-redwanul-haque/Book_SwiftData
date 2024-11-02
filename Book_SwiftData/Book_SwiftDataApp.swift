//
//  Book_SwiftDataApp.swift
//  Book_SwiftData
//
//  Created by Redwan on 2/11/24.
//

import SwiftUI
import SwiftData


@main
struct Book_SwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            BookListView()
        }
        .modelContainer(for: Book.self)
    }
    
    init(){
        
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
        
    }
    
}
