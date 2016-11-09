//
//  ProjectsController.swift
//  becsdk
//
//  Created by Kalvyn Rasquinha on 11/16/15.
//  Copyright © 2015 Adobe Systems Inc. All rights reserved.
//

import UIKit

class ProjectsController: UICollectionViewController {
    
    var projectList = NSArray()
    
    //
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showDetailView" {
            let dstViewController = segue.destinationViewController as! ProjectDetailController
            let selectedItems = collectionView?.indexPathsForSelectedItems()
            
            let projectInfo = projectList[selectedItems![0].row] as! NSDictionary
            dstViewController.projectInfo = projectInfo
        }
    }
    
    // UICollectionViewDataSource
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (section == 0) {
            return projectList.count
        } else {
            return 0
        }
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("projectCell", forIndexPath: indexPath) as! ProjectCell
        cell.spinner.startAnimating()
        cell.spinner.hidden = false
        
        let projectInfo = projectList[indexPath.row] as! NSDictionary
        cell.projectInfo = projectInfo
        
        let title = projectInfo["name"] as! String
        let coversDict = projectInfo["covers"] as! NSDictionary
        let coverUrl = coversDict["115"] as! String
        
        cell.projectTitle.text = title
        cell.projectTitle.textColor = UIColor.whiteColor()
        
        NetLayer.sharedInstance.getImageForUrl(coverUrl) { (error, data) -> Void in
            if (error == nil) && (data != nil) {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    cell.projectImage.image = UIImage(data: data!)
                    cell.projectTitle.textColor = UIColor.blackColor()
                    cell.spinner.hidden = true
                    cell.spinner.stopAnimating()
                })
            }
        }
        
        return cell;
    }
    
    // UICollectionViewDelegate
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("showDetailView", sender: collectionView.cellForItemAtIndexPath(indexPath))
    }
}