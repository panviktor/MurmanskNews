//
//  ViewController.swift
//  MurmanskNews
//
//  Created by Viktor on 02.11.2020.
//

import UIKit

class ViewController: UIViewController {
    var model: MainData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https://murmansk.travel/api/trips") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let data = try JSONDecoder().decode(MainData.self, from: data)
                        print(data.post)
                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        }
    }
}

