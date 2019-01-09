//
//  UITableViewController+Utilities.swift
//  BattleNetApp
//
//  Created by Matt Roberts on 07/11/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//

import Foundation
import UIKit


extension UITableViewController {
  func registerCellIdentifiers(_ identifiers: [String]) {
    for identifier in identifiers {
      let nib = UINib(nibName: identifier, bundle: nil)
      self.tableView.register(nib, forCellReuseIdentifier: identifier)
    }
  }
}

extension UICollectionView {
    func registerCellIdentifiers(_ identifiers: [String]) {
      for identifier in identifiers {
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: identifier)
    }
  }
}

