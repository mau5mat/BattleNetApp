//
//  FriendViewController.swift
//  BattleNetApp
//
//  Created by Matt Roberts on 30/10/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//

import UIKit
import Foundation

class FriendViewController: UIViewController {
  
  // MARK: - Colors
  let blizzardLightBlue = UIColor(red: 0 / 255, green: 152 / 255, blue: 217 / 255, alpha: 1.0)
  let blizzardLightNavy = UIColor(red: 42 / 255, green: 52 / 255, blue: 80 / 255, alpha: 0.9)
  let blizzardDarkNavy = UIColor(red: 32 / 255, green: 38 / 255, blue: 60 / 255, alpha: 1.0)
  let blizzardLighterNavy = UIColor(red: 55 / 255, green: 63 / 255, blue: 86 / 255, alpha: 1.0)
  
  let nib = UINib(nibName: "FriendCollectionViewCell", bundle: nil)
  
  // MARK: - IBOutlets
  @IBOutlet weak var tabBarSelectorView: UIView!
  @IBOutlet weak var tabBarFriendIcon: UIImageView!
  @IBOutlet weak var tabBarChatIcon: UIImageView!
  @IBOutlet weak var tabBarProfileIcon: UIImageView!
  @IBOutlet weak var tabBarBackgroundView: UIView!
  @IBOutlet weak var tabBarContainerView: UIView!
  @IBOutlet weak var collectionView: UICollectionView!
  
  // MARK: - Dummy Data
  var friends = [
    Friend(userProfilePicture: UIImage(imageLiteralResourceName: "bolvar"), statusIndicatorView: .online, name: "Chackle", game: "World of Warcraft", currentGameInfo: "Dalaran", settingsIcon: UIImage(imageLiteralResourceName: "settings"), noteIcon: UIImage(imageLiteralResourceName: "note"), favoriteIcon: UIImage(imageLiteralResourceName: "star")),
    
    Friend(userProfilePicture: UIImage(imageLiteralResourceName: "illidan"), statusIndicatorView: .busy, name: "Rego", game: "Diablo 3", currentGameInfo: "Act VIII", settingsIcon: UIImage(imageLiteralResourceName: "settings"), noteIcon: UIImage(imageLiteralResourceName: "note"), favoriteIcon: UIImage(imageLiteralResourceName: "star")),
    
    Friend(userProfilePicture: UIImage(imageLiteralResourceName: "chen"), statusIndicatorView: .online, name: "Chiino", game: "Heroes of the Storm", currentGameInfo: "Ranked", settingsIcon: UIImage(imageLiteralResourceName: "settings"), noteIcon: UIImage(imageLiteralResourceName: "note"), favoriteIcon: UIImage(imageLiteralResourceName: "star")),
    
    Friend(userProfilePicture: UIImage(imageLiteralResourceName: "gazlowe"), statusIndicatorView: .online, name: "Hellfire", game: "World of Warcraft", currentGameInfo: "Uldir", settingsIcon: UIImage(imageLiteralResourceName: "settings"), noteIcon: UIImage(imageLiteralResourceName: "note"), favoriteIcon: UIImage(imageLiteralResourceName: "star")),
    
    Friend(userProfilePicture: UIImage(imageLiteralResourceName: "lichking"), statusIndicatorView: .offline, name: "Yum", game: "Black Ops III", currentGameInfo: "Unranked CTF", settingsIcon: UIImage(imageLiteralResourceName: "settings"), noteIcon: UIImage(imageLiteralResourceName: "note"), favoriteIcon: UIImage(imageLiteralResourceName: "star")),
    
    Friend(userProfilePicture: UIImage(imageLiteralResourceName: "jaina"), statusIndicatorView: .busy, name: "Spook", game: "Starcraft", currentGameInfo: "Ranked", settingsIcon: UIImage(imageLiteralResourceName: "settings"), noteIcon: UIImage(imageLiteralResourceName: "note"), favoriteIcon: UIImage(imageLiteralResourceName: "star")),
    
    Friend(userProfilePicture: UIImage(imageLiteralResourceName: "ragnaros"), statusIndicatorView: .online, name: "Dibble", game: "Overwatch", currentGameInfo: "Lobby", settingsIcon: UIImage(imageLiteralResourceName: "settings"), noteIcon: UIImage(imageLiteralResourceName: "note"), favoriteIcon: UIImage(imageLiteralResourceName: "star")),
    
    Friend(userProfilePicture: UIImage(imageLiteralResourceName: "magni"), statusIndicatorView: .busy, name: "Xniqhtkilla", game: "World of Warcraft", currentGameInfo: "Stormsong Valley", settingsIcon: UIImage(imageLiteralResourceName: "settings"), noteIcon: UIImage(imageLiteralResourceName: "note"), favoriteIcon: UIImage(imageLiteralResourceName: "star")),
    
    Friend(userProfilePicture: UIImage(imageLiteralResourceName: "theron"), statusIndicatorView: .offline, name: "Vilinki", game: "Heroes of the Storm", currentGameInfo: "Ranked", settingsIcon: UIImage(imageLiteralResourceName: "settings"), noteIcon: UIImage(imageLiteralResourceName: "note"), favoriteIcon: UIImage(imageLiteralResourceName: "star")),
    
    Friend(userProfilePicture: UIImage(imageLiteralResourceName: "illidan2"), statusIndicatorView: .online, name: "Saeva", game: "Hearthstone", currentGameInfo: "Opening Card Packs", settingsIcon: UIImage(imageLiteralResourceName: "settings"), noteIcon: UIImage(imageLiteralResourceName: "note"), favoriteIcon: UIImage(imageLiteralResourceName: "star")),
    
    Friend(userProfilePicture: UIImage(imageLiteralResourceName: "hellscream"), statusIndicatorView: .offline, name: "Aspo", game: "Diablo IV", currentGameInfo: "Tristram", settingsIcon: UIImage(imageLiteralResourceName: "settings"), noteIcon: UIImage(imageLiteralResourceName: "note"), favoriteIcon: UIImage(imageLiteralResourceName: "star")),
    
    Friend(userProfilePicture: UIImage(imageLiteralResourceName: "gelbin"), statusIndicatorView: .online, name: "Cafefish", game: "Warcraft III: Reforged", currentGameInfo: "Custom Game", settingsIcon: UIImage(imageLiteralResourceName: "settings"), noteIcon: UIImage(imageLiteralResourceName: "note"), favoriteIcon: UIImage(imageLiteralResourceName: "star")),
    
    Friend(userProfilePicture: UIImage(imageLiteralResourceName: "deathwing"), statusIndicatorView: .busy, name: "Deadlycure", game: "Diablo III", currentGameInfo: "Greater Rift", settingsIcon: UIImage(imageLiteralResourceName: "settings"), noteIcon: UIImage(imageLiteralResourceName: "note"), favoriteIcon: UIImage(imageLiteralResourceName: "star"))
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTabBar()
    self.collectionView.delegate = self
    self.collectionView.dataSource = self
    self.collectionView.register(nib, forCellWithReuseIdentifier: "FriendCollectionViewCell")
  }
  
  private func setupTabBar() {
    tabBarSelectorView.backgroundColor = blizzardLightBlue
    tabBarBackgroundView.backgroundColor = blizzardLighterNavy
    tabBarContainerView.backgroundColor = blizzardLighterNavy
    
    tabBarFriendIcon.image = UIImage(named: "friends")
    tabBarChatIcon.image = UIImage(named: "message")
    tabBarProfileIcon.image = UIImage(named: "profile")
  
  }
}



extension FriendViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendCollectionViewCell", for: indexPath) as! FriendCollectionViewCell
    cell.friends = friends
    return cell
  }
}
