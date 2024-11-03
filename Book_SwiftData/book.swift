//
//  book.swift
//  Book_SwiftData
//
//  Created by Redwan on 2/11/24.
//

import SwiftUI
import SwiftData


@Model
class Book{
    
    var title: String
    var author: String
    var dateAdded: Date
    var dateStarted: Date
    var dateCompleted: Date
    var summery: String
    var rating: Int?
    var status: Status
    
    init(
        title: String,
        author: String,
        dateAdded: Date = Date.now,
        dateStarted: Date = Date.distantPast,
        dateCompleted: Date = Date.distantPast,
        summery: String = "",
        rating: Int? = nil,
        status: Status = .onShelf
    ) {
        self.title = title
        self.author = author
        self.dateAdded = dateAdded
        self.dateStarted = dateStarted
        self.dateCompleted = dateCompleted
        self.summery = summery
        self.rating = rating
        self.status = status
    }
    
    var icon: Image {
        switch status {
            
        case .onShelf:
            Image(systemName: "checkmark.diamond.fill")
        case .inProgress:
            Image(systemName: "book.fill")
        case .Completed:
            Image(systemName: "books.vertical.fill")
            
        }
    }
    
}

enum Status: Int, Codable, Identifiable, CaseIterable {
    
    case onShelf, inProgress, Completed
    var id: Self {
        
        self
    }
    var descr: String {
        switch self {
        case .onShelf:
            "On Shelf"
        case .inProgress:
            "In Progress"
        case .Completed:
            "Completed"
            
        }
        
        
    }
    
}
