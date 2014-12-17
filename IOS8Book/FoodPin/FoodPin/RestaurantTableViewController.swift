//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Tony on 12/4/14.
//  Copyright (c) 2014 Tony. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
//    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "Thai Cafe"]
//    
//    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg",
//        "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg",
//        "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg",
//        "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg",
//        "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
//    
//    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney",
//        "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London",
//        "London", "London"]
//    
//    var restaurantTypes = ["Coffee & Tea Shop",
//            "Cafe", "Tea House", "Austrian / Causual Drink",
//            "French", "Bakery", "Bakery", "Chocolate", "Cafe",
//            "American / Seafood", "American", "American",
//            "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish",
//            "Spanish", "British", "Thai"]
//    
//    var restaurantIsVisited = [false, false, false, false, false,
//    false, false, false, false, false, false, false, false, false,
//    false, false, false, false, false, false, false]
    
    var restaurants:[Restaurant] = [Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong",
        image: "cafedeadend.jpg", isVisited: false),Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei.jpg",
        isVisited: false),Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image:
        "teakha.jpg", isVisited: false),Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong",
        image: "cafeloisl.jpg", isVisited: false),Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image:
        "petiteoyster.jpg", isVisited: false),Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image:
        "forkeerestaurant.jpg", isVisited: false),Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image:
        "posatelier.jpg", isVisited: false),Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image:
        "bourkestreetbakery.jpg", isVisited: false),Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image:
        "haighschocolate.jpg", isVisited: false),Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney",
        image: "palominoespresso.jpg", isVisited: false),Restaurant(name: "Upstate", type: "American", location: "New York", image:
        "upstate.jpg", isVisited: false),Restaurant(name: "Traif", type: "American", location: "New York", image: "traif.jpg",
        isVisited: false),Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "grahamavenuemeats.jpg",isVisited: false),Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image:
        "wafflewolf.jpg", isVisited: false),Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image:
        "fiveleaves.jpg", isVisited: false),Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image:
        "cafelore.jpg", isVisited: false),Restaurant(name: "Confessional", type: "Spanish", location: "New York", image:
        "confessional.jpg", isVisited: false),Restaurant(name: "Barrafina", type: "Spanish", location: "London", image:
        "barrafina.jpg", isVisited: false),Restaurant(name: "Donostia", type: "Spanish", location: "London", image:
        "donostia.jpg", isVisited: false),Restaurant(name: "Royal Oak", type: "British", location: "London", image:
        "royaloak.jpg", isVisited: false),Restaurant(name: "Thai Cafe", type: "Thai", location: "London", image: "thaicafe.jpg",
        isVisited: false)]
    
    override func viewDidLoad() {
//                        ￼UINavigationBar.appearance().barTintCol = UIColor(red:
//                        231.0/255.0, green: 95.0/255.0, blue: 53.0/255.0, alpha: 0.3)

        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.restaurants.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as CustomTableViewCell
        
        // Configure the cell...
        let restaurant = restaurants[indexPath.row]
        cell.nameLabel.text = restaurant.name
        cell.locationLabel.text = restaurant.location
        cell.typeLabel.text = restaurant.type
        cell.thumbnailImageView.image = UIImage(named: restaurant.image)
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width / 2
        cell.thumbnailImageView.clipsToBounds = true
        return cell
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let optionMenu = UIAlertController(title: nil, message: "what do you want to do?", preferredStyle: .ActionSheet)
//        let callActionHandler = { (action: UIAlertAction!) -> Void in
//            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet, please retry later", preferredStyle: .Alert)
//            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//            self.presentViewController(alertMessage, animated: true, completion: nil)
//            
//        }
//        let isVisitedAction = UIAlertAction(title: "I`ve been here", style: .Default, handler: {
//            (action: UIAlertAction!) -> Void in
//            let cell = tableView.cellForRowAtIndexPath(indexPath)
//            cell?.accessoryType = .Checkmark
//            self.restaurantIsVisited[indexPath.row] = true
//        })
//        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: UIAlertActionStyle.Default, handler: callActionHandler)
//        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
//        optionMenu.addAction(callAction)
//        optionMenu.addAction(cancelAction)
//        optionMenu.addAction(isVisitedAction)
//        self.presentViewController(optionMenu, animated: true, completion: nil)
//    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
//            self.restaurantNames.removeAtIndex(indexPath.row)
//            self.restaurantLocations.removeAtIndex(indexPath.row)
//            self.restaurantTypes.removeAtIndex(indexPath.row)
//            self.restaurantIsVisited.removeAtIndex(indexPath.row)
//            self.restaurantImages.removeAtIndex(indexPath.row)
//            self.tableView.reloadData()
              self.restaurants.removeAtIndex(indexPath.row)
        self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        var shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share", handler: {
            (action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
            let shareMenu = UIAlertController(title: nil, message: "Share using", preferredStyle: .ActionSheet)
            let twitterAction = UIAlertAction(title: "Twitter", style: UIAlertActionStyle.Default, handler: nil)
            let facebookAction = UIAlertAction(title: "Facebook", style: UIAlertActionStyle.Default, handler: nil)
            let emailAction = UIAlertAction(title: "Email", style: UIAlertActionStyle.Default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil)
            shareMenu.addAction(twitterAction)
            shareMenu.addAction(facebookAction)
            shareMenu.addAction(emailAction)
            shareMenu.addAction(cancelAction)
            self.presentViewController(shareMenu, animated: true, completion: nil)
        })
        var deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler: {
                (action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
//                self.restaurantNames.removeAtIndex(indexPath.row)
//                self.restaurantLocations.removeAtIndex(indexPath.row)
//                self.restaurantTypes.removeAtIndex(indexPath.row)
//                self.restaurantIsVisited.removeAtIndex(indexPath.row)
//                self.restaurantImages.removeAtIndex(indexPath.row)
            self.restaurants.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        })
        shareAction.backgroundColor = UIColor(red: 255.0/255.0, green: 166.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        return [deleteAction, shareAction]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let destinationController = segue.destinationViewController as DetailViewController
                destinationController.restaurant = restaurants[indexPath.row]
            }
        }
    }
    
}
