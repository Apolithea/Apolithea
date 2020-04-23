//
//  AppDelegate.swift
//  NewAPolithea
//
//  Created by Fabian Cooper on 4/14/20.
//  Copyright © 2020 Fabian Cooper. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //if user has not logged in yet, go to login screen
        if !LoginManager.shared.isLogged {
            self.window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
            self.window?.makeKeyAndVisible()
            print("You're not logged in yet.")
        } else {
            //else go to the navigation controller
            self.window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TableViewNC")
            print("You're logged in!")
        }
        
        return true
    }
    
    internal func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return LoginManager.shared.handled(url: url)
    }
    
}

