//
//  HoroscopeDetailsViewController.swift
//  Horoscope-iOS
//
//  Created by Mañanas on 30/7/24.
//

import Foundation
import UIKit


class DailyHoroscopeViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var prediction: UILabel!
    
    var horoscope: Horoscope?
    
    override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
            loadData()
        }
    
    
    func loadData() {
            
            image.image = horoscope?.image
            name.text = horoscope?.name
            
            getHoroscopeLuck()
        }
        
        func getHoroscopeLuck() {
            Task {
                do {
                    let luck = try await HoroscopeProvider.getHoroscopeLuck(horoscopeId: horoscope!.id)
                    
                    prediction.text = luck
                } catch {
                    print(error)
                }
            }
        }
}
