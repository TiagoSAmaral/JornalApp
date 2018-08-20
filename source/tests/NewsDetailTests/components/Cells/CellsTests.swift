import Quick
import Nimble
import SwiftyJSON

@testable import jornalapp

class CellsTests: QuickSpec {
	
	override func spec() {
		
		describe("Test Cells of NewViewDetail") {
			
			context("", closure: {

				// Puts test code here
				it("Test NewsTitleCell", closure: {

					let novelty = self.mockNovelty()
					let cell: NewsTitleCell = Bundle.main.loadNibNamed(NewsTitleCell.identifier, owner: nil, options: nil)?.first as! NewsTitleCell

					cell.setCell(info: novelty)
					expect(cell).toNot(beNil())
					expect(cell.titleLabel.text).to(equal(novelty.title?.uppercased()))
				})

				it("Test NewsSubTitleCell", closure: {

					let novelty = self.mockNovelty()
					let cell: NewsSubTitleCell = Bundle.main.loadNibNamed(NewsSubTitleCell.identifier, owner: nil, options: nil)?.first as! NewsSubTitleCell

					cell.setCell(info: novelty)
					expect(cell).toNot(beNil())
					expect(cell.subtitleLabel.text).to(equal(novelty.subtitle))
				})

				it("Test NewsInfoCell", closure: {

					let novelty = self.mockNovelty()
					let cell: NewsInfoCell = Bundle.main.loadNibNamed(NewsInfoCell.identifier, owner: nil, options: nil)?.first as! NewsInfoCell

					cell.setCell(info: novelty)
					expect(cell).toNot(beNil())

					let author = "POR " + novelty.authors![0].uppercased()
					let iconDateTime = cell.buildIconText(label: cell.datetime, fontSize: 12.0, text: novelty.updatedAt!.dateOutput(to: "dd/MM/yy HH:mm"), fontName: "clocko")

					expect(cell.author.text).to(equal(author))
					expect(cell.datetime.text).to(equal(iconDateTime))
				})

				it("Test NewsImageCell", closure: {

					let novelty = self.mockNovelty()
					let cell: NewsImageCell = Bundle.main.loadNibNamed(NewsImageCell.identifier, owner: nil, options: nil)?.first as! NewsImageCell

					cell.setCell(info: novelty)
					cell.setApperanceOfCell()

					var caption = novelty.imagens![0].caption
					caption?.append(" ")
					caption?.append(novelty.imagens![0].source!)

					expect(cell.imageMain.layer.sublayers?.count).toEventually(equal(1))
					expect(cell.subTitle.text).to(equal(caption))
					expect(cell.subTitle.textColor).to(equal(Colors.secondary.value))
				})

				it("Test NewsTextCell", closure: {

					let novelty = self.mockNovelty()
					let cell: NewsTextCell = Bundle.main.loadNibNamed(NewsTextCell.identifier, owner: nil, options: nil)?.first as! NewsTextCell

					cell.setCell(info: novelty)
					expect(cell).toNot(beNil())
					expect(cell.textContent.text).to(equal(novelty.text))
				})
			})
		}
	}

	func mockNovelty() -> Novelty {

		let data = Stubs.loadFile(with: "jsonmock", in: Stubs.self)

		return ObjectJson.generateMany(json: JSON(data))![0].contents![0]
	}
}
