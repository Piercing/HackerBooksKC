//
//  Book.swift
//  HackerBooks
//
//  Created by MacBook Pro on 8/12/15.
//  Copyright © 2015 JCMerlos. All rights reserved.
//

import UIKit

class Book {
    let title       : String
    let authors     : [String]
    let tags        : [String]
    let urlImage    : NSURL
    let urlPDF      : NSURL
    
    init(title  : String,
        authors : [String],
        tags    : [String],
        urlImage: NSURL,
        urlPDF  : NSURL) {
            
            self.title    = title
            self.authors  = authors
            self.tags     = tags
            self.urlImage = urlImage
            self.urlPDF   = urlPDF
    }
}