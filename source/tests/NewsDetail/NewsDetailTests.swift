//
//  ViewControllerTests.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 14/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Quick
import Nimble
import SwiftyJSON

@testable import jornalapp

class NewsDetailTests: QuickSpec {

	override func spec() {

        describe("NewsDetail Tests") {

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
				it("Build scheme array of MapNovelyBody", closure: {

					let array = newsDetail.buildSchemsTableView(notice: newsDetail.novelty)
					expect(array.count).to(equal(5))
					expect(newsDetail.sizeList).to(equal(5))
					
					expect(array[0]).to(equal(MapNovelyBody.title))
					expect(array[1]).to(equal(MapNovelyBody.subtitle))
					expect(array[2]).to(equal(MapNovelyBody.info))
					expect(array[3]).to(equal(MapNovelyBody.image))
					expect(array[4]).to(equal(MapNovelyBody.text))

				})

				it("Build Cell", closure: {

					let array = newsDetail.buildSchemsTableView(notice: newsDetail.novelty)
					let cells = newsDetail.buildCells(with: array, tableView: newsDetail.view.tableView)

					expect(cells.count).to(equal(5))

					expect(cells[0]).to(beAnInstanceOf(NewsTitleCell.self))
					expect(cells[1]).to(beAnInstanceOf(NewsSubTitleCell.self))
					expect(cells[2]).to(beAnInstanceOf(NewsInfoCell.self))
					expect(cells[3]).to(beAnInstanceOf(NewsImageCell.self))
					expect(cells[4]).to(beAnInstanceOf(NewsTextCell.self))
				})

				it("Share Novelty", closure: {

					let share = newsDetail.sharedNovely(sourceView: newsDetailView.navigationItem.rightBarButtonItems![0])
					expect(share).toNot(beNil())
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

		let data = Stubs.loadFile(with: "jsonmock", in: NewsDetailTests.self)

		return ObjectJson.generateMany(json: JSON(data))![0].contents![0]
	}
}
