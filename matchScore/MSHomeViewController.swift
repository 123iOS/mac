//
//  MSHomeViewController.swift
//  matchScore
//
//  Created by Triyakom PT on 4/6/16.
//  Copyright © 2016 Triyakom PT. All rights reserved.
//

import UIKit

class MSHomeViewController: UIViewController {

    @IBOutlet weak var user_period: UILabel!
    @IBOutlet weak var user_ranking: UILabel!
    @IBOutlet weak var user_points: UILabel!
    @IBOutlet weak var user_name: UILabel!
    @IBOutlet weak var user_image: UIImageView!
    
    @IBOutlet weak var live_home_image: UIImageView!
    @IBOutlet weak var live_away_image: UIImageView!
    @IBOutlet weak var live_home_name: UILabel!
    @IBOutlet weak var live_away_name: UILabel!
    @IBOutlet weak var live_home_score: UILabel!
    @IBOutlet weak var live_away_score: UILabel!
    
    @IBOutlet weak var upcome_home_img: UIImageView!
    @IBOutlet weak var upcome_away_img: UIImageView!
    @IBOutlet weak var upcome_home_name: UILabel!
    @IBOutlet weak var upcome_away_name: UIImageView!
    @IBOutlet weak var upcome_match_date: UILabel!
    @IBOutlet weak var upcome_progressbar: UIProgressView!
    
    @IBOutlet weak var user_predict_btn: UIButton!
    @IBOutlet weak var user_stats_btn: UIButton!
    @IBOutlet weak var live_all_matches: UIButton!
    @IBOutlet weak var upcome_hadiah_btn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.operateAllButtons()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func operateAllButtons() {
        user_predict_btn.addTarget(self, action: "didTappedFirstButton", forControlEvents: .TouchUpInside)
        
        user_stats_btn.addTarget(self, action: "tappedScondBtn", forControlEvents: .TouchUpInside)
        
        live_all_matches.addTarget(self, action: "tappedThirdBtn", forControlEvents: .TouchUpInside)
    }
    
    func didTappedFirstButton() {
        //Current Code, default colour is black
        print("PREDICTION TAPPED..!!!");
        let upcomingVC:UIViewController = MSUpcomingViewController()
        self.navigationController?.pushViewController(upcomingVC, animated: true)
        
    }
    func tappedScondBtn() {
        print("IT's STATISTICS..!!!")
    }
    func tappedThirdBtn() {
        print("LET's SEE ALL MATCHES..!!!")
    }
    

}
