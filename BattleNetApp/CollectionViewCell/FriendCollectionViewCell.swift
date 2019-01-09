//
//  FriendCollectionViewCell.swift
//  BattleNetApp
//
//  Created by Matt Roberts on 02/11/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//
import Foundation
import UIKit

class FriendCollectionViewCell: UICollectionViewCell {
  
  // MARK: - Variables
  var friends = [Friend]()
  
  // MARK: - Colors
  let blizzardDarkNavy = UIColor(red: 20 / 255, green: 23 / 255, blue: 33 / 255, alpha: 1.0)
  let blizzardLighterNavy = UIColor(red: 55 / 255, green: 63 / 255, blue: 86 / 255, alpha: 0.8)
  
  private var nib = UINib(nibName: "FriendTableViewCell", bundle: nil)

  // MARK: - IBOutlets
  @IBOutlet weak var tableView: UITableView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.tableView.delegate = self    
    self.tableView.dataSource = self
    self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    self.tableView.register(nib, forCellReuseIdentifier: "FriendTableViewCell")
    self.tableView.backgroundColor = blizzardDarkNavy
    self.tableView.rowHeight = 65
  }
}

extension FriendCollectionViewCell: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return friends.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "FriendTableViewCell", for: indexPath) as! FriendTableViewCell
    cell.setup(withFriend: friends[indexPath.row])
    cell.setupNameLabel()
    cell.setupCurrentGameInfoLabel(withGame: friends[indexPath.row].game, andCurrentGameStatus: friends[indexPath.row].currentGameInfo)
    cell.setupStatusIndicatorView()
    cell.setupGameIconBackgroundView()
    cell.setupSettingsDots()
    cell.setupCustomSeparatorLine()
    cell.backgroundColor = blizzardDarkNavy
    return cell
  }
}

