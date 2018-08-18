//
//  NewsTableView.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 15/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

class NewsTableView: UITableView {

	var presenter: NewsInterface!

	override func draw(_ rect: CGRect) {
		// Drawing code

		self.dataSource = self
		self.delegate = self
		self.estimatedRowHeight = 60.0

		self.registerCell()
	}

	func registerCell(){
		self.register(UINib(nibName: NoveltyCell.identifier, bundle: nil), forCellReuseIdentifier: NoveltyCell.identifier)
	}
}

extension NewsTableView: UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.presenter.sizeList
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return self.presenter.buildCell(at: indexPath, inTo: tableView)
	}
}

extension NewsTableView: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		self.presenter!.selectCell(at: indexPath.row)
	}

	func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {

		(cell as! NoveltyCell).willRemoveCell()
	}
}
