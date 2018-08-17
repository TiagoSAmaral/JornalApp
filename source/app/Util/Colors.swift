//
//  Colors.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 16/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

enum Colors {

	case primary
	case secondary
	case title
	case text
	case dark
	case transparent

	var value: UIColor {

		switch self {
		case .primary:
			return UIColor(red: 65.0/255.0, green: 114.0/255.0, blue: 170.0/255.0, alpha: 1.0)
		case .secondary:
			return .white
		case .dark:
			return .black
		case .transparent:
			return .clear
		case .title:
			return UIColor(red: 160.0/255.0, green: 180.0/255.0, blue: 191.0/255.0, alpha: 1.0)
		case .text:
			return UIColor(red: 25.0/255.0, green: 51.0/255.0, blue: 75.0/255.0, alpha: 1.0)
		}
	}
}
