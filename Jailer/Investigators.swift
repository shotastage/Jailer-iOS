//
//  Investigators.swift
//  Jailer
//
//  Created by Shota Shimazu on 2018/06/14.
//  Copyright © 2018 MiXSTAGE. All rights reserved.
//

import Foundation

open class Investigators {
    
    public enum Error {
        case FileNotExist
    }
    
    private func investigateGeneral() {
        
        let aptSourceList: String = "/etc/apt/sources.list.d/cydia.list"
        let cmd: String = "dpkg -l"
        
        if let path: String = Bundle.main.path(forResource: aptSourceList, ofType: "list") {
            
            do {
                let content = try String(contentsOfFile: path)
                print(content)
            } catch  {
                print("Failed to fetch file")
            }
            
            
        } else {
            print(".FileNotExist")
        }
        
        //let task = umask.launchedTask(withLaunchPath: "/bin/ls", arguments: ["-la"])
        //task.waitUntilExit()
        
    }
    
    private func investigateLiberty() {
        
    }
}
