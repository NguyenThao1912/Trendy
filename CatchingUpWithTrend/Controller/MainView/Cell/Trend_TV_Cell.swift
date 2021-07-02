//
//  TableViewCell.swift
//  CatchingUpWithTrend
//
//  Created by Nguyen Huu Thao on 6/29/21.
//

import UIKit

class Trend_TV_Cell: UITableViewCell {
    
    @IBOutlet weak var trendTitle           : UILabel!
    @IBOutlet weak var trendIMG             : UIImageView!
    @IBOutlet weak var trendDescription     : UILabel!
    @IBOutlet weak var trendPictureSource   : UILabel!
    @IBOutlet weak var trendAppoxTraffic    : UILabel!
    @IBOutlet weak var trendPubdate         : UILabel!
    var parentController : UIViewController?
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
        let youtubeController = YoutubeViewController()
        guard let item = item else {
            print("Cell is empty DID TAP YOUTUBE BUTOTN")
            return
        }
        
        youtubeController.queryString = item.title
        self.parentController?.navigationController?.pushViewController(youtubeController, animated: true)
    }
    
    @IBAction func DidTapNews(_ sender: Any) {
        print("Tap News Button")
        let news  = NewsItemController()
        if let newsItem = item?.newsItem{
            news.newsItem = newsItem
        }

        parentController?.navigationController?.pushViewController(news, animated: true)
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
        trendPubdate.text       = "\(getHourDiff(pubDate: item.pubDate)) giờ trước"
        if let image = item.picture {
            downloadImage(from :URL(string: image)!)
        }
       
        
    }
    func getHourDiff(pubDate:String) -> Int{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
        let datePub = dateFormatter.date(from: pubDate)
        guard let newsDate = datePub else{
            return -1
        }
        let time = Date(timeIntervalSince1970: Date().timeIntervalSince1970 - newsDate.timeIntervalSince1970)
        let hour = time.get(.hour)
        return hour
    }
    func downloadImage(from url: URL) {
        Api_Trend.getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            //print(response?.suggestedFilename ?? url.lastPathComponent)
            // always update the UI from the main thread
            DispatchQueue.main.async() { [weak self] in
                self?.trendIMG.image = UIImage(data: data)
            }
        }
    }

}
extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}
