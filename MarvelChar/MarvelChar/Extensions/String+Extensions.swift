//
//  String+Extensions.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 05/02/23.
//

import Foundation

extension String {
    func localizedString() -> String {
        NSLocalizedString(self,
                          tableName: "Localizable",
                          bundle: .main,
                          value: self,
                          comment: self)
    }
}
