//
//  NewsTextCell.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 17/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

class NewsTextCell: UITableViewCell, NewsCellProtocol {

	@IBOutlet weak var textContent: UILabel!

	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

	func setCell(info: Novelty) {
		self.textContent.text = info.text
	}
}
