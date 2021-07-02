//
//  YoutubeViewController.swift
//  CatchingUpWithTrend
//
//  Created by Nguyen Huu Thao on 6/29/21.
//

import UIKit

class YoutubeViewController: BaseViewController {
    
    var youtubeResponse : YoutubeResponse?
    var queryString     : String?
//  {
//        didSet{
//            guard let query = queryString else { return  }
//            LoadData(queryString: query)
//        }
//  }
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    override func setupUI() {
        tableView.delegate      = self
        tableView.dataSource    = self
        tableView.register(UINib(nibName: "YoutubeCell", bundle: nil), forCellReuseIdentifier: "YoutubeCell")
        self.title = "Youtube Video"

    }
    
    func fetchSearchResult(queryString : String?, completion :  @escaping ((_ :YoutubeResponse) -> ()))  {
        print("fetch Search Result YT API")
        guard let queryString = queryString else {
            return
        }
        API_Youtube.fetchData(queryString: queryString) { (res) in
                switch res{
                case.success(let SearchResult):
                    //self.youtubeResponse = SearchResult
                    print("Get Data Search Youtube Result SUCCESS \(SearchResult.items.count)")
                    completion(SearchResult)
                case .failure(let Error):
                    print(Error)
            }
           
        }
    }

    
    func initUI(){
       // self.youtubeResponse = data
        fetchSearchResult(queryString: queryString) { (YoutubeResponse) in
            self.youtubeResponse = YoutubeResponse
            
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
        
    }
   
 
}
extension YoutubeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let ytresponse = youtubeResponse else {
            return 0
        }
        return ytresponse.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YoutubeCell", for: indexPath) as!  YoutubeCell
       // cell.YtVideo = youtubeResponse?.items[indexPath.row]
        cell.channelID = self.youtubeResponse?.items[indexPath.row].snippet.channelID ?? ""
        cell.setData(YtVideo:self.youtubeResponse?.items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playerController = PlayVideo()
        playerController.VideoID = youtubeResponse?.items[indexPath.row].id.videoID
        navigationController?.pushViewController(playerController, animated: true)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0.1
        UIView.animate(withDuration: 1.0) {
            cell.alpha = 1
        }
    }
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.removeAllAnimations()
    }
}

