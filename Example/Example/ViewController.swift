//
//  ViewController.swift
//  Example
//
//  Created by Tom Lokhorst on 2016-01-27.
//  Copyright © 2016 Q42. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBAction func startSequentialFlow(sender: UIButton) {
    let sequential = sequentialFlow() { issue in
      let alert = UIAlertController(title: "You choose issue #\(issue.id)", message: issue.name, preferredStyle: .Alert)
      alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
      self.presentViewController(alert, animated: true, completion: nil)
    }

    presentViewController(sequential, animated: true, completion: nil)
  }
}
