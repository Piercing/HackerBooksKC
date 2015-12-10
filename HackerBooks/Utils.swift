//
//  Utils.swift
//  HackerBooks
//
//  Created by MacBook Pro on 8/12/15.
//  Copyright © 2015 JCMerlos. All rights reserved.
//

import UIKit

class Utils {
    
    static var util = Utils()
    
    var tags: [String] = []
    var books: [Book] = []
    
    func writeImage(fileName: String, data: NSData) ->  Bool {
        let filePaths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let documentaryDirectory = filePaths[0]
        let path = documentaryDirectory.stringByAppendingString("/" + fileName)
        return data.writeToFile(path, atomically: true)
    }
    
    func getPath(urlImage: NSURL) -> String?{
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let documentPath = paths[0]
        let imageFile = urlImage.path?.componentsSeparatedByString("/")
        if let imagePath = imageFile?.last {
            return documentPath.stringByAppendingString("/" + imagePath)
        }
        return nil
    }
    
    func deleteRepeatedTags() -> [String] {
        
        var tags = [String]()
        
        for tag in self.tags {
            let deleteTag = tag.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
            if !tags.contains(deleteTag) {
                tags.append(deleteTag)
            }
        }
        return tags
    }
    
    func booksCount() ->Int {
        
        let count: Int = Utils.util.books.count
        return count
        
    }
    
    func countByTag (tag:String) -> Int {
        if let index = tags.indexOf(tag) {
            return index
        }
        return 0
    }
    
    
    func booksByTag (tag:String) -> [Book]? {
        var booksMatchByTag : [Book] = [Book]()
        for book in self.books {
            if (book.tags.contains(tag)  || book.tags.contains(" " + tag)) {
                booksMatchByTag.append(book)
            }
        }
        if booksMatchByTag.count > 0 {
            return booksMatchByTag
        }
        return nil
    }
    
}