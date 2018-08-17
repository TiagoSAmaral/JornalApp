//
//  NewsDetail.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 16/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

protocol NewsDetailInterface {

	var sizeList: Int { get }
	func setCell(at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell
}

class NewsDetail: NewsDetailInterface{

	weak var view: NewsDetailViewInterface!
	var router: RouterInterface
	var sizeList: Int = 0
	var novelty: Novelty!
	var tableScheme: [MapNovelyBody]!
	var cells: [UITableViewCell]!

	init(view: NewsDetailViewInterface, router: RouterInterface, data: Novelty) {

		self.view = view
		self.router = router
		self.novelty = data

		tableScheme = self.buildSchemsTableView(notice: self.novelty)
		self.cells = self.buildCells(with: tableScheme, tableView: self.view.tableView)
		self.sizeList = tableScheme.count
	}

	func setCell(at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell {

		return self.cells[indexPath.row]
	}

	func buildSchemsTableView(notice: Novelty) -> [MapNovelyBody]{

		var cells: [MapNovelyBody] = [MapNovelyBody]()

		if self.novelty.titulo != nil {
			cells.append(.title)
		}

		if self.novelty.subTitulo != nil {
			cells.append(.subtitle)
		}

		if let authors = self.novelty.autores {
			if self.novelty.atualizadoEm != nil && !authors.isEmpty {
				cells.append(.info)
			}
		}

		self.sizeList = cells.count
		return cells
	}

	func buildCells(with schemes: [MapNovelyBody], tableView: UITableView) -> [UITableViewCell] {

		var cellTemp: [UITableViewCell] = [UITableViewCell] ()

		for scheme in schemes {

			switch scheme {

			case .title:
				let cell = tableView.dequeueReusableCell(withIdentifier: NewsTitleCell.identifier) as! NewsTitleCell
				cell.setCell(info: self.novelty)
				cellTemp.append(cell)

			case .subtitle:
				let cell = tableView.dequeueReusableCell(withIdentifier: NewsSubTitleCell.identifier) as! NewsSubTitleCell
				cell.setCell(info: self.novelty)
				cellTemp.append(cell)

			case .info:
				let cell = tableView.dequeueReusableCell(withIdentifier: NewsInfoCell.identifier) as! NewsInfoCell
				cell.setCell(info: self.novelty)
				cellTemp.append(cell)
			}
		}

		return cellTemp
	}

	enum MapNovelyBody: Int {

		case title = 0, subtitle, info
	}
}
