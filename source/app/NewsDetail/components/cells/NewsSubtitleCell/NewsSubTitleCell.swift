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

	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	func setCell(info: Novelty) {

		if let valitText = info.subTitulo {
			subtitleLabel.text = valitText
		} else {

			self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.size.width, height: 0.0)//.frame.height = CGFloat(0.0)
		}
	}
}
