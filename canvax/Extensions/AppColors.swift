//
//  AppColors.swift
//  canvax
//
//  Created by valome on 5/27/25.
//  Primitive color tokens are foundational elements used to establish a consistent color palette throughout a design system or project. These tokens represent the core set of colors that serve as the building blocks for creating cohesive and visually appealing designs. These tokens can be easily referenced and reused across multiple components, promoting a unified visual language.

import SwiftUI

extension Color {
    static let appWhite = Color(whiteM) // #FFFFFF
    static let appPrimary = Color(primaryColorM) // #FA6950
    static let appAccent = Color(accentBlueM) // #2587D4
    static let appYellowHighlight = Color(highlightYellowM) // #F7EC61
    static let appblack = Color(blackM) // #000000
    static let appLightGray = Color(lightGrayM) // #D9D9D9
    static let appMediumGray = Color(mediumGrayM) // #CACACA
    static let appStrokeCircle = Color(strokeCircle) // #D1D1D1
    static let appLinearAsh = Color(linearMAsh) // #8C8C8C
    static let appLinearBlack = Color(linearMBlack) // #0D0D0D
    static let appcircleAsh = Color(ashCircleM) // #F3F4F6
    // Add more if needed
}
