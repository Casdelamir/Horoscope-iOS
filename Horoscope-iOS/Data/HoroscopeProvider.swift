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
        Horoscope(id: "aries", name: "Aries", dateRange: "March 21 - April 19", imageName: "horoscope_icons/aries"),
        Horoscope(id: "taurius", name: "Taurus", dateRange: "April 20 - May 20", imageName: "horoscope_icons/taurus"),
        Horoscope(id: "Gemini", name: "Gemini", dateRange: "May 21 - June 20", imageName: "horoscope_icons/gemini"),
        Horoscope(id: "Cancer", name: "Cancer", dateRange: "June 21 - July 22", imageName: "horoscope_icons/cancer"),
        Horoscope(id: "Leo", name: "Leo", dateRange: "July 23 - August 22", imageName: "horoscope_icons/leo"),
        Horoscope(id: "Virgo", name: "Virgo", dateRange: "August 23 - September 22", imageName: "horoscope_icons/virgo"),
        Horoscope(id: "Libra", name: "Libra", dateRange: "September 23 - October 22", imageName: "horoscope_icons/libra"),
        Horoscope(id: "Scorpio", name: "Scorpio", dateRange: "October 23 - November 21", imageName: "horoscope_icons/scorpio"),
        Horoscope(id: "Sagittarius", name: "Sagittarius", dateRange: "November 22 - December 21", imageName: "horoscope_icons/sagittarius"),
        Horoscope(id: "Capricorn", name: "Capricorn", dateRange: "December 22 - January 19", imageName: "horoscope_icons/capricorn"),
        Horoscope(id: "Aquarius", name: "Aquarius", dateRange: "January 20 - February 18", imageName: "horoscope_icons/aquarius"),
        Horoscope(id: "Pisces", name: "Pisces", dateRange: "February 19 - March 20", imageName: "horoscope_icons/pisces")
    ]

    // Method to retrieve horoscope by ID
    static func horoscope(forId id: String) -> Horoscope? {
        return horoscopes.first(where: { $0.id == id })
    }
    
    static func getHoroscopeLuck(horoscopeId: String) async throws -> String {
        var result: String
        let url = URL(string: "https://horoscope-app-api.vercel.app/api/v1/get-horoscope/daily?sign=\(horoscopeId)&day=TODAY")
        
        guard let url = url else {
            throw RuntimeError("No url provided")
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
                throw HoroscopeError.httpError(statusCode: 0) // Non-HTTP response
            }
            
            guard httpResponse.statusCode == 200 else {
                throw HoroscopeError.httpError(statusCode: httpResponse.statusCode)
            }
        
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            throw RuntimeError("JSON parse exception")
        }
        
        let jsonData = json["data"] as? [String: String]
        
        result = jsonData?["horoscope_data"] ?? ""
        
        return result
    }
    
    // MARK: Utils
    
    struct RuntimeError: Error {
        let description: String

        init(_ description: String) {
            self.description = description
        }
    }
    
    // HoroscopeErrors.swift

    enum HoroscopeError: Error {
        case invalidURL
        case httpError(statusCode: Int)
        case jsonParseError
        case missingData
    }

}
