//
//  AppDelegate.swift
//  StylingTest
//
//  Created by Bob De Kort on 2/7/19.
//  Copyright © 2019 Bob De Kort. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Testing validation extension
        
        let validEmail = "dekortbob@hotmail.com"
        let validEmail2 = "bogo@nodes.dk"
        let invalidEmail = "a"
        let invalidEmail2 = "a@b"
        let invalidEmail3 = "a.b"
        let invalidEmail4 = "dekortbob@hotmailcom"
        
        print("----------------------")
        print("Validating emails")
        print(validEmail.validate(with: .email))
        print(validEmail2.validate(with: .email))
        print(invalidEmail.validate(with: .email))
        print(invalidEmail2.validate(with: .email))
        print(invalidEmail3.validate(with: .email))
        print(invalidEmail4.validate(with: .email))
        print("----------------------")
        
        // Testing userdefaults base
        let user = User(name: "Bob",
                        email: "dekortbob@hotmail.com",
                        birthday: Date(),
                        isPremium: true,
                        numberOfFriends: 10)

        print("----------------------")
        print("Setting values to UserDefaultsUserCache")
        let userCache = UserCache()
        userCache.user = user
        userCache.accessToken = "This is an access token"
        userCache.refreshToken = "This is a refresh token"

        print("----------------------")
        print("Retrieving values form UserDefaultsUserCache")
        print("User: \(userCache.user?.name)")
        print("User: \(userCache.user?.birthday)")
        print("Access token: \(userCache.accessToken)")
        print("Refresh token: \(userCache.refreshToken)")
        print("----------------------")
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

