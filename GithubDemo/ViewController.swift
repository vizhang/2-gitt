//
//  ViewController.swift
//  GithubDemo
//
//  Created by Nhan Nguyen on 5/12/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var searchBar: UISearchBar!
    var searchSettings = GithubRepoSearchSettings()
    var repositories: [GithubRepo]?
    var minStars: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize UISearchBar
        searchBar = UISearchBar()
        searchBar.delegate = self
        
        // add search bar to navigation bar
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        
        doSearch()
        
        //Set Tableview
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        minStars = 200
    }
    
    private func doSearch() {
        MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        GithubRepo.fetchRepos(searchSettings, successCallback: { (repos) -> Void in

            self.repositories = repos
            
            MBProgressHUD.hideHUDForView(self.view, animated: true)
            self.tableView.reloadData()
        }, error: { (error) -> Void in
            println(error)
        })
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let repos = repositories {
            return repositories!.count
        } else {
            return 0
        }
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("RepoCell", forIndexPath: indexPath) as! RepoCell
        let repo = repositories![indexPath.row]
        cell.starLabel.text = String(repo.stars!)
        cell.forkLabel.text = String(repo.forks!)
        cell.usernameLabel.text = repo.ownerHandle
        cell.repoLabel.text = repo.name
        var url = NSURL(string: repo.ownerAvatarURL!)
        cell.profileImage!.setImageWithURL(url)
        
        cell.descriptionLabel.text = repo.description
        
        return cell
        
    }

    
    @IBAction func saveToMainMenu(sender: UIStoryboardSegue)
    {
        let sourceVC = sender.sourceViewController as! SettingsTableViewController
        self.searchSettings.minStars = sourceVC.minStars!
        doSearch()
    }
    
    @IBAction func cancelToMainMenu(sender: UIStoryboardSegue)
    {
        //Literally does nothing...
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "OpenSettings" {
            let nav = segue.destinationViewController as! UINavigationController
            let settingsVC = nav.topViewController as! SettingsTableViewController
            settingsVC.minStars = self.searchSettings.minStars
        }
    }
    
}



extension ViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true;
    }
    
    func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(false, animated: true)
        return true;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchSettings.searchString = searchBar.text
        searchBar.resignFirstResponder()
        doSearch()
    }
}