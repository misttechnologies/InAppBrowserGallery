//
//  ThirdViewController.h
//  InAppBrowserGallery
//
//  Created by Shintaro Tanaka on 2017/10/11.
//  Copyright © 2017年 Shintaro Tanaka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewerProtocol.h"
@import SafariServices;

@interface ThirdViewController : UIViewController <SFSafariViewControllerDelegate, ViewerProtocol>


@end

