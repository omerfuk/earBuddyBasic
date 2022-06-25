//
//  WebService.swift
//  zort
//
//  Created by Ömer Faruk Kılıçaslan on 24.06.2022.
//

import UIKit

let urlBase = "https://jsonplaceholder.typicode.com/albums"

func getAllData(URL url:String, completion: @escaping ([WelcomeElement]) -> Void) {
    
    guard let url = URL(string: url) else { return }
    let session = URLSession.shared
    
    let dataTask = session.dataTask(with: url) { data, response, error in
        
        if data != nil && error == nil {
            
            do {
                let parsingData = try JSONDecoder().decode([WelcomeElement].self, from: data!)
                completion(parsingData)
                
            } catch  {
                    print("Parsing Error")
            }
        }
    }.resume()
    
    
}
