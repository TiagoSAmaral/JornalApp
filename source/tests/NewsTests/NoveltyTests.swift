//
//  NoveltyTests.swift
//  jornalappTests
//
//  Created by Tiago da Silva Amaral on 19/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Quick
import Nimble
import SwiftyJSON
@testable import jornalapp

class NoveltyTests: QuickSpec {

	override func spec() {
		
        describe("Test Model Novelty") {

			context("", closure: {

				beforeEach {

                    // Run before each test

                }

                afterEach{

                     // Run after each test
                }

                // Puts test code here
				it("Test Instatiate ObjectJson with Novelty list", closure: {

					let data = Stubs.loadFile(with: "jsonmock", in: NoveltyTests.self)
					let objectJson: [ObjectJson] = ObjectJson.generateMany(json: JSON(data))!
					let firstNovelty: Novelty = objectJson[0].contents![0]

					expect(objectJson.count).to(beGreaterThan(0))
					expect(objectJson[0].contents!.count).to(beGreaterThan(0))
					expect(firstNovelty.section).toNot(beNil())
					expect(firstNovelty.imagens!.count).to(beGreaterThan(0))

				})
            })
        }
	}
}
