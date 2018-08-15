//
//  NSObject+Identifier.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 14/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Foundation

protocol Identifier{}

extension Identifier where Self: NSObject{

	static var identifier: String { return String(describing: self) }
}

extension NSObject: Identifier {}
