//
//  ViewController.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 14/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var presenter: ViewLogic!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

class ViewLogic {

	var view: ViewController!

	init(view: ViewController) {

		self.view = view
	}
}
