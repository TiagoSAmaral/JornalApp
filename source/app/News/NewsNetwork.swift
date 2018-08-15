//
//  NewsNetwork.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 15/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol NewsNetworkInterface {

	func requestNews(finish: @escaping ([Novelty]?, Error?) -> Void)
}

class NewsNetwork: NewsNetworkInterface {

	let network: NetworInterface = Network()
	let apiPaths: ApiPaths = ApiPaths()

	func requestNews(finish: @escaping ([Novelty]?, Error?) -> Void) {

		self.network.request(self.apiPaths.urlNoveltyList, operation: .get, header: nil, params: nil) { (data, error) in

			var groupedContent: [Novelty]? = [Novelty]()

			if let validData = data {
				if let newsContents = ObjectJson.generateMany(json: JSON(validData)) {

					_ = newsContents.map({ groupedContent!.append(contentsOf: $0.contents!) })
				}
			}

			finish(groupedContent, error)
		}
	}
}
