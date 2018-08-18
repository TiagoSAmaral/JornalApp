//
//  NewsDetailViewTests.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 18/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Foundation

import Quick
import Nimble
import SwiftyJSON

@testable import jornalapp

class NewsDetailViewTests: QuickSpec {

	override func spec() {

		describe("NewsDetailView Tests") {

			context("", closure: {

				var newsDetail: NewsDetail!
				var newsDetailView: NewsDetailView!
				beforeEach {

					// Run before each test
					let elements = self.instantiate()
					newsDetail = elements["Presenter"] as! NewsDetail
					newsDetailView = elements["View"] as! NewsDetailView
				}

				afterEach{

					// Run after each test
				}

				// Puts test code here
				it("Set navigationbar title", closure: {

					newsDetailView.setNavigationTitleView(with: "TEST TITLE")
					expect(newsDetailView.navigationItem.title!).to(equal("TEST TITLE"))
				})

				it("Add button navigation bar", closure: {

					newsDetailView.addShareButton()
					expect(newsDetailView.navigationItem.rightBarButtonItems!.count).to(equal(1))
				})

				it("Register Cells", closure: {

					newsDetailView.registerCell()
					let registeredNibs = newsDetailView.tableView.value(forKey: "_nibMap") as? [String:UINib]

					print(registeredNibs!.keys)

					for key in registeredNibs!.keys {
						switch key {
						case "NewsTextCell":
							expect(key).to(equal("NewsTextCell"))
						case "NewsImageCell":
							expect(key).to(equal("NewsImageCell"))
						case "NewsTitleCell":
							expect(key).to(equal("NewsTitleCell"))
						case "NewsInfoCell":
							expect(key).to(equal("NewsInfoCell"))
						case "NewsSubTitleCell":
							expect(key).to(equal("NewsSubTitleCell"))
						default: break
						}
					}
				})
			})
		}
	}

	func instantiate() -> [String: Any] {

		let routerView = RouterView()
		routerView.presenter = Router(view: routerView)

		let newsView = NewsDetailView()
		let news = NewsDetail(view: newsView, router: routerView.presenter, data: self.mockNovelty() )
		newsView.presenter = news
		newsView.viewDidLoad()

		return ["View": newsView, "Navigation": routerView, "Presenter": news]
	}

	func mockNovelty() -> Novelty {

		let data = Stubs.loadFile(with: "jsonmock", in: NewsDetailViewTests.self)

		return ObjectJson.generateMany(json: JSON(data))![0].contents![0]
	}
}
