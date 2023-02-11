//
//  String+Extensions.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 05/02/23.
//

import Foundation
import CommonCrypto

extension String {
    
    // TableViewCells
    static let titleTableViewCell = "TitleTableViewCell"
    static let tableTypeCell = "TableTypeCell"
    static let heroCollectionTypeTableViewCell = "HeroCollectionTypeTableViewCell"
    static let heroTableTypeTableViewCell = "HeroTableTypeTableViewCell"
    static let heroOverviewTableViewCell = "HeroOverviewTableViewCell"
    static let heroDescriptionTableViewCell = "HeroDescriptionTableViewCell"
    
    // CollectionViewCells
    static let dynamicHeroCollectionViewCell = "DynamicHeroCollectionViewCell"
    static let collectionTypeCell = "CollectionTypeCell"
    
    // Views
    static let heroNameView = "HeroNameView"
    static let titleHeaderView = "TitleHeaderView"
    static let heroHeaderView = "HeroHeaderView"
    static let heroDescriptionView = "HeroDescriptionView"
    static let heroOverviewView = "HeroOverviewView"
    static let heroCollectionTypeView = "HeroCollectionTypeView"
    static let heroTableTypeView = "HeroTableTypeView"
    
    // ViewControllers
    static let heroViewController = "HeroViewController"
    
    // Scenes
    static let heroScene = "HeroScene"
    
    func localizedString() -> String {
        guard let fallbackBundlePath = Bundle.main.path(forResource: "en", ofType: "lproj") else { return self }
        guard let fallbackBundle = Bundle(path: fallbackBundlePath) else { return self }
        let fallbackString = fallbackBundle.localizedString(forKey: self, value: nil, table: nil)
        return Bundle.main.localizedString(forKey: self, value: fallbackString, table: nil)
    }
    
    func toHTTPS() -> String {
        self.replacingOccurrences(of: "http", with: "https")
    }
}


extension String {
    func toHash() -> String {
        let data = Data(self.utf8)
        let hash = data.withUnsafeBytes { (bytes: UnsafeRawBufferPointer) -> [UInt8] in
            var hash = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
            CC_MD5(bytes.baseAddress, CC_LONG(data.count), &hash)
            return hash
        }
        return hash.map { String(format: "%02x", $0) }.joined()
    }
}
