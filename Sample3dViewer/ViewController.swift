//
//  ViewController.swift
//  Sample3dViewer
//
//  Created by Rishad Appat on 10/07/2022.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebView()
    }

    private func loadWebView()
    {
        webView.scrollView.bounces = false
        webView.scrollView.alwaysBounceVertical = false
        webView.scrollView.alwaysBounceHorizontal = false
        do{
            guard let filePath = Bundle.main.path(forResource: "model_viewer", ofType: "html") else { return }
            let contents = try String(contentsOfFile: filePath, encoding: .utf8)
            let baseUrl = URL(fileURLWithPath: filePath)
            webView.loadHTMLString(contents as String, baseURL: baseUrl)
        } catch {
            print("HTML File error")
        }
    }

}

