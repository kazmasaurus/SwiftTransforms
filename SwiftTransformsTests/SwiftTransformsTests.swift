//
//  SwiftTransformsTests.swift
//  SwiftTransformsTests
//
//  Created by Zak Remer on 7/17/15.
//  Copyright (c) 2015 Zak. All rights reserved.
//

import UIKit
import XCTest
import SwiftTransforms

class SwiftTransformsTests: XCTestCase {
    
	// MARK: - CGAffineTransform
	typealias Transform = CGAffineTransform

	typealias S = SwiftTransformsTests

	static let xi = 10
	static let yi = 11

	let x = CGFloat(S.xi)
	let y = CGFloat(S.yi)
	let xd = Double(S.xi)
	let yd = Double(S.yi)
	let xi: Int = S.xi
	let yi: Int = S.yi

	// MARK: Equality
	func testEquality() {
		XCTAssertTrue(Transform() == Transform())
		XCTAssertFalse(Transform() == CGAffineTransformIdentity)
		XCTAssertTrue(CGAffineTransformIdentity == CGAffineTransformIdentity)
		XCTAssertTrue(Transform(tx: x, ty: y) == Transform(a: 1, b: 0, c: 0, d: 1, tx: x, ty: y))
	}

	// MARK: Inits
	func testScaleInit() {
		XCTAssertTrue(Transform(sx: x, sy: y) == CGAffineTransformMakeScale(x, y))
		XCTAssertTrue(Transform(sx: xi, sy: yi) == Transform(sx: xd, sy: yd)	)
	}

	func testTranslateInit() {
		XCTAssertTrue(Transform(tx: x, ty: y) == CGAffineTransformMakeTranslation(x, y))
		XCTAssertTrue(Transform(tx: xi, ty: yi) == Transform(tx: xd, ty: yd))
	}

	func testRotateInit() {
		XCTAssertTrue(Transform(angle: x) == CGAffineTransformMakeRotation(x))
		XCTAssertTrue(Transform(angle: xi) == Transform(angle: xd))
	}
}
