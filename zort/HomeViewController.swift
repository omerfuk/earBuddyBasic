//
//  ViewController.swift
//  zort
//
//  Created by Ömer Faruk Kılıçaslan on 24.06.2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    
    var musicList = [WelcomeElement]()
    
    let url = "https://jsonplaceholder.typicode.com/albums"
    


    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        getAllData(URL: url) { result in
            self.musicList = result
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }



}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MusicTableViewCell
        cell.titleLabel.text = musicList[indexPath.row].title
        
        return cell
    }
}
