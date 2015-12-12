//
//  BookDetailsViewController.swift
//  HackerBooks
//
//  Created by MacBook Pro on 10/12/15.
//  Copyright © 2015 JCMerlos. All rights reserved.
//

import UIKit

class BookDetailsViewController: UIViewController {
    var books: [Book] = []
    
    var titleBook = ""
    var authorsBook = [String]()
    var tagsBook = [String]()
    var imagBook = UIImage()
    

    @IBOutlet weak var imageBook: UIImageView!{
        didSet{
            self.imageBook.image = imagBook
        }
    }
    
    @IBOutlet weak var labelTitle: UILabel!{
        didSet {
            self.labelTitle.text = titleBook
        }
    }
    
    
    @IBOutlet weak var labelAuthors: UILabel!{
        didSet {
            self.labelAuthors.text = authorsBook.joinWithSeparator(",")
        }
    }
    
    
    @IBOutlet weak var labelTags: UILabel!{
        didSet {
            self.labelTags.text = tagsBook.joinWithSeparator(",")
        }
    }
    
    @IBAction func buttonViewPDF(sender: UIButton) {
        
        let ourStoryBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewPDF = ourStoryBoard.instantiateViewControllerWithIdentifier("viewPDF") as! ViewWeb
        self.presentViewController(viewPDF, animated: true, completion: nil)
    }
    
    @IBAction func checkFavorite(sender: UISwitch) {
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    
    
    
    
    
    
    
    
    
    
    
    
}
