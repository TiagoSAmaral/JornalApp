//
//  NewsSubTitleCell.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 17/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

class NewsSubTitleCell: UITableViewCell, NewsCellProtocol {

	@IBOutlet weak var subtitleLabel: UILabel!

	func setCell(info: Novelty) {

		if let valitText = info.subtitle {
			subtitleLabel.text = valitText
		} else {

			self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.size.width, height: 0.0)
		}
	}
}
