//
//  String.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 21.02.2022.
//

import Foundation
import UIKit

extension String {
    func format(with mask: String) -> String {
        let numbers = self.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                result.append(numbers[index])
                index = numbers.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
}

extension String {
    
    func attributed(font: UIFont = Fonts.regular(), color: UIColor = .black, line: Bool = false, link: String? = nil) -> NSAttributedString {
        var attr: [NSAttributedString.Key:Any] = [NSAttributedString.Key.font: font,
                                                  NSAttributedString.Key.foregroundColor: color]
        if line {
            attr[NSAttributedString.Key.underlineStyle] = NSUnderlineStyle.single.rawValue
        }
        if let link = link {
            attr[NSAttributedString.Key.link] = link
        }
        return NSAttributedString(string: self, attributes: attr)
    }
    
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
    
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
    
    func chopPrefix(_ count: Int = 1) -> String {
        if count >= 0 && count <= self.count {
            let indexStartOfText = self.index(self.startIndex, offsetBy: count)
            return String(self[indexStartOfText...])
        }
        return ""
    }

    func chopSuffix(_ count: Int = 1) -> String {
        if count >= 0 && count <= self.count {
            let indexEndOfText = self.index(self.endIndex, offsetBy: -count)
            return String(self[..<indexEndOfText])
        }
        return ""
    }
    
    func getFormattedData(getDateFormat: String) -> String {
        var finalDate = ""
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = getDateFormat
        let date: Date? = dateFormatterGet.date(from: self)
        if let date = date {
            finalDate = dateFormatterPrint.string(from: date)
        } else {
            let format = DateFormatter()
            format.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
            let date: Date? = format.date(from: self)
            finalDate = dateFormatterPrint.string(from: date!)
        }
        return finalDate
    }

    func getData(withFormat format: String = "yyyy-MM-dd'T'HH:mm:ssZ")-> Date?{

        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tehran")
        dateFormatter.locale = Locale(identifier: "fa-IR")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)

        return date

    }
    
    func utf8DecodedString()-> String {
        let data = self.data(using: .utf8)
        let message = String(data: data!, encoding: .nonLossyASCII) ?? ""
        return message
    }
}


extension Date {
    func asString(style: DateFormatter.Style) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = style
        return dateFormatter.string(from: self)
    }
}

extension UIViewController {
    func getEventDate(data: String) -> String?{
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatter.date(from: data) else { return "Emty Data" }
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        dateFormatter.locale = tempLocale // reset the locale
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}


