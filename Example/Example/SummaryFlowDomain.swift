//
//  SummaryFlowDomain.swift
//  Example
//
//  Created by Tom Lokhorst on 2016-01-28.
//  Copyright © 2016 Q42. All rights reserved.
//

import Foundation

enum Gender {
  case Male
  case Female
}

struct Person {
  let name: String
  let gender: Gender?
  let birthdate: NSDate
}
