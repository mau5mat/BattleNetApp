//
//  Friend.swift
//  BattleNetApp
//
//  Created by Matt Roberts on 30/10/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//

import Foundation
import UIKit


enum Status: String {
  case online = "online"
  case offline = "offline"
  case busy = "busy"
}

enum Game: String {
  case Diablo3 = "diablo3"
  case StarCraft = "starcraft"
  case StarCraft2 = "starcraft2"
  case WorldOfWarcraft = "worldofwarcraft"
  case Hearthstone = "hearthstone"
  case HeroesOfTheStorm = "heroesofthestorm"
  case Overwatch = "overwatch"
}

struct Friend {
  let userProfilePicture: UIImage
  let statusIndicatorView: Status
  let name: String
  let game: String
  let currentGameInfo: String
  let settingsIcon: UIImage
  let noteIcon: UIImage?
  let favoriteIcon: UIImage?
  
  init(userProfilePicture: UIImage, statusIndicatorView: Status, name: String, game: String, currentGameInfo: String, settingsIcon: UIImage, noteIcon: UIImage? = nil, favoriteIcon: UIImage? = nil) {
    self.userProfilePicture = userProfilePicture
    self.statusIndicatorView = statusIndicatorView
    self.name = name
    self.game = game
    self.noteIcon = noteIcon
    self.currentGameInfo = currentGameInfo
    self.settingsIcon = settingsIcon
    self.favoriteIcon = favoriteIcon
  }
}
