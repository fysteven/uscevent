//
//  CareerEventVC.swift
//  uscevent
//
//  Created by Yao Fan on 9/17/15.
//  Copyright © 2015 frankhome. All rights reserved.
//

import UIKit
import WebKit

class CareerEventVC: UIViewController {
    var webView: WKWebView?
    
    override func loadView() {
        super.loadView()
        self.webView = WKWebView(frame: self.view.bounds)
        self.view = self.webView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "https://careers.usc.edu/eventcalendar/?theme=mobile")
        let request = NSURLRequest(URL: url!)
        self.webView!.loadRequest(request)
    }
    
    /*
    func configureWebView() {
        let frame : CGRect = self.view.frame;
        let rect1 = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)
        
        let configuration = WKWebViewConfiguration()
        
        var webView = WKWebView(frame: rect1, configuration: configuration)
        
        self.view.addSubview(webView)
    }
*/
}
