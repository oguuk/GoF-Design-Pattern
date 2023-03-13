//
//  Downloader.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/13.
//

import UIKit

struct Downloader {
    
    func fetch(url: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: url) else { return }
        let configure = URLSessionConfiguration.default
        let session = URLSession(configuration: configure)
        let dataTask = session.dataTask(with: url) { data, response, error in
            if error != nil { return }
            completion(data)
        }
        dataTask.resume()
    }
    
}
