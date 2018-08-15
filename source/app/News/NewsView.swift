//
//  ViewController.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 14/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

protocol NewsViewInterface: class {

	func reloadList()
	func showAlert(with title: String, and message: String, completion: (() -> Void)?)
}

class NewsView: UIViewController, NewsViewInterface {

	var presenter: NewsInterface!
	var listNews: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

		self.presenter.viewDidAppear()
	}

	func reloadList() {

	}
}
