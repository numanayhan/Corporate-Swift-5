//
//  AppDelegate.swift
//  TextView
//
//  Created by Numan Ayhan on 28.12.2021.
//

import UIKit
var app:AppNavigation?
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setNavigation()
        
        return true
    }
    func setNavigation(){
        //Window UI
        //Rooter App Navigation
        //Window UI
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        app = AppNavigation(window: window!)
        app?.startApp()
    }
 

}

