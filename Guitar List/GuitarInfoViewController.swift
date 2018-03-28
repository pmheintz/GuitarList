//
//  GuitarInfoViewController.swift
//  Guitar List
//
//  Created by Paul Heintz on 3/27/18.
//  Copyright © 2018 Paul Heintz. All rights reserved.
//

import UIKit
import WebKit

class GuitarInfoViewController: UIViewController, WKUIDelegate {
    var guitar: String?
    var webView: WKWebView!
    var guitarInfo: [String: String] = [
        "Les Paul": "https://en.wikipedia.org/wiki/Gibson_Les_Paul",
        "SG": "https://en.wikipedia.org/wiki/Gibson_SG",
        "Explorer": "https://en.wikipedia.org/wiki/Gibson_Explorer",
        "Flying V": "https://en.wikipedia.org/wiki/Gibson_Flying_V",
        "Firebird": "https://en.wikipedia.org/wiki/Gibson_Firebird",
        "Stratocaster": "https://en.wikipedia.org/wiki/Fender_Stratocaster",
        "Telecaster": "https://en.wikipedia.org/wiki/Fender_Telecaster",
        "Jazzmaster": "https://en.wikipedia.org/wiki/Fender_Jazzmaster",
        "RG Series": "https://en.wikipedia.org/wiki/Ibanez_RG",
        "S Series": "https://en.wikipedia.org/wiki/Ibanez_S",
        "Artcore": "https://en.wikipedia.org/wiki/Ibanez_Artcore_series",
        "Iceman": "https://en.wikipedia.org/wiki/Ibanez_Iceman",
        "Arrow": "https://www.espguitars.com/products/16976-esp-arrow-blk-and",
        "Eclipse": "https://www.espguitars.com/products/9998-e-ii-eclipse-qm-marbl",
        "FRX Series": "https://www.espguitars.com/products/9956-esp-frx-blk",
        "Horizon": "https://www.espguitars.com/products/16982-esp-horizon-iii-pwg",
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: guitarInfo[guitar!]!)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
}
