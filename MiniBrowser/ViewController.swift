//
//  ViewController.swift
//  MiniBrowser
//
//  Created by Виталий Крюков on 31.05.2021.
//

import UIKit
import WebKit
import SVProgressHUD

class ViewController: UIViewController {
    
    @IBAction func backButtom(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func nextButtom(_ sender: Any) {
        webView.goForward()
    }
    
    @IBOutlet weak var seachBarTextfield: UITextField!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func closeKeyboard(_ sender: Any) {
        seachBarTextfield.resignFirstResponder()
    }
    
    @IBAction func finderButtom(_ sender: Any) {
        if let text = seachBarTextfield.text {
            if let search = URL(string: text) {
                let request = URLRequest(url: search)
                webView.load(request)
                SVProgressHUD.show(withStatus: "Loading...")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        seachBarTextfield.delegate = self
    }
}

extension ViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        SVProgressHUD.dismiss()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        SVProgressHUD.dismiss()
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        SVProgressHUD.dismiss()
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = seachBarTextfield.text {
            if let search = URL(string: text) {
                let request = URLRequest(url: search)
                webView.load(request)
                SVProgressHUD.show(withStatus: "Loading...")
            }
        }
        return true
    }
    
    
}

