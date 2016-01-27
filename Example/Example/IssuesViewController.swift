//
//  IssuesViewController.swift
//  Example
//
//  Created by Tom Lokhorst on 2016-01-27.
//  Copyright © 2016 Q42. All rights reserved.
//

import UIKit

class IssuesTableViewController: UITableViewController, Step {
  typealias ResultType = Issue

  var resultHandler: Issue -> Void = { _ in }

  var issues: [Issue] = []

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return issues.count
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

    cell.textLabel?.text = issues[indexPath.row].name

    return cell
  }

  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    resultHandler(issues[indexPath.row])
  }
}
