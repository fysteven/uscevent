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
    var webView2: UIWebView?
    
    override func loadView() {
        super.loadView()
        
        if NSClassFromString("WKWebView") != nil {
            self.webView = WKWebView(frame: self.view.bounds)
            self.view = self.webView
        } else {
            self.webView2 = UIWebView(frame: self.view.bounds)
            self.view = self.webView2
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "http://careers.usc.edu/eventcalendar/?theme=mobile")
        let request = NSURLRequest(URL: url!)
        if self.webView != nil {
            self.webView!.loadRequest(request)
        } else {
            self.webView2!.loadRequest(request)
        }
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
