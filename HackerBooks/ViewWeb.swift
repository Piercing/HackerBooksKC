//
//  vewViewViewController.swift
//  HackerBooks
//
//  Created by MacBook Pro on 8/12/15.
//  Copyright © 2015 JCMerlos. All rights reserved.
//

import UIKit

class ViewWeb: UIViewController {

    var book : Book?
    let library = Library()
    var pathPDF: String = ""
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBAction func buttonDone(sender: UIBarButtonItem) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let directoriePath =  NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentDirectory = directoriePath[0]
        let pdf = NSURL(fileURLWithPath: documentDirectory.stringByAppendingString(pathPDF))
        webView.loadRequest(NSURLRequest(URL: pdf))
        zoom()
    }
    
    func zoom(){
        
        webView.scalesPageToFit = true
    }
    
    
    func showPDF(){
        
        let pdfLoc = NSURL(fileURLWithPath:(NSBundle.mainBundle().pathForResource(pathPDF, ofType:"pdf"))!)
        let request = NSURLRequest(URL: pdfLoc);
        webView.loadRequest(request);
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
