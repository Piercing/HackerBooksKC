//
//  Library.swift
//  HackerBooks
//
//  Created by MacBook Pro on 9/12/15.
//  Copyright © 2015 JCMerlos. All rights reserved.
//

import UIKit

class Library  {
    
    var books: [Book] = []
    var tags: [String] = []
    
    
    static let urlHTTPS = "https://t.co/K9ziV0z3SJ"
    static let urlLOCAL = "books"
    
    var booksCount:Int {
        get {
            let count: Int = self.books.count
            return count
        }
    }
    
    func getJSON(data: NSData){
        
        do{
            let jsonSerialization = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSArray
            
            for items in jsonSerialization {
                
                let authors = (items["authors"] as! String).componentsSeparatedByString(",")
                let tags    = (items["tags"] as! String).componentsSeparatedByString(",")
                let book    = Book(title: items["title"] as! String,
                    authors : authors,
                    tags    : tags,
                    urlImage: NSURL(string: items["image_url"] as! String)!,
                    urlPDF  : NSURL(string: items["pdf_url"] as! String)!)
                
                self.tags.appendContentsOf(tags)
                self.books.append(book)
            }
            
            self.tags = Utils.util.deleteDuplicateTags()
        }catch let error as NSError {
            print(error.localizedDescription)
        }
        
    }
    
    // Leer datos
    func readData()-> Void{
        
        // Averiguamos si tenemos los datos
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let data = userDefaults.dataForKey(Library.urlLOCAL){
            
            self.getJSON(data)
            self.tags.sortInPlace()
            self.books.sortInPlace({(a,b) -> Bool in
                return a.title.compare(b.title) == NSComparisonResult.OrderedAscending
            })
            // Si no, los descargamos en segundo plano
        }else{
            
            let priorityBackground = DISPATCH_QUEUE_PRIORITY_BACKGROUND
            dispatch_async(dispatch_get_global_queue(priorityBackground, 0),{
                
                if let urlPath =  NSURL(string: Library.urlHTTPS) {
                    let data : NSData = NSData(contentsOfURL: urlPath)!
                    
                    self.getJSON(data)
                    self.books.sortInPlace({ (a, b) -> Bool in
                        return a.title.compare(b.title) == NSComparisonResult.OrderedAscending
                    })
                    self.tags.sortInPlace()
                    
                    // Guardo imágenes en local
                    for book in self.books {
                        
                        let loadImageData : NSData = NSData(contentsOfURL: book.urlImage)!
                        let imageFile = book.urlImage.path?.componentsSeparatedByString("/")
                        if let imagePath = imageFile?.last {
                            Utils.util.writeImageToFile(imagePath, data: loadImageData)
                        }
                    }
                    
                    // Guardo los datos
                    dispatch_async(dispatch_get_main_queue(), {
                        userDefaults.setValue(data, forKey: Library.urlLOCAL)
                        userDefaults.synchronize()
                    })
                }
            })
        }
    }

    
    
    
    
    
    
    
    
    
    
}





















