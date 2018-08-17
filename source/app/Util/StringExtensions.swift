//
//  StringExtensions.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 17/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

extension String {

	func dateOutput(to format: String) -> String {

		let fomatter = DateFormatter()
		fomatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
		let date = fomatter.date(from: self)!

		fomatter.dateFormat = format
		fomatter.timeZone = TimeZone(secondsFromGMT: 0)
		return fomatter.string(from: date)
	}
}
