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
	var sizeList: Int = 1
	var novelty: Novelty!

	init(view: NewsDetailViewInterface, router: RouterInterface, data: Novelty) {

		self.view = view
		self.router = router
		self.novelty = data
	}

	func setCell(at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell {

		let tmp = tableView.dequeueReusableCell(withIdentifier: NewsTitleCell.identifier, for: indexPath) //as! NewsTitleCell

		switch indexPath.row {
		case MapNovelyBody.title.rawValue:

			let cell = tmp as! NewsTitleCell
			cell.setCell(info: self.novelty)
			return cell

		case MapNovelyBody.subtitle.rawValue:
			return UITableViewCell()
		case MapNovelyBody.info.rawValue:
			return UITableViewCell()
		case MapNovelyBody.image.rawValue:
			return UITableViewCell()
		case MapNovelyBody.text.rawValue:
			return UITableViewCell()

		default:
			return UITableViewCell()
		}
	}

	enum MapNovelyBody: Int {

		case title = 0, subtitle, info, image, text
	}
}
