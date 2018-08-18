//
//  Banner.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 15/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit
import Kingfisher

class Banner: UIView {

	@IBOutlet var photo: UIImageView!
	@IBOutlet var title: UILabel!
	@IBOutlet var section: UILabel!
	var defaultCoder: UIImage = UIImage(named: "cover-news")!

	override func draw(_ rect: CGRect) {
		// Drawing code

		self.section.isHidden = true
		self.setupView(of: self.section, fontName: "Arial Rounded MT Bold", size: 14.0, colorFont: Colors.secondary.value, fitContent: true, alignment: .center, backgroundColor: Colors.dark.value)
		self.setupView(of: self.title, fontName: "Arial Rounded MT Bold", size: 16.0, colorFont: Colors.secondary.value, fitContent: false, alignment: .center, backgroundColor: Colors.transparent.value)
		self.photo.layer.addSublayer(self.addGradientShadow(with: self.photo, height: self.bounds.height, percent: 0.5)!)
	}
// self.photo.image!.size.height
	func setBanner(with notice: Novelty) {

		self.photo.kf.setImage(with: notice.imagens![0].sourceUrl!, placeholder: defaultCoder)
		self.section.text = notice.secao!.nome!
		self.title.text = notice.titulo
		self.section.isHidden = false
	}

	func setupView(of label: UILabel, fontName: String, size: CGFloat, colorFont: UIColor, fitContent: Bool, alignment: NSTextAlignment, backgroundColor: UIColor) {

		label.backgroundColor = backgroundColor
		label.textColor = colorFont
		label.font = UIFont(name: fontName, size: size)
		label.textAlignment = alignment

		if fitContent {
			label.sizeToFit()
		}
	}
}
