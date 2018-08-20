//
//  UIView+Gradient.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 15/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

extension UIView {
//CGFloat
	func addGradientShadow( with view: UIView, height: CGFloat, percent heightShadownPercent: CGFloat) -> CAGradientLayer? {

		if heightShadownPercent < 0.0 || heightShadownPercent > 1.0 {
			return nil
		}

		let heightShadow = height * heightShadownPercent
		let positionY = height - heightShadow

		let gradient = CAGradientLayer()
		gradient.frame = CGRect(x: view.frame.origin.x,
								y: positionY ,
								width: UIScreen.main.bounds.width,
								height: heightShadow)

		gradient.colors = [Colors.transparent.value.cgColor, Colors.dark.value.cgColor]

		return gradient
	}
}
