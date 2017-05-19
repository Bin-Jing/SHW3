//
//  AirportContentViewController.swift
//  SHW3
//
//  Created by Mac on 2017/5/18.
//  Copyright © 2017年 bjh. All rights reserved.
//

import UIKit
class AirportContentViewController: UIViewController {

    @IBOutlet weak var airportContent: UILabel!
    @IBOutlet weak var countryContent: UILabel!
    @IBOutlet weak var cityContent: UILabel!
    @IBOutlet weak var airportContentTitle: UINavigationItem!
    
    @IBOutlet weak var airportImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        airportContentTitle.title = AirportTableViewController.selectAirport["IATA"] as? String
        airportContent.lineBreakMode = NSLineBreakMode.byWordWrapping
        airportContent.numberOfLines = 3
        airportContent.text = AirportTableViewController.selectAirport["Airport"] as? String
        airportImage.image = UIImage(named: "\(AirportTableViewController.selectAirport["IATA"] as! String).jpg")
        countryContent.text = AirportTableViewController.selectAirport["Country"] as? String
        cityContent.text = AirportTableViewController.selectAirport["ServedCity"] as? String
        
        
    }
    static func reloadView(){

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
