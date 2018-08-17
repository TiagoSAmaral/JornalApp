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
	func setNavigationTitleView(with text: String)
}

class NewsView: UIViewController, NewsViewInterface {

	var presenter: NewsInterface!
	@IBOutlet var listNews: NewsTableView!
	@IBOutlet var banner: Banner!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		self.listNews.presenter = self.presenter
		self.setBackButtonTitle(with: "")
    }

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

		self.presenter.viewDidAppear()
	}

	func reloadList() {
		self.listNews.reloadData()
	}

	func setNavigationTitleView(with text: String) {

		self.navigationItem.title = text
	}

	func setBanner(with notice: Novelty) {
		self.banner.setBanner(with: notice)
	}
}
