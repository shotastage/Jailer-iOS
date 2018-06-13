//
//  ObjJailer.h
//  ObjJailer
//
//  Created by Shota Shimazu on 2018/06/14.
//  Copyright © 2018 MiXSTAGE. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for ObjJailer.
FOUNDATION_EXPORT double ObjJailerVersionNumber;

//! Project version string for ObjJailer.
FOUNDATION_EXPORT const unsigned char ObjJailerVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <ObjJailer/PublicHeader.h>


typedef NS_ENUM(NSIntegr, Status) {
    secured = 0,
    injected = 1,
};

@interface ObjJailer: NSObject

+ ()
@end

