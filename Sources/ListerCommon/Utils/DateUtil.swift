//
//  Asynchronous.swift
//  Id memo
//
//  Created by 李斯特 on 2021/4/8.
//

import Foundation

public class Asynchronous {
    
    /// 异步操作
    /// - Parameter action: 异步执行的方法
    static func async(_ run: @escaping () -> Void) {
        DispatchQueue(label: "com.lister.queue.label", attributes: .concurrent).async {
            run()
        }
    }
    
}
