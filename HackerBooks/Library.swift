//
//  Library.swift
//  HackerBooks
//
//  Created by MacBook Pro on 8/12/15.
//  Copyright © 2015 JCMerlos. All rights reserved.
//

import UIKit

class Library {
    
    static let urlHTTPS  = "https://t.co/K9ziV0z3SJ"
    static let urlLocal  = "books"
 
    // Obtener el JSON
    func getJSON(data: NSData) {
        do {
            let serializerJSON = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSArray
 
            for element in serializerJSON  {
                
                let authors = (element["authors"] as! String).componentsSeparatedByString(",")
                let tags = (element["tags"] as! String).componentsSeparatedByString(",")
                
                let book = Book(title: element["title"] as! String,
                    authors: authors,
                    tags:tags,
                    urlImage: NSURL(string: element["image_url"] as! String)!,
                    urlPDF:  NSURL(string: element["pdf_url"] as! String)!)
                
                Utils.util.tags.appendContentsOf(tags)
                Utils.util.books.append(book)
            }
            
            Utils.util.tags = Utils.util.deleteRepeatedTags()
        } catch let error as NSError {
            NSLog("%@", error.description)
        }
    }
    
    // Leer datos de disco
    func readData() -> Void {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let data = userDefaults.dataForKey(Library.urlLocal) {
            self.getJSON(data)
            Utils.util.tags.sortInPlace()
            Utils.util.books.sortInPlace({ (a, b) -> Bool in
                return a.title.compare(b.title) == NSComparisonResult.OrderedAscending
            })
        }
            // si no, los descargamos en segundo plano
        else {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
                
                if let urlPath =  NSURL(string: Library.urlHTTPS) {
                    
                    let data : NSData = NSData(contentsOfURL: urlPath)!
                    self.getJSON(data)
                    
                    Utils.util.books.sortInPlace({ (a, b) -> Bool in
                        return a.title.compare(b.title) == NSComparisonResult.OrderedAscending
                    })
                    Utils.util.tags.sortInPlace()
                    
                    // Guardamos imágenes
                    for item in Utils.util.books {
                        
                        let imageData : NSData = NSData(contentsOfURL: item.urlImage)!
                        let imageFileName = item.urlImage.path?.componentsSeparatedByString("/")
                        if let imagePath = imageFileName?.last {
                            Utils.util.writeImage(imagePath, data: imageData)
                        }
                    }
                    // Guardamos datos
                    dispatch_async(dispatch_get_main_queue(), {
                        userDefaults.setValue(data, forKey: Library.urlLocal)
                        userDefaults.synchronize()
                    })
                }
            })
        }
    }   
}





















