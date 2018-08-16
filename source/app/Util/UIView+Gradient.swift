//
//  UIView+Gradient.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 15/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

extension UIView {

	func addGradientShadow( with view: UIView, height percent: CGFloat) -> CAGradientLayer? {

		if percent < 0.0 || percent > 1.0 {
			return nil
		}

		let heightShadow = view.frame.size.height * percent
		let positionY = view.frame.size.height - heightShadow

		let gradient = CAGradientLayer()
		gradient.frame = CGRect(x: view.frame.origin.x,
								y: positionY ,
								width: view.frame.size.width,
								height: heightShadow)

		gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]

		return gradient
	}
}
