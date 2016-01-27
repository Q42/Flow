//
//  RepositoriesViewController.swift
//  Example
//
//  Created by Tom Lokhorst on 2016-01-27.
//  Copyright © 2016 Q42. All rights reserved.
//

import UIKit

class RepositoriesTableViewController: UITableViewController, Step {
  typealias ResultType = Repository

  var resultHandler: Repository -> Void = { _ in }

  var repos: [Repository] = []

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return repos.count
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

    cell.textLabel?.text = repos[indexPath.row].name

    return cell
  }

  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    resultHandler(repos[indexPath.row])
  }
}
