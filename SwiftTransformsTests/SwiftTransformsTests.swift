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
    
	// Testing values
	static let xi = 10
	static let yi = 11
	typealias S = SwiftTransformsTests

	let x = CGFloat(S.xi)
	let y = CGFloat(S.yi)
	let xd = Double(S.xi)
	let yd = Double(S.yi)
	let xi: Int = S.xi
	let yi: Int = S.yi

	// MARK: - CGAffineTransform
	typealias Transform = CGAffineTransform


	// MARK: Equality
	func testEquality() {
		XCTAssertTrue(Transform() == Transform())
		XCTAssertFalse(Transform() == CGAffineTransformIdentity)
		XCTAssertTrue(CGAffineTransformIdentity == CGAffineTransformIdentity)
		XCTAssertTrue(Transform(translatex: x, y: y) == Transform(a: 1, b: 0, c: 0, d: 1, tx: x, ty: y))
	}

	// MARK: Identity
	func testIdentity() {
		XCTAssertTrue(Transform.identityTransform == CGAffineTransformIdentity)
		XCTAssertTrue(Transform.identityTransform.isIdentity)
		XCTAssertTrue(CGAffineTransformIdentity.isIdentity)
		XCTAssertFalse(Transform(scalex: 10, y: 10).isIdentity)
	}

	// MARK: Inits
	func testScaleInit() {
		XCTAssertTrue(Transform(scalex: x, y: y) == CGAffineTransformMakeScale(x, y))
		XCTAssertTrue(Transform(scalex: xi, y: yi) == Transform(scalex: xd, y: yd)	)
	}

	func testTranslateInit() {
		XCTAssertTrue(Transform(translatex: x, y: y) == CGAffineTransformMakeTranslation(x, y))
		XCTAssertTrue(Transform(translatex: xi, y: yi) == Transform(translatex: xd, y: yd))
	}

	func testRotateInit() {
		XCTAssertTrue(Transform(rotate: x) == CGAffineTransformMakeRotation(x))
		XCTAssertTrue(Transform(rotate: xi) == Transform(rotate: xd))
	}

	// MARK: - Modifications
	let transform = Transform.identityTransform.scale(12.0, sy: 13.0).rotate(1.8)

	func testTranslate() {
		XCTAssertTrue(transform.translate(x, ty: y) == CGAffineTransformTranslate(transform, x, y))
		XCTAssertTrue(transform.translate(xd, ty: yd) == transform.translate(xi, ty: yi))
	}

	func testScale() {
		XCTAssertTrue(transform.scale(x, sy: y) == CGAffineTransformScale(transform, x, y))
		XCTAssertTrue(transform.scale(xd, sy: yd) == transform.scale(xi, sy: yi))
	}

	func testRotate() {
		XCTAssertTrue(transform.rotate(x) == CGAffineTransformRotate(transform, x))
		XCTAssertTrue(transform.rotate(xd) == transform.rotate(xi))
	}

	func testInvert() {
		XCTAssertTrue(transform.invert() == CGAffineTransformInvert(transform))
		XCTAssertTrue(transform.inverse == transform.invert())
	}

	func testConcat() {
		XCTAssertTrue(transform.concat(transform) == CGAffineTransformConcat(transform, transform))
		XCTAssertTrue(transform * transform == transform.concat(transform))
	}
}
