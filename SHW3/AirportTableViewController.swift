//
//  AirportTableViewController.swift
//  SHW3
//
//  Created by Mac on 2017/5/13.
//  Copyright © 2017年 bjh. All rights reserved.
//

import UIKit

class AirportTableViewController: UITableViewController {
    var airports = AirportData.airportInCountry()
    let difcountry = AirportData.distinctCountry()
    static var selectAirport : [String:AnyObject] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return difcountry.count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return difcountry[section]
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return airports[section].count-1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "airportCell", for: indexPath)
        let airportName = cell.viewWithTag(1000) as! UILabel
        let airportIATA = cell.viewWithTag(1001) as! UILabel
        let airportCity = cell.viewWithTag(1002) as! UILabel
        airportName.text = airports[indexPath.section][indexPath.row]["Airport"] as? String
        airportIATA.text = airports[indexPath.section][indexPath.row]["IATA"] as? String
        airportCity.text = airports[indexPath.section][indexPath.row]["ServedCity"] as? String
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        AirportTableViewController.selectAirport = airports[indexPath.section][indexPath.row]
        
    }


}
