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

	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	func setupCell(with novelty: Novelty) {

		self.sectionName.text = novelty.secao?.nome
		self.subtitle.text = novelty.subTitulo != nil ? novelty.subTitulo : novelty.titulo

		self.photo.image = defaultCoder
		
		if !novelty.imagens!.isEmpty {
			self.photo.kf.setImage(with: novelty.imagens?[0].sourceUrl)
		}
	}

	func willRemoveCell() {

		self.photo.kf.cancelDownloadTask()
	}
}