//
//  FriendTableViewCell.swift
//  BattleNetApp
//
//  Created by Matt Roberts on 30/10/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//

import UIKit
import Foundation

class FriendTableViewCell: UITableViewCell {
  
  // MARK: - Colors
  let blizzardBlue = UIColor(red: 67 / 255, green: 90 / 255, blue: 93 / 255, alpha: 1.0)
  let blizzardLightBlue = UIColor(red: 0 / 255, green: 152 / 255, blue: 217 / 255, alpha: 1.0)
  let blizzardLightNavy = UIColor(red: 32 / 255, green: 38 / 255, blue: 60 / 255, alpha: 1.0)
  let blizzardLighterNavy = UIColor(red: 55 / 255, green: 63 / 255, blue: 86 / 255, alpha: 1.0)
  
  // MARK: - IBOutlets
  @IBOutlet weak var userProfilePicture: UIImageView!
  @IBOutlet weak var gameIconBackgroundView: UIView!
  @IBOutlet weak var statusIndicatorView: UIView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var currentGameInfo: UILabel!
  @IBOutlet weak var noteIcon: UIImageView!
  @IBOutlet weak var favoriteIcon: UIImageView!
  @IBOutlet weak var customSeparatorLine: UIView!
  
  // MARK: - IBOutlets for Settings dots
  @IBOutlet weak var topSettingsDotView: UIView!
  @IBOutlet weak var middleSettingsDotView: UIView!
  @IBOutlet weak var bottomSettingsDotView: UIView!

  
  // MARK: - Setup functions
  func setup(withFriend friend: Friend) {
    self.userProfilePicture.image = friend.userProfilePicture
    self.nameLabel.text = friend.name
    self.currentGameInfo.text = friend.currentGameInfo
    self.noteIcon.image = friend.noteIcon
    self.favoriteIcon.image = friend.favoriteIcon
    
    // Not sure how to properly implement the statusIndicatorView the way I want yet..
    switch friend.statusIndicatorView {
    case .online:
      statusIndicatorView.backgroundColor = UIColor.green
    case .busy:
      statusIndicatorView.backgroundColor = UIColor.orange
    case .offline:
      statusIndicatorView.backgroundColor = UIColor.lightGray
    }
  }
  
  func setupNameLabel() {
    self.nameLabel.baselineAdjustment = .none
    self.nameLabel.numberOfLines = 1
    self.nameLabel.lineBreakMode = .byCharWrapping
    self.nameLabel.font.withSize(16)
    self.nameLabel.textColor = blizzardLightBlue
    
  }
  
  func setupCurrentGameInfoLabel(withGame game: String, andCurrentGameStatus gameStatus: String) {
    self.currentGameInfo.baselineAdjustment = .none
    self.currentGameInfo.lineBreakMode = .byCharWrapping
    self.currentGameInfo.numberOfLines = 1
    self.currentGameInfo.font.withSize(16)
    self.currentGameInfo.textColor = UIColor.white
    self.currentGameInfo.text = "Playing \(game) - \(gameStatus)"
  }
  
  func setupStatusIndicatorView() {
    // Round the edges to be circular
    self.statusIndicatorView.layer.cornerRadius = statusIndicatorView.bounds.size.width / 2
    self.statusIndicatorView.layer.masksToBounds = true
  }
  
  func setupGameIconBackgroundView() {
    self.gameIconBackgroundView.backgroundColor = blizzardLightNavy
    
    // Round the edges to be circular
    self.gameIconBackgroundView.layer.cornerRadius = gameIconBackgroundView.bounds.size.width / 2
    self.gameIconBackgroundView.layer.masksToBounds = true
  }
  
  func setupSettingsDots() {
    self.topSettingsDotView.backgroundColor = blizzardLighterNavy
    self.middleSettingsDotView.backgroundColor = blizzardLighterNavy
    self.bottomSettingsDotView.backgroundColor = blizzardLighterNavy
    
    self.topSettingsDotView.layer.cornerRadius = topSettingsDotView.bounds.size.width / 2
    self.middleSettingsDotView.layer.cornerRadius = middleSettingsDotView.bounds.size.width / 2
    self.bottomSettingsDotView.layer.cornerRadius = bottomSettingsDotView.bounds.size.width / 2
    
    self.topSettingsDotView.layer.masksToBounds = true
    self.middleSettingsDotView.layer.masksToBounds = true
    self.bottomSettingsDotView.layer.masksToBounds = true
  }
  
  func setupCustomSeparatorLine() {
    self.customSeparatorLine.backgroundColor = blizzardLighterNavy
  }
  
}
