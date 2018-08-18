//
//  NewsDetailView.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 16/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

protocol NewsDetailViewInterface: class {

	var tableView: UITableView! { get }
	func setNavigationTitleView(with text: String)
}

class NewsDetailView: UITableViewController, NewsDetailViewInterface {

	var presenter: NewsDetailInterface!

    override func viewDidLoad() {
        super.viewDidLoad()

		self.tableView.allowsSelection = false
		self.tableView.separatorStyle = .none

		self.registerCell()
		self.addShareButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

	func setNavigationTitleView(with text: String) {
		self.navigationItem.title = text
	}

	func addShareButton() {

		self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showShareList))
	}

	@objc func showShareList() {
		self.present(self.presenter.sharedNovely(sourceView: self.navigationItem.rightBarButtonItems![0]), animated: true, completion: nil)
	}

	func registerCell(){

		self.tableView.register(UINib(nibName: NewsTitleCell.identifier, bundle: nil), forCellReuseIdentifier: NewsTitleCell.identifier)
		self.tableView.register(UINib(nibName: NewsSubTitleCell.identifier, bundle: nil), forCellReuseIdentifier: NewsSubTitleCell.identifier)
		self.tableView.register(UINib(nibName: NewsInfoCell.identifier, bundle: nil), forCellReuseIdentifier: NewsInfoCell.identifier)
		self.tableView.register(UINib(nibName: NewsImageCell.identifier, bundle: nil), forCellReuseIdentifier: NewsImageCell.identifier)
		self.tableView.register(UINib(nibName: NewsTextCell.identifier, bundle: nil), forCellReuseIdentifier: NewsTextCell.identifier)
	}

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
		return self.presenter.sizeList
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Configure the cell...
        return self.presenter.setCell(at: indexPath, on: tableView)
    }
}
