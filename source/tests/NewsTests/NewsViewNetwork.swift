//
//  NewsViewNetwork.swift
//  jornalappTests
//
//  Created by Tiago da Silva Amaral on 19/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Quick
import Nimble
@testable import jornalapp

class NewsViewNetworkTests: QuickSpec {

	let stubs: Stubs = Stubs()

	override func setUp() {
		super.setUp()

		self.stubs.stubGetConnection(file: "jsonmock", host: "localhost", in: "/Infoglobo/desafio-apps/master/capa.json")
	}

	override func spec() {
		
        describe("Test NewsViewNetwork") {

			context("", closure: {

				var network: NewsNetwork!
				beforeEach {

                    // Run before each test
					network = NewsNetwork()
                }

                afterEach{

                     // Run after each test
                }

                // Puts test code here
				it("Test Get Method", closure: { waitUntil { done in

					network.requestNews(finish: { (novelties, error) in

						expect(novelties?.count).to(beGreaterThan(0))
						done()
					})
				}})
            })
        }
	}
}
