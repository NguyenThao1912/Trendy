//
//  YoutubeCell.swift
//  CatchingUpWithTrend
//
//  Created by Nguyen Huu Thao on 6/30/21.
//

import UIKit

class YoutubeCell: UITableViewCell {
    var Profile : YoutubeChannel?
    //var YtVideo : ytItem?
    
    
    var channelID :String = ""

    @IBOutlet weak var ThumbNail        : UIImageView!
    @IBOutlet weak var ChannelImg       : UIImageView!
    @IBOutlet weak var VideoTitle       : UILabel!
    @IBOutlet weak var VideoDiscription : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ChannelImg.layer.borderWidth = 1.0
        ChannelImg.layer.masksToBounds = false
        ChannelImg.layer.borderColor = UIColor.white.cgColor
        ChannelImg.layer.cornerRadius = ChannelImg.frame.size.width / 2
        ChannelImg.clipsToBounds = true
    }
    func getChannelProfile(channelID : String){
    
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    func setData(YtVideo: ytItem?)  {
        let globalQueue = DispatchQueue.global(qos: .userInitiated)
        globalQueue.async {
            guard let videoData = YtVideo  else {
                print("invalid videoData")
                return }

            DispatchQueue.main.async {
                self.VideoTitle.text       = videoData.snippet.title
            }
        }
        
        globalQueue.async {
            if let url = YtVideo?.snippet.thumbnails.medium.url {
                API_Youtube.downloadImgFromURL(url: url) { (data, response, error) in
                    if let error = error{
                        print(error)
                        return
                    }
                    if let data = data {
                        DispatchQueue.main.async {
                            self.ThumbNail.image = UIImage(data: data)!
                        }
                      
                    }
                }
            }
        }
        
        globalQueue.async {
            API_Youtube.fetchChannelProfile(ChannelID: self.channelID) { (res) in
                switch res{
                case.success(let channelProfile):
                    let urlchannel = channelProfile.items[0].snippet.thumbnails.medium.url
                    let channeltitle = "\(channelProfile.items[0].snippet.title) "
                    API_Youtube.downloadImgFromURL(url: urlchannel) { (data, response, error) in
                        if let error = error {
                            print(error)
                            return
                        }
                        guard let data = data else {
                            return
                        }
                        DispatchQueue.main.async {
                            self.ChannelImg.image      = UIImage(data: data)!
                            self.VideoDiscription.text = channeltitle
                        }
                    }
                case .failure(let Error):
                    print(Error)
                }
            }
        }
        
 

    }
}
