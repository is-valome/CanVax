//
//  PrintDivider.swift
//  canvax
//
//  Created by valome on 5/28/25.
//

import Foundation

// MARK: - DIVIDER
let divider = "---------------------------------------------"
var  pd_count = 1

func pd_print(_ message: String) {
    print("\(pd_count). \(message)")
    print(divider)
    pd_count += 1
} // THIS A REUSABLE PRINT DIVIDER FUNCTION
