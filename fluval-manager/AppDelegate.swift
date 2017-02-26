//
//  AppDelegate.swift
//  fluval-manager
//
//  Created by Nicolas on 19/02/2017.
//  Copyright © 2017 Nicolas Bigot. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        if let navigationController = window?.rootViewController as? UINavigationController,
            let viewController = navigationController.topViewController as? DashboardViewController {
            // build library
            let settingsManager = SettingsManager()
            
            // lights
            let lightsEndpoint = LightsEndpoint(settingsManager: settingsManager)
            let lightsModuleViewController = viewController.storyboard?.instantiateViewController(withIdentifier: "LightsModuleViewController") as! LightsModuleViewController
            lightsModuleViewController.lightsEndpoint = lightsEndpoint
            
            // filter
            let filterEndpoint = FilterEndpoint(settingsManager: settingsManager)
            let filterModuleViewController = viewController.storyboard?.instantiateViewController(withIdentifier: "FilterModuleViewController") as! FilterModuleViewController
            filterModuleViewController.filterEndpoint = filterEndpoint
            
            // heater
            let heaterEndpoint = HeaterEndpoint(settingsManager: settingsManager)
            let heaterModuleViewController = viewController.storyboard?.instantiateViewController(withIdentifier: "HeaterModuleViewController") as! HeaterModuleViewController
            heaterModuleViewController.heaterEndpoint = heaterEndpoint
            
            // temperature
            let temperatureEndpoint = TemperatureEndpoint(settingsManager: settingsManager)
            let temperatureModuleViewController = viewController.storyboard?.instantiateViewController(withIdentifier: "TemperatureModuleViewController") as! TemperatureModuleViewController
            temperatureModuleViewController.temperatureEndpoint = temperatureEndpoint
            
            // build dashboard
            viewController.settingsManager = SettingsManager()
            viewController.modulesViewControllers = [lightsModuleViewController, filterModuleViewController, temperatureModuleViewController, heaterModuleViewController]
        }
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

