//
//  String+Ext.swift
//  GHFollowers
//
//  Created by Juan Diego Ocampo on 14/08/2022.
//

import Foundation

extension String {
    
    var convertedToDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current
        return dateFormatter.date(from: self)
    }

    var isValidEmail: Bool {
        let emailFormat         = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate      = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }

    var isValidPassword: Bool {
        let passwordFormat      = "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}"
        let passwordPredicate   = NSPredicate(format: "SELF MATCHES %@", passwordFormat)
        return passwordPredicate.evaluate(with: self)
    }

    var isValidPhoneNumber: Bool {
        let phoneNumberFormat = "^\\d{3}-\\d{3}-\\d{4}$"
        let numberPredicate = NSPredicate(format: "SELF MATCHES %@", phoneNumberFormat)
        return numberPredicate.evaluate(with: self)
    }
    
    func removeWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
    
    func convertToDisplayFormat() -> String {
        guard let date = self.convertedToDate else { return "UNKNOWN_SIGN_UP_DATE" }
        return "JOINED_ON " + date.formattedAsMonthYear
    }
    
}
