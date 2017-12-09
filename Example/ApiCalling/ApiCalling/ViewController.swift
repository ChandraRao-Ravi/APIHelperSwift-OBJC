//
//  ViewController.swift
//  ApiCalling
//
//  Created by Chandra Rao on 04/12/17.
//  Copyright © 2017 Chandra Rao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        callgetApi()
    }
    
    func callgetApi() {
        
        APIHelper.sharedInstance.callGetApiWithMethod(withMethod: "", successHandler: { (dictData) in
            
            print(dictData)
            
        }) { (strMessage) in
            print(strMessage)
        }
        
    }
}

