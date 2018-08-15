//
//  News.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 15/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Foundation

protocol NewsInterface {
	var sizeList: Int { get }
	func viewDidAppear()
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
		self.view.reloadList()
	}
}
