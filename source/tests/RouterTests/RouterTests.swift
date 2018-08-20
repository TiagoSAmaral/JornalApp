//
//  RouterTests.swift
//  jornalappTests
//
//  Created by Tiago da Silva Amaral on 19/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Quick
import Nimble
@testable import jornalapp

class RouterTests: QuickSpec {

	override func spec() {

		describe("Test Router") {

			context("On init", closure: {

				var routerView: RouterView!
				var routerPresenter: Router!
				beforeEach {

					routerView = RouterView()
					routerPresenter = Router(view: routerView)
					routerView.presenter = routerPresenter
				}

				it("Check Presenter in View", closure: {

					expect(routerView.presenter).toNot(beNil())
				})

				it("Check View in Presenter", closure: {

					expect(routerPresenter.view).toNot(beNil())
				})

				it("RouterView Navigate to Repositories", closure: {

					routerView.presenter?.goTo(destiny: .notices, pushfoward: nil)
					expect(routerView.visibleViewController).toEventually(beAnInstanceOf(NewsView.self))
				})
			})

			context("Router", closure:{

				var routerView: RouterView!
				var routerPresenter: Router!
				beforeEach {

					routerView = RouterView()
					routerPresenter = Router(view: routerView)
					routerView.presenter = routerPresenter
				}

				it("Check method goTo", closure: {

					routerPresenter.goTo(destiny: .notices, pushfoward: nil)
					expect(routerView.visibleViewController).toEventually(beAnInstanceOf(NewsView.self))
				})

				it("Check buildView", closure: {

					let view = routerPresenter.buildView(NewsView.identifier, NewsView.self)
					expect(view).toEventually(beAnInstanceOf(NewsView.self))
				})
			})
		}
	}
}
