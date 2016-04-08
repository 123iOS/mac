//
//  MSHomeNoLoginViewController.swift
//  matchScore
//
//  Created by Triyakom PT on 4/7/16.
//  Copyright © 2016 Triyakom PT. All rights reserved.
//

import UIKit

class MSHomeNoLoginViewController: UIViewController {

    @IBOutlet weak var live_home_bg: UIImageView!
    @IBOutlet weak var live_home_name: UILabel!
    @IBOutlet weak var live_home_score: UILabel!
    @IBOutlet weak var live_away_img: UIImageView!
    @IBOutlet weak var live_away_name: UILabel!
    @IBOutlet weak var live_away_score: UILabel!
    
    @IBOutlet weak var upc_home_img: UIImageView!
    @IBOutlet weak var upc_home_name: UILabel!
    @IBOutlet weak var upc_away_img: UIImageView!
    @IBOutlet weak var upc_away_name: UILabel!
    @IBOutlet weak var upc_date: UILabel!
    
    @IBOutlet weak var see_all_btn: UIButton!
    @IBOutlet weak var hadiah_btn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
