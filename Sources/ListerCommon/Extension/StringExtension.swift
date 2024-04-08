//
//  StringExtension.swift
//
//  Created by 李斯特 on 2021/3/10.
//

import Foundation

extension String {
  
  /// 国际化的拓展
  /// 默认情况下所匹配的标记会自动根据当前语言环境从 Localizable.strings 文件中
  /// 获取对应的实际显示文案，不需要使用 localizedString 计算属性
  /// 但实际测试下来有一些情况不会自己获取，比如 拼接字符串的情况和不直接使用在UI上的，所以这几种情况需要使用这个扩展属性
  public var localizedString: String {
    get{
      return NSLocalizedString(self, comment: self)
    }
  }
  
  
  /// api 中的字符串截取 使用起来太复杂了
  /// 所以扩展了一个
  ///
  /// - Parameters:
  ///   - from: from description
  ///   - to: to description
  /// - Returns: description
  public func substring(from: Int, to: Int) -> String {
    let start = index(startIndex, offsetBy: from)
    let end = index(start, offsetBy: to - from)
    return String(self[start ..< end])
  }
  
  var isNotEmpty: Bool {
    return !self.isEmpty
  }
  
}

