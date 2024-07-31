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
    
    @IBOutlet weak var prediction: UITextView!
    
    @IBOutlet weak var load: UIActivityIndicatorView!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    var defaults: UserDefaults!
    
    var fullHeard: UIImage!
    
    var heard: UIImage!
    
    var horoscope: Horoscope?
    
    override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
        defaults = UserDefaults.standard
        
        fullHeard = UIImage(systemName: "heart.fill")
        heard = UIImage(systemName: "heart")
        
        loadData()
        
        }
    
    
    func loadData() {
            
            image.image = horoscope?.image
            name.text = horoscope?.name
        getHoroscopeLuck(date: "daily")
        
        if defaults.string(forKey: "favorite") == horoscope?.id {
                favoriteButton.setImage(fullHeard, for: .normal)
            }
        }
    
    func getHoroscopeLuck(date: String) {
            Task {
                do {
                    load.startAnimating()
                    prediction.isHidden = true
                    let luck = try await HoroscopeProvider.getHoroscopeLuck(horoscopeId: horoscope!.id, date: date)
                    
                    prediction.text = luck
                    load.stopAnimating()
                    load.isHidden = true
                    prediction.isHidden = false
                    
                } catch {
                    print(error)
                }
            }
        }

    
    @IBAction func clickButtonFavorite(_ sender: UIButton) {
        if defaults.string(forKey: "favorite") == horoscope?.id {
            defaults.removeObject(forKey: "favorite")
            sender.setImage(heard, for: .normal)
            print("Item unmarked as favorite")
        } else {
            defaults.set(horoscope?.id, forKey: "favorite")
            sender.setImage(fullHeard, for: .normal)
            print("Item marked as favorite")
        }
    }

    @IBAction func clickOnDaily(_ sender: UIBarButtonItem) {
        getHoroscopeLuck(date: "daily")
    }
    
    @IBAction func clickOnWeekly(_ sender: UIBarButtonItem) {
        getHoroscopeLuck(date: "weekly")
    }
    
    @IBAction func clickOnMothly(_ sender: UIBarButtonItem) {
        getHoroscopeLuck(date: "monthly")
    }
    
}
