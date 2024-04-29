//
//  AppDelegate.swift
//  MainApp
//
//  Created by Viraj Joshi on 10/04/24.
//

import UIKit
import SideMenu

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setUpLeftMenu()
        setUpInitialVC()
        return true
    }
    
    func setUpInitialVC(){
        
        let storyboardID: String
        if let email = UserDefaults.standard.string(forKey: "email"){
            storyboardID = "Dashboard"
        }else{
            storyboardID = "Main"
        }
        
        
        
        
        let storyboard = UIStoryboard(name: storyboardID, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: storyboardID)
        let navigationController = UINavigationController(rootViewController: vc)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    func setUpLeftMenu(){
        let storyboard = UIStoryboard(name:"SideMenu", bundle: nil)
        let sidemenuVC = storyboard.instantiateViewController(withIdentifier: "SideMenu")as! SideMenuVC
        
        let sideMenuViewController = SideMenuNavigationController(rootViewController: sidemenuVC)
        sideMenuViewController.leftSide = true
        sideMenuViewController.isNavigationBarHidden = true
        SideMenuManager.default.leftMenuNavigationController = sideMenuViewController
        SideMenuManager.default.rightMenuNavigationController = sideMenuViewController
        sideMenuViewController.pushStyle = .default
        sideMenuViewController.presentationStyle = .menuSlideIn
        sideMenuViewController.presentationStyle.backgroundColor = .black
        sideMenuViewController.settings.statusBarEndAlpha = 0
        sideMenuViewController.presentationStyle.presentingEndAlpha = 0.6
        let  SCREEN_WIDTH = UIScreen.main.bounds.size.width
        sideMenuViewController.menuWidth = SCREEN_WIDTH * 0.8
    }


}

