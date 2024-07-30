//
//  ViewController.swift
//  Horoscope-iOS
//
//  Created by Mañanas on 29/7/24.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        //Delegate is not needed if the segue is done from the cell. Is only needed when the segue is done from the view manual segue.
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        HoroscopeProvider.horoscopes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        // Configure the cell
        let horoscope = HoroscopeProvider.horoscopes[indexPath.row]
        cell.icon.image = horoscope.image
        cell.name.text = horoscope.name
        cell.date.text = horoscope.dateRange
        
        return cell
    }
    // This method uses delagete and means that segue will be ejecuted when cell is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDailyHoroscope", sender: indexPath)
    }
    //This method can be used alone if the segue is done from the cell to the new view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDailyHoroscope" {
            let destinationVC = segue.destination as! DailyHoroscopeViewController
            let indexPath = sender as! IndexPath
            destinationVC.horoscope = HoroscopeProvider.horoscopes[indexPath.row]
        }
    }
}

