//
//  SequentialFlowDomain.swift
//  Example
//
//  Created by Tom Lokhorst on 2016-01-27.
//  Copyright © 2016 Q42. All rights reserved.
//

import Foundation

enum Organization {
  case Apple
  case Q42
}

struct Repository {
  let name: String
}

struct Issue {
  let id: Int
  let name: String
}

// TODO: make asynchroneous, to simulate network calls
struct DummyDatabase {
  func repositoriesForOrganization(organization: Organization) -> [Repository] {
    switch organization {
    case .Apple:
      return [Repository(name: "Swift")]
    case .Q42:
      return [Repository(name: "Flow"), Repository(name: "StyledString")]
    }
  }

  func issuesForRepository(repository: Repository) -> [Issue] {
    switch repository.name {
    case "Swift":
      return [Issue(id: 0, name: "Rewrite swiftc to Swift!")]
    case "Flow":
      return [Issue(id: 0, name: "Finish it!")]
    case "StyledString":
      return [Issue(id: 0, name: "More unit tests"), Issue(id: 1, name: "I like this")]
    default:
      return []
    }
  }
}
