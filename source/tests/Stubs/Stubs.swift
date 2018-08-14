//
//  Stubs.swift
//  jornalappTests
//
//  Created by Tiago da Silva Amaral on 14/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Foundation


import Foundation
import OHHTTPStubs

class Stubs {

	func stubGetConnection (file: String, host: String, in path: String) {

		stub(condition: isMethodGET() && isHost(host) && isPath(path)) { _ in

			let stub = OHPathForFile(file + ".json", type(of: self))
			guard let resultStub = stub else { preconditionFailure("\(file).json not found!")}
			return OHHTTPStubsResponse(fileAtPath: resultStub, statusCode: 200, headers: nil)
		}

		OHHTTPStubs.setEnabled(true)
	}

	static func clearStubs() {

		OHHTTPStubs.removeAllStubs()
	}

	static func loadFile(with name: String, in bundleClass: AnyClass) -> Data {
		let path = Bundle(for: bundleClass).path(forResource: name, ofType: "json")
		do {
			return try Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe)
		} catch {
			fatalError("Error parse data to json: listRepositoriesMock from json file")
		}
	}
}
