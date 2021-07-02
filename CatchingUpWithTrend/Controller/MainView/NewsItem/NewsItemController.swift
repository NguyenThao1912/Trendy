//
//  NewsItemController.swift
//  CatchingUpWithTrend
//
//  Created by Nguyen Huu Thao on 6/29/21.
//

import UIKit

class NewsItemController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    var newsItem: [newsItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "List News"
        // Do any additional setup after loading the view.
    }
    override func setupData() {
        
    }
    override func setupUI() {
        tableView.delegate   = self
        tableView.dataSource = self
        
        let newsCellNib = UINib(nibName: "NewsTableViewCell", bundle: nil)
        tableView.register(newsCellNib, forCellReuseIdentifier: "newsCell")
    }
}
extension NewsItemController :  UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItem.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        cell.newsItem = newsItem[indexPath.row]
        cell.setData()
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let urlstring = newsItem[indexPath.row].itemURL else {
            return
        }
        if let url = URL(string: urlstring) {
            UIApplication.shared.open(url)
        }
    }
}
