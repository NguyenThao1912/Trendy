//
//  TableViewCell.swift
//  CatchingUpWithTrend
//
//  Created by Nguyen Huu Thao on 6/29/21.
//

import UIKit

class Trend_TV_Cell: UITableViewCell {
    @IBOutlet weak var trendTitle: UILabel!
    @IBOutlet weak var trendIMG: UIImageView!
    @IBOutlet weak var trendDescription: UILabel!
    @IBOutlet weak var trendPictureSource: UILabel!
    @IBOutlet weak var trendAppoxTraffic: UILabel!
    @IBOutlet weak var trendPubdate: UILabel!
    
    var item : Item?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func DidTapYoutube(_ sender: Any) {
        print("Tap Youtube Button")
    }
    
    @IBAction func DidTapNews(_ sender: Any) {
        print("Tap News Button")
    }
    func setDataCell()  {
        guard let item = item else {
            print("Cell is empty")
            return
        }
   
        trendTitle.text         = item.title
        trendDescription.text   = item.description
        trendPictureSource.text = item.picture_source
        trendAppoxTraffic.text  = item.approx_traffic
        trendPubdate.text       = item.pubDate
        
    }
}
