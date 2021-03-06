//
//  Novelty.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 15/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ObjectJson: Codable {

	let contents: [Novelty]?
	let product: String?

	init?(json: JSON?) {

		guard let validJson = json else {
			return nil
		}

		self.product = validJson[JsonProperty.product.rawValue].string
		var novelties: [Novelty] = [Novelty]()

		for content in validJson[JsonProperty.contents.rawValue].array! {

			novelties.append(Novelty(json: content))
		}

		self.contents = novelties
	}

	static func generateMany(json: JSON?) -> [ObjectJson]? {

		guard let validJson = json else {
			return nil
		}

		guard let jsonArray = validJson.array else {
			return nil
		}

		var objectsJson: [ObjectJson] = [ObjectJson]()

		for object in jsonArray {

			if let validObj = ObjectJson(json: object) {
				objectsJson.append(validObj)
			}
		}

		return objectsJson
	}
}

struct Novelty: Codable {

	let authors: [String]?
	let advertising: Bool?
	let subtitle: String?
	let text: String?
	let videos: [String]?
	let updatedAt: String?
	let identifier: Int?
	let publishedIn: String?
	let section: Section?
	let type: String?
	let title: String?
	let mobileUrl: URL?
	let urlOriginal: URL?
	let imagens: [Image]?

	init (json: JSON) {

		if let jsonArrayAuthors = json[JsonProperty.authors.rawValue].array {
			var newAuthors: [String] = [String]()
			for author in jsonArrayAuthors {
				newAuthors.append(author.string!)
			}
			self.authors = newAuthors
		} else {
			self.authors = nil
		}

		if let jsonArrayViewdos = json[JsonProperty.videos.rawValue].array {
			var newVideos: [String] = [String]()
			for author in jsonArrayViewdos {
				newVideos.append(author.string!)
			}
			self.videos = newVideos
		} else {
			self.videos = nil
		}

		self.advertising = json[JsonProperty.advertising.rawValue].bool
		self.subtitle = json[JsonProperty.subtitle.rawValue].string
		self.text = json[JsonProperty.text.rawValue].string
		self.updatedAt = json[JsonProperty.updatedAt.rawValue].string
		self.identifier = json[JsonProperty.identifier.rawValue].int
		self.publishedIn = json[JsonProperty.publishedIn.rawValue].string
		self.type = json[JsonProperty.type.rawValue].string
		self.title = json[JsonProperty.title.rawValue].string
		self.mobileUrl = URL(string: json[JsonProperty.stringUrl.rawValue].string!)
		self.urlOriginal = URL(string: json[JsonProperty.urlOriginal.rawValue].string!)

		self.section = Section(json: json[JsonProperty.section.rawValue])
		self.imagens = Image.generatyMany(json: json[JsonProperty.imagens.rawValue])
	}

	static func generatyMany(with data: Data?) -> Novelty? {

		guard let validData = data else {
			return nil
		}

		return try? JSONDecoder().decode(Novelty.self, from: validData)
	}
}

struct Section: Codable {

	let name: String?
	let sectionUrl: URL?

	init(json: JSON) {
		self.name = json[JsonProperty.name.rawValue].string
		self.sectionUrl = URL(string: json[JsonProperty.stringUrl.rawValue].string!)
	}
}

struct Image: Codable {

	let author: String?
	let source: String?
	let caption: String?
	let sourceUrl: URL?

	init(json: JSON) {
		self.author = json[JsonProperty.author.rawValue].string
		self.source = json[JsonProperty.source.rawValue].string
		self.caption = json[JsonProperty.caption.rawValue].string
		self.sourceUrl = URL(string: json[JsonProperty.stringUrl.rawValue].string!)
	}

	static func generatyMany(json: JSON) -> [Image]? {

		var images: [Image] = [Image]()

		for imageJson in json.array! {

			images.append(Image(json: imageJson))
		}

		return images
	}
}

enum JsonProperty: String {
	case authors = "autores"
	case advertising = "informePublicitario"
	case subtitle = "subTitulo"
	case text = "texto"
	case videos = "videos"
	case updatedAt = "atualizadoEm"
	case identifier = "id"
	case publishedIn = "publicadoEm"
	case section = "secao"
	case name = "nome"
	case stringUrl = "url"
	case type = "tipo"
	case title = "titulo"
	case urlOriginal = "urlOriginal"
	case imagens = "imagens"
	case author = "autor"
	case source = "fonte"
	case caption = "legenda"
	case product = "produto"
	case contents = "conteudos"
}
