//
//  ChannelVC.swift
//  smack-chat-app
//
//  Created by Lucas Inocencio on 27/07/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var userImageView: CircleImage!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {}
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSideMenu()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }
    
    // MARK: - Methods
    func setupSideMenu() {
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        if AuthService.instance.isLoggedIn {
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            userImageView.image = UIImage(named: UserDataService.instance.avatarName)
            userImageView.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        } else {
            loginBtn.setTitle("Login", for: .normal)
            userImageView.image = UIImage(named: "menuProfileIcon")
            userImageView.backgroundColor = UIColor.clear
        }
    }

    // MARK: - IBAction
    @IBAction func handleBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
}
