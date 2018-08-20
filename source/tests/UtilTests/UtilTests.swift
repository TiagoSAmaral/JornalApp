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
@testable import jornalapp

class UtilTests: QuickSpec {

	override func spec() {

		describe("Test Util") {

			context("Test Enviroment", closure: {

				var enviroment: Environment!
				beforeEach {

					// Run before each test
					enviroment = Environment()
				}

				// Puts test code here
				it("Debug Environment", closure: {

					expect(enviroment.current).to(equal(EnvironmentFlag.debug))
				})
			})

			context("NSObject+Identifier", closure: {

				it ("Test extension NSObject+Identifier", closure:{

					expect(NSObject.identifier).to(equal("NSObject"))
				})
			})

			context("Test String Date", closure: {

				it ("Test extension NSObject+Identifier", closure:{

					let dateTimeSource = "2018-08-18T13:30:25Z"
					let formated = dateTimeSource.dateOutput(to: "dd/MM/yyyy HH:mm")

					expect(formated).to(equal("18/08/2018 13:30"))
				})
			})

		}
	}
}
