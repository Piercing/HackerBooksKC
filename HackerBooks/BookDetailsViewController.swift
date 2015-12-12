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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.labelTitle.text = titleBook
        
        self.labelAuthors.text = authorsBook.joinWithSeparator(",")
        
        self.labelTags.text = tagsBook.joinWithSeparator(",")
        
        self.imageBook.image = imagBook
        
    }
    
    @IBOutlet weak var imageBook: UIImageView!
    
    @IBOutlet weak var labelTitle: UILabel!{
        didSet {
            labelTitle.textColor = UIColor.blueColor()
            //labelTitle.text = titleBook
        }
    }
    
    
    @IBOutlet weak var labelAuthors: UILabel!{
        didSet {
            labelAuthors.textColor = UIColor.purpleColor()
           // labelAuthors.text = authorsBook.joinWithSeparator(",")
        }
    }
    
    
    @IBOutlet weak var labelTags: UILabel!{
        didSet {
            labelTags.tintColor = UIColor.magentaColor()
           // labelTags.text = tagsBook.joinWithSeparator(",")
        }
    }
    

    
    
    //    required init?(coder aDecoder: NSCoder) {
    //        super.init(coder: aDecoder)
    //    }
    //
    //    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
    //        labelTitle = UILabel()
    //        labelAuthors = UILabel()
    //        labelTags = UILabel()
    //        imageBook = UIImageView()
    //        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    //    }
    //
    //    convenience  init() {
    //        self.init(nibName: nil, bundle: nil)
    //    }
    
    
    
    
    @IBAction func buttonViewPDF(sender: UIButton) {
        
        let ourStoryBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewPDF = ourStoryBoard.instantiateViewControllerWithIdentifier("viewPDF") as! ViewWeb
        self.presentViewController(viewPDF, animated: true, completion: nil)
    }
    
    @IBAction func checkFavorite(sender: UISwitch) {
        
        
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Do any additional setup after loading the view.
//    }
    
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
