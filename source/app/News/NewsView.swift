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
	func setBanner(with notice: Novelty)
}

class NewsView: UIViewController, NewsViewInterface {

	var presenter: NewsInterface!
	var listNews: UITableView!
	@IBOutlet var banner: Banner!

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

	func setBanner(with notice: Novelty) {

		self.banner.setBanner(with: notice)
	}
}
