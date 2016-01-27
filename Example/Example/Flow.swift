//
//  Flow.swift
//  Example
//
//  Created by Tom Lokhorst on 2016-01-27.
//  Copyright © 2016 Q42. All rights reserved.
//

import Foundation

protocol Step {
  typealias ResultType

  var resultHandler: ResultType -> Void { get set }
}
