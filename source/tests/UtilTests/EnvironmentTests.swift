//
//  EnvironmentTests.swift
//  jornalappTests
//
//  Created by Tiago da Silva Amaral on 14/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//


import Foundation
import Quick
import Nimble
@testable import skymovies

class EnvironmentTests: QuickSpec {

	override func spec() {

		describe("Test detect environment") {

			context("", closure: {

				var enviroment: Environment!
				beforeEach {

					// Run before each test
					enviroment = Environment()
				}

				afterEach{

					// Run after each test
				}

				// Puts test code here
				it("Debug Environment", closure: {

					expect(enviroment.current).to(equal(EnvironmentFlag.debug))
				})
			})
		}
	}
}
