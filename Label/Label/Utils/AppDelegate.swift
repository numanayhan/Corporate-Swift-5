//
//  AppDelegate.swift
//  Label
//
//  Created by HRD on 6.12.2021.
//  Copyright © 2021 HRD. All rights reserved.
//

import UIKit
var appRouter :AppRooter?

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
         
        #if  RELEASE
        setApp()
        #elseif DEBUG
        setDebugApp()
        #endif
        
        return true
    }
    func setApp(){
        
        //Window UI
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        //Root App
        appRouter = AppRooter(window: window!)
        appRouter?.startApp()
    }
    func setDebugApp(){
        
        //Window UI
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        //Root App
        appRouter = AppRooter(window: window!)
        appRouter?.startApp()
    }
}

