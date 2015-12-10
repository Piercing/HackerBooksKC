//
//  BookDetailsViewController.swift
//  HackerBooks
//
//  Created by MacBook Pro on 10/12/15.
//  Copyright © 2015 JCMerlos. All rights reserved.
//

import UIKit

class BookDetailsViewController: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var labelAuthors: UILabel!
    
    @IBOutlet weak var labelTags: UILabel!
    
    @IBOutlet weak var imageBook: UIImageView!
    
    @IBAction func buttonViewPDF(sender: UIButton) {
        
        let ourStoryBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let viewPDF = ourStoryBoard.instantiateViewControllerWithIdentifier("viewPDF") as! ViewWeb
        
        self.presentViewController(viewPDF, animated: true, completion: nil)
    }
    
    @IBAction func checkFavorite(sender: UISwitch) {
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
