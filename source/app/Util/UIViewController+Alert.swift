//
//  UIViewController+Alert.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 15/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

extension UIViewController {

	func showAlert(with title: String, and message: String, completion: (() -> Void)?) {

		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Fechar", style: .cancel, handler: nil))
		self.present(alert, animated: true, completion: completion)
	}
}
