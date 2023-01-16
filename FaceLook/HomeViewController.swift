//
//  HomeViewController.swift
//  FaceLook
//
//  Created by shoeb on 14/01/23.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, HomeGetApiRequestDelegate {
    
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var homeSearchBar: UISearchBar!
    var homeDataModel : [HomeApiModel]!
    var filterData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let parse = HomeGetApiRequest()
        parse.fetchData()
        parse.delegate = self
    }
    
    func loadTableView() {
        homeTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeDataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeTableCell = homeTableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        let rows = homeDataModel[indexPath.row]
        homeTableCell.idTXT.text = "\(rows.id!)"
        homeTableCell.firstNameTXT.text = rows.first_name
        homeTableCell.lastNameTXT.text = rows.last_name
        homeTableCell.emailTXT.text = rows.email
        
        return homeTableCell
    }
    func didReceivedHomeApiData(homeApiModel: [HomeApiModel]) {
        self.homeDataModel = homeApiModel
        loadTableView()
    }
    
    func didReceivedError() {
        print("Error")
    }
    
}
//Image Load Function Here
class CustomImageView : UIImageView{
    func loadImage(url : URL){
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data = data, let imageView = UIImage(data: data) else {
                print("Error")
                return
            }
            DispatchQueue.main.async {
                self.image = imageView
            }
        }
        task.resume()
    }
}
