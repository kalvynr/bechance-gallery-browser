//
//  ProjectCell.swift
//  becsdk
//
//  Created by Kalvyn Rasquinha on 11/16/15.
//  Copyright © 2015 Adobe Systems Inc. All rights reserved.
//

import UIKit

class ProjectCell: UICollectionViewCell {
    
    @IBOutlet weak var projectImage: UIImageView!
    @IBOutlet weak var projectTitle: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    weak var projectInfo = NSDictionary()
    
    override func prepareForReuse() {
        UIView.animateWithDuration(0.3) { () -> Void in
            self.projectImage.image = nil
            self.projectTitle.textColor = UIColor.whiteColor()
            self.spinner.hidden = true
        }
        
        projectInfo = nil
    }
}
