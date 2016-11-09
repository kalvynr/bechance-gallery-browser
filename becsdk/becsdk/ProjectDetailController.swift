//
//  ProjectDetailController.swift
//  becsdk
//
//  Created by Kalvyn Rasquinha on 11/17/15.
//  Copyright © 2015 Adobe Systems Inc. All rights reserved.
//

import UIKit

class ProjectDetailController: UIViewController {
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var projectTitle: UILabel!
    @IBOutlet weak var ownerNames: UILabel!
    @IBOutlet weak var creativeFields: UILabel!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    weak var projectInfo = NSDictionary()
    
    @IBAction func onOkTapped(sender: UIButton) {
        dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        
        let coversDict = projectInfo!["covers"] as! NSDictionary
        let coverUrl = coversDict["original"] as! String
        self.spinner.startAnimating()
        self.spinner.hidden = false
        
        NetLayer.sharedInstance.getImageForUrl(coverUrl) { (error, data) -> Void in
            if (error == nil) && (data != nil) {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.spinner.hidden = true
                    self.spinner.stopAnimating()
                    self.coverImage.image = UIImage(data: data!)
                })
            } else {
                self.spinner.hidden = true
                self.spinner.stopAnimating()
                
                self.coverImage.backgroundColor = UIColor.lightGrayColor()
            }
        }
        
        projectTitle.text = projectInfo!["name"] as! String
        
        let ownerList = projectInfo!["owners"] as! NSArray
        var owners = String()
        ownerList.enumerateObjectsUsingBlock { (ownerInfoDict, idx, stop) -> Void in
            
            if idx > 0 {
                owners += ", "
            }
            
            let name = ownerInfoDict["display_name"] as! String
            owners += name
        }
        
        ownerNames.text = owners
        
        let fieldsList = projectInfo!["fields"] as! NSArray
        var fields = String()
        fieldsList.enumerateObjectsUsingBlock { (fieldItem, idx, stop) -> Void in
            
            if idx > 0 {
                fields += ", "
            }
            
            let field = fieldItem as! String
            fields += field
        }
        
        creativeFields.text = fields
    }
}
