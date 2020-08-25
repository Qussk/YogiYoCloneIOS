//
//  AppDelegate.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/17.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        window?.rootViewController = MainTabVC()

        window?.rootViewController = UINavigationController(rootViewController: AccountVC())
//        window?.rootViewController = LogVC()

        window?.makeKeyAndVisible()
        return true
    }


}

