//
//  FirstViewController.h
//  InAppBrowserGallery
//
//  Created by Shintaro Tanaka on 2017/10/11.
//  Copyright © 2017年 Shintaro Tanaka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewerProtocol.h"

@interface FirstViewController : UIViewController <UIWebViewDelegate, ViewerProtocol>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

