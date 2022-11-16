//
//  SkewedOffset.swift
//  AdvancedAnimations
//
//  Created by Natasha Godwin on 11/16/22.
//

import SwiftUI

struct SkewedOffset: GeometryEffect {
	 var offset: CGFloat
	 var progress: CGFloat
	 let goingRight: Bool

	 init(offset: CGFloat, progress: CGFloat, goingRight: Bool) {
		  self.offset = offset
		  self.progress = progress
		  self.goingRight = goingRight
	 }

	 var animatableData: AnimatablePair<CGFloat, CGFloat> {
		  get { return AnimatablePair<CGFloat, CGFloat>(offset, progress) }
		  set {
				offset = newValue.first
				progress = newValue.second
		  }
	 }

	 func effectValue(size: CGSize) -> ProjectionTransform {
		  var skew: CGFloat

		  if progress < 0.2 {
				skew = (progress * 5) * 0.5 * (goingRight ? -1 : 1)
		  } else if progress > 0.8 {
				skew = ((1 - progress) * 5) * 0.5 * (goingRight ? -1 : 1)
		  } else {
				skew = 0.5 * (goingRight ? -1 : 1)
		  }

		  return ProjectionTransform(CGAffineTransform(a: 1, b: 0, c: skew, d: 1, tx: offset, ty: 0))
	 }
}
