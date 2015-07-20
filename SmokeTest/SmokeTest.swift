//
//  SmokeTest.swift
//  SmokeTest
//
//  Created by Zak Remer on 7/19/15.
//  Copyright (c) 2015 Zak. All rights reserved.
//

import UIKit
import XCTest

class SmokeTest: XCTestCase {
    
	// This is a smoke test to see if any of this functionality has been included by Apple.
	// Every line here represents functionality provided by this library.
	// Any line _not_ throwing a build error has been added by Apple and can be removed.

	typealias Transform = CGAffineTransform

	static let xi = 10
	static let yi = 11
	typealias S = SmokeTest

	let x = CGFloat(S.xi)
	let y = CGFloat(S.yi)
	let xd = Double(S.xi)
	let yd = Double(S.yi)
	let xi: Int = S.xi
	let yi: Int = S.yi

	func testCompilation() {
		Transform() == Transform()

		Transform.identityTransform

		Transform(scalex: x, y: y)
		Transform(scalex: xd, y: yd)
		Transform(scalex: xi, y: yi)

		Transform(translatex: x, y: y)
		Transform(translatex: xd, y: yd)
		Transform(translatex: xi, y: yi)

		Transform(rotate: x)
		Transform(rotate: xd)
		Transform(rotate: xi)

		Transform().translate(x, ty: y)
		Transform().translate(xd, ty: yd)
		Transform().translate(xi, ty: yi)

		Transform().scale(x, sy: y)
		Transform().scale(xd, sy: yd)
		Transform().scale(xi, sy: yi)

		Transform().rotate(x)
		Transform().rotate(xd)
		Transform().rotate(xi)

		Transform().invert()
		Transform().inverse

		Transform().concat(Transform())
		Transform() * Transform()
	}
}
