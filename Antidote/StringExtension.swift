//
//  StringExtension.swift
//  Antidote
//
//  Created by Dmytro Vorobiov on 08/10/15.
//  Copyright © 2015 dvor. All rights reserved.
//

import Foundation

extension String {
    init(localized: String, _ arguments: CVarArgType...) {
        let format = NSLocalizedString(localized, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: "")
        self.init(format: format, arguments: arguments)
    }

    init(localized: String, comment: String, _ arguments: CVarArgType...) {
        let format = NSLocalizedString(localized, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: comment)
        self.init(format: format, arguments: arguments)
    }

    func substringToByteLength(length: Int, encoding: NSStringEncoding) -> String {
        guard length > 0 else {
            return ""
        }

        var substring = self as NSString

        while substring.lengthOfBytesUsingEncoding(encoding) > length {
            let newLength = substring.length - 1

            guard newLength > 0 else {
                return ""
            }

            substring = substring.substringToIndex(newLength)
        }

        return substring as String
    }
}
