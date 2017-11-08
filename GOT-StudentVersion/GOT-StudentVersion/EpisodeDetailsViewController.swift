//
//  EpisodeDetailsViewController.swift
//  GOT-StudentVersion
//
//  Created by Keshawn Swanston on 11/3/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class EpisodeDetailsViewController: UIViewController {

    var episode: GOTEpisode?
    
    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeName: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeNumLabel: UILabel!
    @IBOutlet weak var runTimeLabel: UILabel!
    @IBOutlet weak var airDateLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let episode = episode else {
            return
        }
        self.episodeImage.image = UIImage(named: episode.originalImageID)
        self.episodeName.text = episode.name
        self.seasonLabel.text = "Season: \(episode.season)"
        self.episodeNumLabel.text = "Episode: \(episode.number)"
        self.runTimeLabel.text = "RunTime: \(episode.runtime)"
        self.airDateLabel.text = "Airdate: \(episode.airdate)"
        self.summaryTextView.text = episode.summary
        

        
    }

  
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
