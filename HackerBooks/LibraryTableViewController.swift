//
//  LibraryTableViewController.swift
//  HackerBooks
//
//  Created by MacBook Pro on 8/12/15.
//  Copyright © 2015 JCMerlos. All rights reserved.
//

import UIKit

import UIKit

class LibraryTableViewController: UITableViewController {
    
    //@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    let library = Library()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.library.readData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return Utils.util.tags.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let tag = Utils.util.tags[section]
        if let booksByTag = Utils.util.booksByTag(tag) {
            return booksByTag.count
        }
        return 0
    }
    
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Utils.util.tags[section]
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let tag = Utils.util.tags[indexPath.section]
        let booksForTag = Utils.util.booksByTag(tag)
        let book = booksForTag?[indexPath.row];
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! BookTableViewCell
        
        
        cell.labelTitle.text = book?.title
        cell.labelAuthor.text = book?.authors.joinWithSeparator(",")
        if let imagePath = Utils.util.getPath((book?.urlImage)!) {
            cell.imageBook.image = UIImage(contentsOfFile: imagePath)
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = CGRectMake(10, 0, tableView.frame.size.width, 40.0)
        let view = UIView()
        let title = UILabel(frame: label)
        title.textColor = UIColor.whiteColor()
        title.text = Utils.util.tags[section].uppercaseString
        view.backgroundColor = UIColor(colorLiteralRed: 77.0/255.0, green: 66.0/255.0, blue: 22.0/255.0, alpha: 0.7)
        view.addSubview(title)
        return view
    }
    
    
    
}
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


