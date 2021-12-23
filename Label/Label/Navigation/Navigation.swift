//
//  Navigation.swift
//  Label
//
//  Created by HRD on 6.12.2021.
//  Copyright © 2021 @ HR Dijital. All rights reserved.
//

import Foundation
import UIKit
public class Navigation: UINavigationController {
    var isDarkStatusBar = false {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
            UIApplication.shared.statusBarStyle = .lightContent
        }
    }
    var isHideNavigationBar = true {
        didSet {
            self.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationBar.backgroundColor  = UIColor.clear
            self.navigationBar.shadowImage = UIImage()
        }
    }
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return isDarkStatusBar ? .lightContent : .default
    }
}

class AppRooter {
    private let window : UIWindow?
    init(window: UIWindow ) {
        self.window = window
    }
    func startApp() {
        let root = Navigation(rootViewController: Launch())
        root.isDarkStatusBar = false
        root.isHideNavigationBar = true
        window!.rootViewController = root
        window!.makeKeyAndVisible()
    }
    
}
