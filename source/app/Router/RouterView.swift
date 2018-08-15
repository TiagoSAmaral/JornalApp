//
//  RouterView.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 14/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

protocol RouterViewInterface: class {

	func setViewControllers(_: [UIViewController], animated: Bool)
	func pushViewController(_: UIViewController, animated: Bool)
}

class RouterView: UINavigationController, RouterViewInterface {

	var presenter: RouterInterface!

	override func viewDidLoad() {
		super.viewDidLoad()

		self.setupApperance()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		self.presenter.goTo(destiny: .notices, pushfoward: nil)
	}

	func setupApperance() {

		self.navigationBar.isTranslucent = false

	}
}
