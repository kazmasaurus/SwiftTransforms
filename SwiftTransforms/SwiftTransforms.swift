//
//  SwiftTransforms.swift
//  SwiftTransforms
//
//  Created by Zak Remer on 7/17/15.
//  Copyright (c) 2015 Zak. All rights reserved.
//

import Foundation

extension CGAffineTransform: Equatable { }
public func ==(lhs: CGAffineTransform, rhs: CGAffineTransform) -> Bool {
	return CGAffineTransformEqualToTransform(lhs, rhs)
}

extension CGAffineTransform {

	private typealias F = CGFloat // For all the casts

	// MARK: - Inits
	public init(a: Double, b: Double, c: Double, d: Double, tx: Double, ty: Double) {
		self.init(a: F(a), b: F(b), c: F(c), d: F(d), tx: F(tx), ty: F(ty))
	}

	public init(a: Int, b: Int, c: Int, d: Int, tx: Int, ty: Int) {
		self.init(a: F(a), b: F(b), c: F(c), d: F(d), tx: F(tx), ty: F(ty))
	}

	// MARK: Scale
	public init(scalex x: CGFloat, y: CGFloat) { self.init(a: x, b: 0, c: 0, d: y, tx: 0, ty: 0) }
	public init(scalex x: Double, y: Double) { self.init(scalex: F(x), y: F(y)) }
	public init(scalex x: Int, y: Int) { self.init(scalex: F(x), y: F(y)) }

	// MARK: Translate
	public init(translatex x: CGFloat, y: CGFloat) { self.init(a: 1, b: 0, c: 0, d: 1, tx: x, ty: y) }
	public init(translatex x: Double, y: Double) { self.init(translatex: F(x), y: F(y)) }
	public init(translatex x: Int, y: Int) { self.init(translatex: F(x), y: F(y)) }

	// MARK: Rotate
	public init(rotate angle: CGFloat) {
		self.init(a: cos(angle), b: sin(angle), c: -sin(angle), d: cos(angle), tx: 0, ty: 0)
	}
	public init(rotate angle: Double) { self.init(rotate: F(angle)) }
	public init(rotate angle: Int) { self.init(rotate: F(angle)) }
}

