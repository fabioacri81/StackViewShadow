//
//  AppDelegate.swift
//  StackViewShadow
//
//  Created by Fabio Acri on 20/03/2018.
//  Copyright © 2018 Fabio Acri. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navVC = UINavigationController(rootViewController: TestVC())
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
        window?.isHidden = false
        
        return true
    }
}

