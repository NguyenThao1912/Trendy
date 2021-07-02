//
//  PlayVideo.swift
//  CatchingUpWithTrend
//
//  Created by Nguyen Huu Thao on 6/30/21.
//

import UIKit
import youtube_ios_player_helper
class PlayVideo: UIViewController {
    var VideoID : String?

    @IBOutlet weak var videoPlayer: YTPlayerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let videoID = VideoID else {
            return
        }
        videoPlayer.load(withVideoId: videoID)
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
