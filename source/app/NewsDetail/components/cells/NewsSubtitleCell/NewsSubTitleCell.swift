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
		self.subtitleLabel.text = info.subtitle
	}
}
