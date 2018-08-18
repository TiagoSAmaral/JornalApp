//
//  News.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 15/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

protocol NewsInterface {
	var sizeList: Int { get }
	func viewDidAppear()
	func buildCell(at indexPath: IndexPath, inTo collection: UITableView) -> UITableViewCell
	func selectCell(at index: Int)
}

class News: NewsInterface {

	weak var view: NewsViewInterface!
	let network: NewsNetworkInterface = NewsNetwork()
	var novelties: [Novelty] = [Novelty]()
	var router: RouterInterface!
	var sizeList: Int = 0

	init(view: NewsViewInterface, router: RouterInterface) {
		self.view = view
		self.router = router
		self.view!.setNavigationTitleView(with: "O GLOBO")
	}

	func viewDidAppear() {

		self.requestNoveltyList()
	}

	func showDetailOf(selectedIndex: Int) {

		self.router.goTo(destiny: .noticedetail, pushfoward: self.novelties[selectedIndex])
	}

	func requestNoveltyList() {

		self.network.requestNews { (noveltyList, error) in

			if error != nil {

				self.view.showAlert(with: "", and: "Lamentamos por isso, mas ocorreu um erro, verifique sua internet e tente novamente.", completion: nil)

			} else if noveltyList == nil || (noveltyList?.isEmpty)! {

				self.view.showAlert(with: "Nenhuma novidade", and: "Parece que você já viu tudo por enquanto, venha mais tarde para encontrar mais novidades.", completion: nil)

			} else {

				self.updateView(noveltys: noveltyList!)
			}
		}
	}

	func updateView(noveltys: [Novelty]) {

		self.novelties = noveltys
		self.sizeList = self.novelties.count
		self.view.setBanner(with: self.novelties.first!, index: self.novelties.startIndex)
		self.view.reloadList()
	}

	func buildCell(at indexPath: IndexPath, inTo tableView: UITableView) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: NoveltyCell.identifier, for: indexPath) as! NoveltyCell
		cell.setupCell(with: self.novelties[indexPath.row])
		return cell
	}

	func selectCell(at index: Int) {

		let destiny = self.novelties[index].tipo == "materia" ? Routes.noticedetail: Routes.externallink
		self.router.goTo(destiny: destiny, pushfoward: self.novelties[index])
	}
}
