//
//  Jailer.swift
//  Jailer
//
//  Created by Shota Shimazu on Jun 12, 2018.
//
//  Copyright © 2018 MiXSTAGE, Inc. All rights reserved.
//  Copyright © 2018 Shota Shimazu. All rights reserved.
//

import UIKit


public enum SurveillanceReport {
    case injected
    case secured
}


public enum SurveillanceLevel {
    case normal
    case week
    case strong
}


open class Surveillancer {
    
    #if DEBUG
    public static func isSecuredDebug(raiseInjection: Bool) -> SurveillanceReport {
        
        if raiseInjection {
            return .injected
        } else {
            return .secured
        }
        
    }
    #endif
    
    
    // Renaming
    public static func isSecured() -> SurveillanceReport {
        return fetchStatusFromServer()
    }
    
    
    public static func fetchStatusFromServer() -> SurveillanceReport {
        
        // File Manager Instance
        let fileManager = FileManager.default
        
    
        #if arch(i386) || arch(x86_64)
        // This is a Simulator not an idevice
        return .secured
        #endif
        
        
        guard let cydiaUrlScheme = NSURL(string: "cydia://package/com.example.package") else { return .secured }
        if UIApplication.shared.canOpenURL(cydiaUrlScheme as URL) {
            return .secured
        }
        
        

        if fileManager.fileExists(atPath: "/Applications/Cydia.app") ||
           fileManager.fileExists(atPath: "/Library/MobileSubstrate/MobileSubstrate.dylib") ||
           fileManager.fileExists(atPath: "/Library/MobileSubstrate/DynamicLibraries/LibertySB.dylib") ||
           fileManager.fileExists(atPath: "/bin/bash") ||
           fileManager.fileExists(atPath: "/usr/sbin/sshd") ||
           fileManager.fileExists(atPath: "/etc/apt") ||
           fileManager.fileExists(atPath: "/private/var/lib/apt/") ||
           fileManager.fileExists(atPath: "/usr/bin/ssh") ||
           fileManager.fileExists(atPath: "/private/var/lib/apt") {
            return .injected
        }
            
        if openable(path: "/Applications/Cydia.app") ||
            openable(path: "/Library/MobileSubstrate/MobileSubstrate.dylib") ||
            openable(path: "/Library/MobileSubstrate/DynamicLibraries/LibertySB.dylib") ||
            openable(path: "/bin/bash") ||
            openable(path: "/usr/sbin/sshd") ||
            openable(path: "/etc/apt") ||
            openable(path: "/private/var/lib/apt/") ||
            openable(path: "/usr/bin/ssh") {
            return .injected
        }
            
        let path = "/private/" + NSUUID().uuidString
            
        do {
            try "anyString".write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
            try fileManager.removeItem(atPath: path)
            return .injected
        } catch {
            return .secured
        }
    }
    
    static func openable(path: String) -> Bool {
        let file = fopen(path, "r")
        guard file != nil else { return false }
        fclose(file)
        return true
    }
}
