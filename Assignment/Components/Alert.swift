//
//  Alert.swift
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
