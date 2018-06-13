//
//  ViewController.swift
//  Demo
//
//  Created by Shota Shimazu on 2018/06/12.
//  Copyright © 2018 MiXSTAGE. All rights reserved.
//

import UIKit
import Jailer

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func checkJailbroken() {
        if Surveillancer.fetchStatusFromServer() == .secured {
            let alert: UIAlertController = UIAlertController(title: "Your device is safe!",     message: "Jailer report your device havn't been jailbroken.", preferredStyle:  UIAlertControllerStyle.alert)
            
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                (action: UIAlertAction!) -> Void in
                print("OK")
            })
            
            alert.addAction(defaultAction)
            
            present(alert, animated: true, completion: nil)
        } else {
            let alert: UIAlertController = UIAlertController(title: "Your device is Hacked!", message: "Jailer report your device has been jailbroken!", preferredStyle:  UIAlertControllerStyle.alert)
            
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                (action: UIAlertAction!) -> Void in
                print("OK")
            })
            
            alert.addAction(defaultAction)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    
    @IBAction func exitApp() {
        exit(0)
    }

}

