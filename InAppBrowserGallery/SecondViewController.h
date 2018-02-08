//
//  SecondViewController.h
//  InAppBrowserGallery
//
//  Created by Shintaro Tanaka on 2017/10/11.
//  Copyright © 2017年 Shintaro Tanaka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "ViewerProtocol.h"

@interface SecondViewController : UIViewController <WKNavigationDelegate, ViewerProtocol>

@property (weak, nonatomic) IBOutlet UIView *container;

@end
