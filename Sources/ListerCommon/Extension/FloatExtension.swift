//
//  FloatExtension.swift
//
//  Created by 李斯特 on 2021/4/11.
//

import Foundation

/**
 单精度的随机数
 */
public extension Float {
    static func randomFloatNumber(lower: Float = 0,upper: Float = 100) -> Float {
        return (Float(arc4random()) / Float(UInt32.max)) * (upper - lower) + lower
    }
}
