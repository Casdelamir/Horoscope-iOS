//
//  ViewController.swift
//  Horoscope-iOS
//
//  Created by Mañanas on 29/7/24.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
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
}

