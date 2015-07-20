//
//  SwiftTransforms.swift
//  SwiftTransforms
//
//  Created by Zak Remer on 7/17/15.
//  Copyright (c) 2015 Zak. All rights reserved.
//

import Foundation

// MARK: - Equality
extension CGAffineTransform: Equatable { }
public func ==(lhs: CGAffineTransform, rhs: CGAffineTransform) -> Bool {
	return CGAffineTransformEqualToTransform(lhs, rhs)
}

// MARK: - Concatenation
public func *(lhs: CGAffineTransform, rhs: CGAffineTransform) -> CGAffineTransform {
	return lhs.concat(rhs)
}

extension CGAffineTransform {

	private typealias F = CGFloat // For all the casts

	// MARK: - Constants
	public static let identityTransform = CGAffineTransformIdentity

	// MARK: - Properties
	public var isIdentity: Bool { return CGAffineTransformIsIdentity(self) }

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

	// MARK: - Modifications
	// MARK: Translate
	public func translate(tx: CGFloat, ty: CGFloat) -> CGAffineTransform {
		return CGAffineTransformTranslate(self, tx, ty)
	}
	public func translate(tx: Double, ty: Double) -> CGAffineTransform {
		return translate(F(tx), ty: F(ty))
	}
	public func translate(tx: Int, ty: Int) -> CGAffineTransform {
		return translate(F(tx), ty: F(ty))
	}

	// MARK: Scale
	public func scale(sx: CGFloat, sy: CGFloat) -> CGAffineTransform {
		return CGAffineTransformScale(self, sx, sy)
	}
	public func scale(sx: Double, sy: Double) -> CGAffineTransform {
		return CGAffineTransformScale(self, F(sx), F(sy))
	}
	public func scale(sx: Int, sy: Int) -> CGAffineTransform {
		return CGAffineTransformScale(self, F(sx), F(sy))
	}

	// MARK: Rotate
	public func rotate(angle: CGFloat) -> CGAffineTransform {
		return CGAffineTransformRotate(self, angle)
	}
	public func rotate(angle: Double) -> CGAffineTransform {
		return CGAffineTransformRotate(self, F(angle))
	}
	public func rotate(angle: Int) -> CGAffineTransform {
		return CGAffineTransformRotate(self, F(angle))
	}

	// MARK: Invert
	public func invert() -> CGAffineTransform {
		return CGAffineTransformInvert(self)
	}

	public var inverse: CGAffineTransform { return invert() }

	// MARK: Concat
	public func concat(transform: CGAffineTransform) -> CGAffineTransform {
		return CGAffineTransformConcat(self, transform)
	}
}

extension CGAffineTransform: Printable {
	public var description: String { return NSStringFromCGAffineTransform(self) }
}



