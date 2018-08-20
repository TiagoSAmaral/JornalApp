//
//  NoveltyCellTests.swift
//  jornalappTests
//
//  Created by Tiago da Silva Amaral on 19/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Quick
import Nimble
import SwiftyJSON

@testable import jornalapp

class NoveltyCellTests: QuickSpec {

	override func spec() {
		
        describe("Test NoveltyCell") {

			context("", closure: {

                // Puts test code here
				it("", closure: {

					let cell: NoveltyCell = Bundle.main.loadNibNamed(NoveltyCell.identifier, owner: nil, options: nil)?.first as! NoveltyCell
					cell.setupCell(with: self.mockNovelty())

					expect(cell.photo.image).notTo(beNil())
					expect(cell.sectionName.text).notTo(beNil())
					expect(cell.subtitle.text).notTo(beNil())

				})
            })
        }
	}

	func mockNovelty() -> Novelty {

		let data = Stubs.loadFile(with: "jsonmock", in: NewsTests.self)

		return ObjectJson.generateMany(json: JSON(data))![0].contents![0]
	}
}
