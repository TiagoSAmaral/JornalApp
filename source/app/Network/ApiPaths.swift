//
//  APIPaths.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 15/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Foundation

protocol ApiPathsInterface {

	var urlNoveltyList: URL { get }
}

class ApiPaths: ApiPathsInterface {

	fileprivate let enviroment: Environment = Environment()
	fileprivate var urlBase: String!

	init() {

		switch enviroment.current {
		case .debug:
			self.urlBase = "http://localhost:3001"
		case .release:
			self.urlBase = "https://raw.githubusercontent.com"
		}
	}

	var urlNoveltyList: URL { return  URL(string: "\(self.urlBase!)/Infoglobo/desafio-apps/master/capa.json")! }
}
