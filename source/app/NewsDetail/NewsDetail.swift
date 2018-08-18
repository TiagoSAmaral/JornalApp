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
	func sharedNovely(sourceView: UIBarButtonItem) -> UIActivityViewController
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

		self.view!.setNavigationTitleView(with: self.novelty.section!.name!)
		tableScheme = self.buildSchemsTableView(notice: self.novelty)
		self.cells = self.buildCells(with: tableScheme, tableView: self.view.tableView)
		self.sizeList = tableScheme.count
	}

	func setCell(at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell {

		return self.cells[indexPath.row]
	}

	func buildSchemsTableView(notice: Novelty) -> [MapNovelyBody]{

		var cells: [MapNovelyBody] = [MapNovelyBody]()

		if self.novelty.title != nil {
			cells.append(.title)
		}

		if self.novelty.subtitle != nil {
			cells.append(.subtitle)
		}

		if let authors = self.novelty.authors {
			if self.novelty.updatedAt != nil && !authors.isEmpty {
				cells.append(.info)
			}
		}

		if let images = self.novelty.imagens {
			if !images.isEmpty {
				cells.append(.image)
			}
		}

		if self.novelty.text != nil {
			cells.append(.text)
		}

		self.sizeList = cells.count
		return cells
	}

	func buildCells(with schemes: [MapNovelyBody], tableView: UITableView) -> [UITableViewCell] {

		var cellTemp: [UITableViewCell] = [UITableViewCell] ()

		for scheme in schemes {

			let cell: NewsCellProtocol!

			switch scheme {

			case .title:
				cell = tableView.dequeueReusableCell(withIdentifier: NewsTitleCell.identifier) as! NewsTitleCell
			case .subtitle:
				cell = tableView.dequeueReusableCell(withIdentifier: NewsSubTitleCell.identifier) as! NewsSubTitleCell
			case .info:
				cell = tableView.dequeueReusableCell(withIdentifier: NewsInfoCell.identifier) as! NewsInfoCell
			case .image:
				cell = tableView.dequeueReusableCell(withIdentifier: NewsImageCell.identifier) as! NewsImageCell
			case .text:
				cell = tableView.dequeueReusableCell(withIdentifier: NewsTextCell.identifier) as! NewsTextCell
			}

			cell.setCell(info: self.novelty)
			cellTemp.append(cell as! UITableViewCell)
		}

		return cellTemp
	}

	func sharedNovely(sourceView: UIBarButtonItem) -> UIActivityViewController {

		let firstItem = (self.cells[0] as! NewsTitleCell).titleLabel.text
		let secondAItem: URL = self.novelty.mobileUrl!

		let activityViewController: UIActivityViewController = UIActivityViewController(
			activityItems: [firstItem ?? "", secondAItem], applicationActivities: nil)

		activityViewController.popoverPresentationController?.barButtonItem = sourceView
		activityViewController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.any
		activityViewController.popoverPresentationController?.sourceRect = CGRect(x: 150, y: 150, width: 0, height: 0)

		return activityViewController
	}
}
