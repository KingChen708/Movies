//
//  ViewController.h
//  Movies
//
//  Created by King Chen on 6/15/15.
//  Copyright (c) 2015 King Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"

@interface ViewController : UIViewController
{
    Reachability* internetReachable;
    Reachability* hostReachable;
    BOOL internetActive;
    BOOL hostActive;
}

@end

