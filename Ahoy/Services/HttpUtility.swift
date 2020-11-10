//
//  HttpUtility.swift
//  Ahoy
//
//  Created by Gaurav Solanki on 09/11/20.
//  Copyright © 2020 Gaurav Solanki. All rights reserved.
//

/**
- This file will be used as genralized Network Class to call APIs.
- Here i have used "Generics" for all Response Model class and main HttpUtility file purpose is to get the data and pass on to respective classes...
*/

import Foundation

struct HttpUtility {
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T?)-> Void) {
        
        let request = URLRequest(url: requestUrl)
      
        URLSession.shared.dataTask(with: request) { (responseData, httpUrlResponse, error) in
            if(error == nil && responseData != nil && responseData?.count != 0)
            {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: responseData!)
                    _=completionHandler(result)
                }
                catch let error{
                    debugPrint("error occured while decoding = \(error)")
                }
            }

        }.resume()
        
    }

}

