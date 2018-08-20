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
	func setBanner(with notice: Novelty, index: Int)
	func setNavigationTitleView(with text: String)
}

class NewsView: UIViewController, NewsViewInterface {

	var presenter: NewsInterface!
	@IBOutlet var listNews: NewsTableView!
	@IBOutlet var banner: Banner!

    override func viewDidLoad() {
        super.viewDidLoad()

		self.setBackButtonTitle(with: "")
		self.listNews.isHidden = true
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		self.listNews.presenter = self.presenter
		self.banner.presenter = self.presenter
		self.listNews.isHidden = true
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

		self.presenter.viewDidAppear()
	}

	func reloadList() {

		if listNews != nil {
			self.listNews.reloadData()
			self.listNews.isHidden = false
		}
	}

	func setNavigationTitleView(with text: String) {

		self.navigationItem.title = text
	}

	func setBanner(with notice: Novelty, index: Int) {
		if self.banner != nil {
			self.banner.setBanner(with: notice, index: index)
		}
	}
}
