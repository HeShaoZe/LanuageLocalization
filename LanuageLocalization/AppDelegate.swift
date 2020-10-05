//
//  AppDelegate.swift
//  LanuageLocalization
//
//  Created by Ze Shao on 2020/9/29.
//  Copyright © 2020 Ze Shao. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    /// 主窗口
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow.init(frame: UIScreen.main.bounds)//UIScreen.main.bounds
        let rootVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let rootNav = UINavigationController.init(rootViewController: rootVC)
        self.window?.rootViewController = rootNav
        self.window?.makeKeyAndVisible()
        return true
    }
}

