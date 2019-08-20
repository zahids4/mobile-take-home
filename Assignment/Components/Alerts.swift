//
//  Alerts.swift
//  Assignment
//
//  Created by Saim Zahid on 2019-08-20.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import UIKit

func getNetworkErrorAlert() -> UIAlertController {
    let alert = UIAlertController(title: "Network Error", message: "Could not connect to the server, please try again later.", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
    return alert
}


func getLoaderAlert() -> UIAlertController {
    let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
    
    let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
    loadingIndicator.hidesWhenStopped = true
    loadingIndicator.style = UIActivityIndicatorView.Style.gray
    loadingIndicator.startAnimating();
    
    alert.view.addSubview(loadingIndicator)
    
    return alert
}

