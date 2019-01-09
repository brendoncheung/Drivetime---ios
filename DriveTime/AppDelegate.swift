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
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        loggingWithSwitftyBeaverConfiguration()
        
        UNUserNotificationCenter.current().delegate = self
        
        // requesting user's permission to accpet push notification
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            
            if granted == true {
                log.debug("User granted push notification")
                DispatchQueue.main.async {
                    UNUserNotificationCenter.current().delegate = self
                    Messaging.messaging().delegate = self
                    UIApplication.shared.registerForRemoteNotifications()
                }
            } else {
                log.debug("User did not grate pn")
            }
        }
        
        Messaging.messaging().delegate = self
        FirebaseApp.configure()
        
        return true
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        log.debug("Device token receiving failed because: \(error.localizedDescription)")
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        let token = deviceToken.map {String(format: "%02.2hhx", $0)}.joined()
        log.debug("Token: \(token)")
    }
    
    
    func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
        log.debug("\(remoteMessage.description)")
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        log.debug("Firebase cloud messaging token: \(fcmToken)")
    }
    
    // This is the init for swiftyBeaver (logging)
    
    func loggingWithSwitftyBeaverConfiguration() {
        let console = ConsoleDestination()
        log.addDestination(console)
    }
}

