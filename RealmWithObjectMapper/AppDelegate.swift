//
//  AppDelegate.swift
//  RealmWithObjectMapper
//
//  Created by Takatomo Okitsu on 2015/04/14.
//  Copyright (c) 2015年 Takatomo Okitsu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // このように呼びだしたいが、'Cannot invoke initializer for type 'User' with an argument list of type '(forPrimaryKey: String)'と怒られる。
        // let hoge = User.objectForID("10")
       
        // 以下確認用のサンプルコード
        let json = "{\"id\": \"1\", \"name\": \"katsumi\"}"
        let user = Mapper<User>().map(json)
        
        println("user: \(user?.id, user?.name)")
        
        let realm = RLMRealm.defaultRealm()
        
        realm.transactionWithBlock { () -> Void in
            realm.addOrUpdateObject(user)
        }
        
        let results = User.objectsInRealm(realm, "id = %@", "1")
        println("results: \(results)")
        
        
        if let u = User.objectForID("1") as? User {
            println("user: \(u)")
            
            let string = Mapper<User>().toJSON(u)
            println("user: \(string)")

        } else {
            println("user: null")
        }
                
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

