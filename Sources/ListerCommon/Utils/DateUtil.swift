//
//  DateUtil.swift
//
//  Created by 李斯特 on 2021/3/8.
//

import Foundation

struct DateUtil {
    
    
    /// 标准日期格式化为 年月日时分秒
    /// - Parameter date: 日期时间
    /// - Returns: 日期时间字符串
    static func defaultDate2String(_ date: Date?) -> String {
        guard date != nil else { return "" }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: date!)
    }
    
}
