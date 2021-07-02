//
//  ViewController.swift
//  CatchingUpWithTrend
//
//  Created by Nguyen Huu Thao on 6/25/21.
//

import UIKit
class ViewController: BaseViewController{
    
    @IBOutlet weak var tableView: UITableView!

    var trendItem : [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadTrendData()
    }
    func loadTrendData()  {
        Api_Trend.fetchData(url: Api_Trend.base_google_trend) { (data, error) in
            self.trendItem = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    override func setupUI() {
        print("setup UI")
        let trendCellNib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(trendCellNib, forCellReuseIdentifier: "trendCell")
        tableView.delegate      = self
        tableView.dataSource    = self
    }
    override func setupData() {
        print("setup Data")
        
    }
}
extension ViewController: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendItem.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trendCell", for: indexPath) as! Trend_TV_Cell
        cell.item = trendItem[indexPath.row]
        cell.parentController = self
        cell.setDataCell()
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row % 2 == 0 {
            let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
            cell.layer.transform = rotationTransform
            cell.alpha = 0.5
            UIView.animate(withDuration: 0.8) {
                cell.layer.transform = CATransform3DIdentity
                cell.alpha = 1
            }
        }
        else{
            let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 500, 10, 0)
            cell.alpha = 0.5
            cell.layer.transform = rotationTransform
            UIView.animate(withDuration: 0.8) {
                cell.alpha = 1
                cell.layer.transform = CATransform3DIdentity
            }
        }
    }
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.removeAllAnimations()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let youtubeController = YoutubeViewController()
        youtubeController.queryString = trendItem[indexPath.row].title
        self.navigationController?.pushViewController(youtubeController, animated: true)
    }
}

