//
//  NewsInfoCell.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 17/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit
import SwiftIconFont

class NewsInfoCell: UITableViewCell, NewsCellProtocol {

	@IBOutlet weak var author: UILabel!
	@IBOutlet weak var datetime: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	func setCell(info: Novelty) {

		var fullAuthor = "POR "
		fullAuthor.append(info.authors![0].uppercased())
		let nameForColor = info.authors![0].uppercased()

		let range = (fullAuthor as NSString).range(of: nameForColor)
		let attributedString = NSMutableAttributedString(string: fullAuthor)
		attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: Colors.primary.value, range: range)

		self.author.attributedText = attributedString
		self.buildIconText(label: self.datetime, fontSize: 12.0, text: info.updatedAt!.dateOutput(to: "dd/MM/yy HH:mm"), fontName: "clocko")
		self.datetime.textColor = Colors.dateTime.value
	}

	func buildIconText(label: UILabel, fontSize: CGFloat, text: String, fontName: String){

		label.font = UIFont.icon(from: .fontAwesome, ofSize: fontSize)
		var icon = String.fontAwesomeIcon(fontName)!
		icon.append(" \(text)")
		label.text = icon
	}
}
