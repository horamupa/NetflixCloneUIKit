//
//  Extension.swift
//  NetflixCloneUIKit
//
//  Created by MM on 28.06.2023.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
