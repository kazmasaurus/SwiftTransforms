//
//  SwiftTransforms.swift
//  SwiftTransforms
//
//  Created by Zak Remer on 7/17/15.
//  Copyright (c) 2015 Zak. All rights reserved.
//

import Foundation

public func ==(lhs: CGAffineTransform, rhs: CGAffineTransform) -> Bool {
	return CGAffineTransformEqualToTransform(lhs, rhs)
}

extension CGAffineTransform: Equatable {

	private typealias F = CGFloat // For all the casts

	// MARK: - Inits
	public init(a: Double, b: Double, c: Double, d: Double, tx: Double, ty: Double) {
		self.init(a: F(a), b: F(b), c: F(c), d: F(d), tx: F(tx), ty: F(ty))
	}

	public init(a: Int, b: Int, c: Int, d: Int, tx: Int, ty: Int) {
		self.init(a: F(a), b: F(b), c: F(c), d: F(d), tx: F(tx), ty: F(ty))
	}

	// MARK: Scale
	public init(sx: CGFloat, sy: CGFloat) { self.init(a: sx, b: 0, c: 0, d: sy, tx: 0, ty: 0) }
	public init(sx: Double, sy: Double) { self.init(sx: F(sx), sy: F(sy)) }
	public init(sx: Int, sy: Int) { self.init(sx: F(sx), sy: F(sy)) }

	// MARK: Translate
	public init(tx: CGFloat, ty: CGFloat) { self.init(a: 1, b: 0, c: 0, d: 1, tx: tx, ty: ty) }
	public init(tx: Double, ty: Double) { self.init(tx: F(tx), ty: F(ty)) }
	public init(tx: Int, ty: Int) { self.init(tx: F(tx), ty: F(ty)) }

	public init(angle: CGFloat) {
		self.init(a: cos(angle), b: sin(angle), c: -sin(angle), d: cos(angle), tx: 0, ty: 0)
	}
	public init(angle: Double) { self.init(angle: F(angle)) }
	public init(angle: Int) { self.init(angle: F(angle)) }
}


extension CATransform3D {


}
