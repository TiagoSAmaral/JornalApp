//
//  ViewControllerTests.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 14/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Quick
import Nimble
@testable import jornalapp

class ViewControllerTests: QuickSpec {

	override func spec() {
		
        describe("ViewControllers Tests") {

			context("ViewController", closure: {

				beforeEach {

                    // Run before each test

                }

                afterEach{

                     // Run after each test
                }

                // Puts test code here
				it("Do something", closure: {

					expect("value").to(equal("value"))
				})
            })
        }
	}
}
