//
//  HomeGetApiRequest.swift
//  FaceLook
//
//  Created by shoeb on 14/01/23.
//

import UIKit

protocol HomeGetApiRequestDelegate : NSObjectProtocol{
    func didReceivedHomeApiData(homeApiModel : [HomeApiModel])
    func didReceivedError()
}

class HomeGetApiRequest: NSObject, URLSessionDelegate, URLSessionDownloadDelegate {
    
    weak var delegate : HomeGetApiRequestDelegate?
    var bufferData : Data?
    var session : URLSession{
        let defualtConfig = URLSessionConfiguration.default
        defualtConfig.requestCachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
        return URLSession(configuration: defualtConfig, delegate: self, delegateQueue: nil)
    }
    
    func fetchData(){
        let url = URL(string: "https://reqres.in/api/users?page=1")
        let task = session.downloadTask(with: url!)
        task.resume()
        }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        do{
            bufferData = try Data(contentsOf: location)
            let jsonConvert = try JSONSerialization.jsonObject(with: bufferData!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String : Any]
            let dataOBJ = jsonConvert["data"] as! [[String : Any]]
            var EmptyARR : [HomeApiModel] = []
            for i in 0..<jsonConvert.count{
                let getData = HomeApiModel(dictionary: dataOBJ[i])
                EmptyARR.append(getData)
            }
            DispatchQueue.main.async {
                self.delegate?.didReceivedHomeApiData(homeApiModel: EmptyARR)
            }
        }
        catch{
            delegate?.didReceivedError()
        }
    }
    

}
