//
//  ViewController.swift
//  becsdk
//
//  Created by Kalvyn Rasquinha on 11/13/15.
//  Copyright © 2015 Adobe Systems Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var projectsList = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSLog("viewDidLoad")
        
        searchBar.delegate = self
        spinner.hidden = true
        
        NetLayer.sharedInstance.createCacheForResults()
    }
    
    override func viewDidDisappear(animated: Bool) {
        searchBar.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showResultsView" {
            
            let dstController = segue.destinationViewController as! ProjectsController
            dstController.projectList = projectsList
        }
    }
    
    // UISearchBarDelegate
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        NSLog("searchBarSearchButtonClicked: %@", searchBar.text!)
        
        performSearchQuery(searchBar.text!)
    }
    
    // Search Button
    @IBAction func onSearchButtonClicked(sender: UIButton) {
        
        if searchBar.text?.isEmpty == false {
            performSearchQuery(searchBar.text!)
        }
    }
    
    func performSearchQuery(query: String) {
        
        spinner.startAnimating()
        spinner.hidden = false
        
        weak var wself = self
        NetLayer.sharedInstance.getResultsForQuery(query, callback: { (error: NSError?, projects: NSDictionary?) -> Void in
            wself?.spinner.hidden = true
            wself?.spinner.stopAnimating()
            
            if error == nil {
                if projects != nil {
                    
                    wself?.projectsList = projects!["projects"] as! NSArray
                    wself?.performSegueWithIdentifier("showResultsView", sender: wself)
                }
            }
        })
    }
}

