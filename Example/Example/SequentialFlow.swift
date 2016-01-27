//
//  SequentialFlow.swift
//  Example
//
//  Created by Tom Lokhorst on 2016-01-27.
//  Copyright © 2016 Q42. All rights reserved.
//

import UIKit

func sequentialFlow(resultHandler: Issue -> Void) -> UINavigationController {

  let storyboard = UIStoryboard(name: "SequentialFlow", bundle: nil)
  let organizationsVC = instantiateOrganizationsViewController(storyboard)

  let navigation = UINavigationController(rootViewController: organizationsVC)

  organizationsVC.resultHandler = { organization in

    let repositoriesVC = instantiateRepositoriesTableViewController(storyboard)
    repositoriesVC.repos = DummyDatabase().repositoriesForOrganization(organization)
    repositoriesVC.resultHandler = { repository in

      let issuesVC = instantiateIssuesTableViewController(storyboard)
      issuesVC.issues = DummyDatabase().issuesForRepository(repository)
      issuesVC.resultHandler = { issue in
        navigation.dismissViewControllerAnimated(true) {
          resultHandler(issue)
        }
      }

      navigation.pushViewController(issuesVC, animated: true)
    }

    navigation.pushViewController(repositoriesVC, animated: true)
  }

  return navigation
}

func instantiateOrganizationsViewController(storyboard: UIStoryboard) -> OrganizationsViewController {
  return storyboard.instantiateViewControllerWithIdentifier("OrganizationsViewController") as! OrganizationsViewController
}

func instantiateRepositoriesTableViewController(storyboard: UIStoryboard) -> RepositoriesTableViewController {
  return storyboard.instantiateViewControllerWithIdentifier("RepositoriesTableViewController") as! RepositoriesTableViewController
}

func instantiateIssuesTableViewController(storyboard: UIStoryboard) -> IssuesTableViewController {
  return storyboard.instantiateViewControllerWithIdentifier("IssuesTableViewController") as! IssuesTableViewController
}
