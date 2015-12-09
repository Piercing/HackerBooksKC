//
//  Utils.swift
//  HackerBooks
//
//  Created by MacBook Pro on 9/12/15.
//  Copyright © 2015 JCMerlos. All rights reserved.
//

import UIKit

class Utils  {
    
    static var util = Utils()
    
    var tags: [String] = []
    var books: [Book] = []
    
    func writeImageToFile(fileName: String, data:NSData) ->Bool{
        let filePaths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,
            NSSearchPathDomainMask.UserDomainMask, true)
        let documentaryDirectory = filePaths[0]
        let dirPath = documentaryDirectory.stringByAppendingString("/" + fileName)
        return data.writeToFile(dirPath, atomically: true)
    }
    
    
    func deleteDuplicateTags() -> [String] {
        
        var Tags = [String]()
        
        for tag in self.tags {
            let delteTag = tag.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
            if !Tags.contains(delteTag) {
                Tags.append(delteTag)
            }
        }
        return Tags
    }
    
    
    func getPath(urlImage: NSURL) -> String?{
        let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let documentDirectoryPath = path[0]
        let imageFile = urlImage.path?.componentsSeparatedByString("/")
        if let imagePath = imageFile?.last {
            
            return documentDirectoryPath.stringByAppendingString("/" + imagePath)
        }
        return nil
    }
    
    
    func bookCountForTag (tag:String) -> Int {
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
