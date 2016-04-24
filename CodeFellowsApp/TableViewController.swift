//
//  TableViewController.swift
//  CodeFellowsApp
//
//  Created by David Maybach on 4/23/16.
//  Copyright © 2016 David Maybach. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class TableViewController: UITableViewController {
    
    var jokes = [JokeModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 160.0
        
        Alamofire.request(.GET, "http://api.icndb.com/jokes/random/10").responseObject { (response: Response<JokesResponseModel, NSError>) -> Void in
            switch response.result
            {
            case .Success(_):
                if (response.result.value?.value != nil)
                {
                    self.jokes = response.result.value!.value!
                    self.tableView.reloadData()
                }
                else
                {
                    print("Error processing for obtained data")
                }
            case .Failure(let error):
                print("Error processing goes here \(error.localizedDescription)")
            }
        }
    }
}

// MARK: - Table view data source
extension TableViewController
{
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("JokeTableViewCell", forIndexPath: indexPath) as! JokeTableViewCell
        cell.jokeLbl.text = jokes[indexPath.row].joke
        return cell
    }
}