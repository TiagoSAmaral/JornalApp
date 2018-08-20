//
//  NoveltyCell.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 15/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit
import Kingfisher

class NoveltyCell: UITableViewCell {

	@IBOutlet weak var photo: UIImageView!
	@IBOutlet weak var sectionName: UILabel!
	@IBOutlet weak var subtitle: UILabel!

	private var defaultCoder: UIImage = UIImage(named: "cover-news")!

	func setupCell(with novelty: Novelty) {

		self.sectionName.text = novelty.section?.name?.uppercased()
		self.subtitle.text = novelty.subtitle != nil ? novelty.subtitle : novelty.title

		self.photo.image = defaultCoder

		if !novelty.imagens!.isEmpty {
			self.photo.kf.setImage(with: novelty.imagens?[0].sourceUrl)
		}
	}

	func willRemoveCell() {

		self.photo.kf.cancelDownloadTask()
	}
}
