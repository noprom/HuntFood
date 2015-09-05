//
//  DetailViewController.swift
//  HuntFood
//
//  Created by noprom on 15/9/5.
//  Copyright (c) 2015年 noprom. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var restaurant: Restaurant!
    @IBOutlet var restaurantImageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.restaurantImageView.image = UIImage(named: restaurant.image)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as!DetailTableViewCell
        switch indexPath.row {
            case 0:
                cell.fieldLabel.text = "Name"
                cell.valueLabel.text = restaurant.name
            case 1:
                cell.fieldLabel.text = "Type"
                cell.valueLabel.text = restaurant.type
            case 2:
                cell.fieldLabel.text = "Location"
                cell.valueLabel.text = restaurant.location
            case 3:
                cell.fieldLabel.text = "Been here"
                cell.valueLabel.text = (restaurant.isVisited) ? "Yes, I’ve been here before" : "No"
            default:
                cell.fieldLabel.text = ""
                cell.valueLabel.text = ""
        }
        return cell
        
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
