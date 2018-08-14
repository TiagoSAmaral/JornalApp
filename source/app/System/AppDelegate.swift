//
//  AppDelegate.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 11/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.

		let viewController = UIStoryboard(name: "ViewController", bundle: nil).instantiateViewController(withIdentifier: "ViewController")
		self.window = UIWindow(frame: UIScreen.main.bounds)
		self.window?.rootViewController = viewController
		self.window?.makeKeyAndVisible()

		return true
	}
}
