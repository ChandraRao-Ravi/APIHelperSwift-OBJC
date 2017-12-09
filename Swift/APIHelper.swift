//
//  APIHelper.swift
//  ApiCalling
//
//  Created by Chandra Rao on 04/12/17.
//  Copyright © 2017 Chandra Rao. All rights reserved.
//

import UIKit

class APIHelper: NSObject {

    // MARK: - Shared Instance
    
    static let sharedInstance: APIHelper = {
        let instance = APIHelper()
        // setup code
        return instance
    }()
    
    // MARK: - Initialization Method
    
    override init() {
        super.init()
    }
    
    func callGetApiWithMethod(withMethod methodName: String, successHandler: @escaping (_ dictData: NSDictionary) -> Void, failureHandler: @escaping (_ strMessage: String) -> Void) {
        
        let urlString = Constants.BASEURL + methodName
        let stringEncode = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        let myURL = NSURL(string: stringEncode!)!
        let request = NSMutableURLRequest(url: myURL as URL)
        request.httpMethod = Constants.HTTPMethodGet
        
        request.setValue(Constants.ContentTypeJSON, forHTTPHeaderField: Constants.AcceptKey)
        request.setValue(Constants.ContentTypeJSON, forHTTPHeaderField: Constants.ContentType)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            print(response!)
            // Your completion handler code here
            let responseString = String(data: data!, encoding: .utf8)
            
            if  let dict1 = responseString?.convertToDictionary() as? NSDictionary {
                successHandler(dict1)
            } else {
                failureHandler("Some error occured")
            }
            
        }
        task.resume()
    }
}
