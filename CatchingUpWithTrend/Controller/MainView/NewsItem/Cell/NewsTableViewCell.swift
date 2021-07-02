//
//  NewsTableViewCell.swift
//  CatchingUpWithTrend
//
//  Created by Nguyen Huu Thao on 6/29/21.
//

import UIKit
import LinkPresentation
class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsSource: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var LinkPreviewContainer: UIView!
//    let linkView = LPLinkView()
   
    var newsItem : newsItem?
       
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        setPreviewToContainer()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setData()  {
        guard let newsItem = newsItem else {
            return
        }
   
        newsTitle.text = newsItem.itemTitle
        newsSource.text = newsItem.itemSource
        getImagePreview(url: URL(string: newsItem.itemURL)!)
    }
    func setPreviewToContainer()  {

    }
    func getImagePreview(url :URL)  {
//        let provider = LPMetadataProvider()
//        provider.startFetchingMetadata(for: url) { (metaData, error) in
//            guard let data = metaData, error == nil else{
//                print("error \(String(describing: error))")
//                return
//            }
//            DispatchQueue.main.async { [weak self] in
//
//                self?.linkView.metadata = data
//
//            }
//
//        }
    }
    
}
