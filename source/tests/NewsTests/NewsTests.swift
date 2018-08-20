//
//  NewsTests.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 19/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Quick
import Nimble
import SwiftyJSON
@testable import jornalapp

class NewsTests: QuickSpec {

	let stubs: Stubs = Stubs()

	override func setUp() {
		super.setUp()

		self.stubs.stubGetConnection(file: "jsonmock", host: "localhost", in: "/Infoglobo/desafio-apps/master/capa.json")
	}

	override func spec() {

		afterSuite {
			Stubs.clearStubs()
		}
		
        describe("Test News") {

			context("", closure: {

				var news: News!
				var newsView: NewsView!
				var routerView: RouterView!

				beforeEach {

					let elements = self.instantiate()
					news = elements["Presenter"] as! News
					newsView = elements["View"] as! NewsView
					routerView = elements["Navigation"] as! RouterView
                }

				it("Navigate to NewsViewDetail", closure:{
					news.novelties = [self.mockNovelty()]
					news.selectCell(at: 0)
					expect(routerView.visibleViewController).toEventually(beAnInstanceOf(NewsDetailView.self), timeout: 3)
				})

				it("Request News", closure: {
					news.requestNoveltyList()
					expect(news.novelties.count).toEventually(beGreaterThan(0))
					expect(news.novelties.count).toEventually(equal(14))
				})

				it("Update sizelist and novelties", closure:{
					news.updateView(noveltys: [self.mockNovelty()])
					expect(news.sizeList).to(equal(1))
				})
            })
        }
	}

	func instantiate() -> [String: Any] {

		let routerView = RouterView()
		routerView.presenter = Router(view: routerView)
		routerView.viewWillAppear(true)

		let newsView = routerView.visibleViewController as! NewsView
		let news = newsView.presenter as! News

		return ["View": newsView, "Navigation": routerView, "Presenter": news]
	}

	func mockNovelty() -> Novelty {

		let data = Stubs.loadFile(with: "jsonmock", in: NewsTests.self)

		return ObjectJson.generateMany(json: JSON(data))![0].contents![0]
	}
}
