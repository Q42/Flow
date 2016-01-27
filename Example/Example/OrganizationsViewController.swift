//
//  OrganizationsViewController.swift
//  Example
//
//  Created by Tom Lokhorst on 2016-01-27.
//  Copyright © 2016 Q42. All rights reserved.
//

import UIKit

class OrganizationsViewController: UIViewController, Step {
  typealias ResultType = Organization

  var resultHandler: Organization -> Void = { _ in }

  @IBAction func appleTap(sender: UIButton) {
    resultHandler(.Apple)
  }

  @IBAction func q42Tap(sender: UIButton) {
    resultHandler(.Q42)
  }
}