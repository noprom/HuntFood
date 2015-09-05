//
//  RestaurantTableViewController.swift
//  HuntFood
//
//  Created by noprom on 15/9/4.
//  Copyright (c) 2015年 noprom. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "ForKee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "Thai Cafe"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var restaurantImages = ["avarats_0.jpg", "avarats_1.jpg", "avarats_2.jpg", "avarats_3.jpg", "avarats_4.jpg", "avarats_5.jpg", "avarats_6.jpg", "avarats_7.jpg","avarats_8.jpg", "avarats_9.jpg", "avarats_10.jpg", "avarats_11.jpg", "avarats_12.jpg", "avarats_13.jpg", "avarats_14.png", "avarats_15.png", "avarats_16.png", "avarats_17.png", "avarats_18.png", "avarats_19.png", "avarats_20.png", "avarats_21.png", "avarats_22.png", "avarats_23.png","avarats_24.png", "avarats_25.png", "avarats_26.png", "avarats_27.png", "avarats_28.png", "avarats_29.png", "avarats_30.png", "avarats_31.png", "avarats_32.png"]
    
    var restaurantIsVisited = [Bool](count: 21, repeatedValue: false)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RestraurantCell", forIndexPath: indexPath) as! RestaurantTableViewCell

        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView?.image = UIImage(named: restaurantImages[indexPath.row])
        // 设置圆角
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.width / 2
        cell.thumbnailImageView.clipsToBounds = true
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        // 设置是否访问
        cell.accessoryType = restaurantIsVisited[indexPath.row] ? .Checkmark : .None
        return cell
    }

//    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
//        // 弹出菜单
//        let optionMenu = UIAlertController(title: nil, message: "What do you want?", preferredStyle: UIAlertControllerStyle.ActionSheet)
//        // 取消
//        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
//        // 打电话
//        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: UIAlertActionStyle.Default) { (action: UIAlertAction!) -> Void in
//            let alertMessage = UIAlertController(title: "暂时不提供服务", message: "不好意思，暂时不提供服务", preferredStyle: UIAlertControllerStyle.Alert)
//            alertMessage.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
//            self.presentViewController(alertMessage, animated: true, completion: nil)
//        }
//        // 是否到过
//        let isVisitedAction = UIAlertAction(title: "我已经到过这里了", style: UIAlertActionStyle.Default) { (action: UIAlertAction!) -> Void in
//            let cell = tableView.cellForRowAtIndexPath(indexPath)
//            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
//            self.restaurantIsVisited[indexPath.row] = true
//        }
//        optionMenu.addAction(cancelAction)
//        optionMenu.addAction(callAction)
//        optionMenu.addAction(isVisitedAction)
//        self.presentViewController(optionMenu, animated: true, completion: nil)
//        tableView.deselectRowAtIndexPath(indexPath, animated: true)
//    }
    

    // Override to support conditional editing of the table view.
//    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        // Return NO if you do not want the specified item to be editable.
//        return true
//    }

    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        // 分享
        var shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Normal, title: "分享") { (action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
            let shareMenu = UIAlertController(title: nil, message: "分享", preferredStyle: UIAlertControllerStyle.ActionSheet)
            let tweetAction = UIAlertAction(title: "Twitter", style: UIAlertActionStyle.Default, handler: nil)
            let facebookAction = UIAlertAction(title: "Facebook", style: UIAlertActionStyle.Default, handler: nil)
            let emailAction = UIAlertAction(title: "Email", style: UIAlertActionStyle.Default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
            
            shareMenu.addAction(tweetAction)
            shareMenu.addAction(facebookAction)
            shareMenu.addAction(emailAction)
            shareMenu.addAction(cancelAction)
            self.presentViewController(shareMenu, animated: true, completion: nil)
        }
        
        // 删除
        var deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete") { (action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
            self.restaurantNames.removeAtIndex(indexPath.row)
            self.restaurantLocations.removeAtIndex(indexPath.row)
            self.restaurantTypes.removeAtIndex(indexPath.row)
            self.restaurantIsVisited.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        // 设置按钮背景颜色
        shareAction.backgroundColor = UIColor(red: 255.0/255.0, green: 166.0/255.0, blue:
                51.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue:
                51.0/255.0, alpha: 1.0)
        return [deleteAction, shareAction]
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            self.restaurantNames.removeAtIndex(indexPath.row)
            self.restaurantLocations.removeAtIndex(indexPath.row)
            self.restaurantTypes.removeAtIndex(indexPath.row)
            self.restaurantIsVisited.removeAtIndex(indexPath.row)
//            self.tableView.reloadData()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // 显示详情
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let destinationController = segue.destinationViewController as? DetailViewController
                destinationController?.restaurantImage = self.restaurantImages[indexPath.row]
            }
        }
    }
}
