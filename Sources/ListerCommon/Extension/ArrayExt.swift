//
//  File.swift
//  
//
//  Created by 李斯特 on 2024/4/8.
//

import Foundation

extension Array {
  // 去重
  func filterDuplicates<E: Equatable>(_ filter: (Element) -> E) -> [Element] {
    var result = [Element]()
    for value in self {
      let key = filter(value)
      if !result.map({filter($0)}).contains(key) {
        result.append(value)
      }
    }
    return result
  }
  
  var isNotEmpty: Bool {
    return !isEmpty
  }
}
