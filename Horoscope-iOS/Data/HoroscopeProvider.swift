//
//  HoroscopeProvider.swift
//  Horoscope-iOS
//
//  Created by Mañanas on 29/7/24.
//

import Foundation

// Class to provide horoscope data
class HoroscopeProvider {

    // Static list of horoscopes
    static let horoscopes: [Horoscope] = [
        Horoscope(id: "1", name: "Aries", dateRange: "March 21 - April 19", imageName: "horoscope_icons/aries"),
        Horoscope(id: "2", name: "Taurus", dateRange: "April 20 - May 20", imageName: "horoscope_icons/taurus"),
        Horoscope(id: "3", name: "Gemini", dateRange: "May 21 - June 20", imageName: "horoscope_icons/gemini"),
        Horoscope(id: "4", name: "Cancer", dateRange: "June 21 - July 22", imageName: "horoscope_icons/cancer"),
        Horoscope(id: "5", name: "Leo", dateRange: "July 23 - August 22", imageName: "horoscope_icons/leo"),
        Horoscope(id: "6", name: "Virgo", dateRange: "August 23 - September 22", imageName: "horoscope_icons/virgo"),
        Horoscope(id: "7", name: "Libra", dateRange: "September 23 - October 22", imageName: "horoscope_icons/libra"),
        Horoscope(id: "8", name: "Scorpio", dateRange: "October 23 - November 21", imageName: "horoscope_icons/scorpio"),
        Horoscope(id: "9", name: "Sagittarius", dateRange: "November 22 - December 21", imageName: "horoscope_icons/sagittarius"),
        Horoscope(id: "10", name: "Capricorn", dateRange: "December 22 - January 19", imageName: "horoscope_icons/capricorn"),
        Horoscope(id: "11", name: "Aquarius", dateRange: "January 20 - February 18", imageName: "horoscope_icons/aquarius"),
        Horoscope(id: "12", name: "Pisces", dateRange: "February 19 - March 20", imageName: "horoscope_icons/pisces")
    ]

    // Method to retrieve horoscope by ID
    static func horoscope(forId id: String) -> Horoscope? {
        return horoscopes.first(where: { $0.id == id })
    }
}
