//
//  Horoscope.swift
//  Horoscope-iOS
//
//  Created by Mañanas on 29/7/24.
//

import Foundation
import UIKit

struct Horoscope {
    let id: String
    let name: String
    let dateRange: String
    let imageName: String

    // Computed property to get UIImage from assets
    var image: UIImage? {
        return UIImage(named: imageName)
    }
}
