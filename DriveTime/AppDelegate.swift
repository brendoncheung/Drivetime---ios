//
//  AppDelegate.swift
//  DriveTime
//
//  Created by Wing Sun Cheung on 8/1/18.
//  Copyright © 2018 Wing Sun Cheung. All rights reserved.
//

import UIKit
import SwiftyBeaver
import Firebase
import UserNotifications
import FirebaseMessaging

let log = SwiftyBeaver.self

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {
    
    var window: UIWindow?
    
    func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
        log.debug("\(remoteMessage.description)")
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        let token = deviceToken.map {String(format: "%02.2hhx", $0)}.joined()
        log.debug("Token: \(token)")
    }
    
//    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//        log.debug("tapped on notificaiton")
//        completionHandler()
//    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        log.debug("Firebase cloud messaging token: \(fcmToken)")
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        log.debug("Device token receiving failed because: \(error.localizedDescription)")
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        loggingCOnfiguration()
        pushNotificationConfiguration()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        print("2")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        print("3")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        print("4")
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        print("5")
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        print("6")
    }
    
    func pushNotificationConfiguration() {
        
        UNUserNotificationCenter.current().delegate = self
        
        // requesting user's permission to accpet push notification
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            
            if granted == true {
                log.debug("User granted pn")
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            } else {
                log.debug("User did not grate pn")
            }
        }
        
        Messaging.messaging().delegate = self
        FirebaseApp.configure()
    }
    
    // This is the init for swiftyBeaver (logging)
    
    func loggingCOnfiguration() {
        let console = ConsoleDestination()
        log.addDestination(console)
    }
}

