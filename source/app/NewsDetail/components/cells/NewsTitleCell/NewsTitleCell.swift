//
//  NewsTitleCell.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 17/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

class NewsTitleCell: UITableViewCell, NewsCellProtocol {

	@IBOutlet weak var titleLabel: UILabel!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

	func setCell(info: Novelty) {
		self.titleLabel.text = info.title?.uppercased()
	}
}
