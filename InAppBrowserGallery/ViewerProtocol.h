//
//  ViewerProtocol.h
//  InAppBrowserGallery
//
//  Created by Shintaro Tanaka on 2017/10/11.
//  Copyright © 2017年 Shintaro Tanaka. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ViewerProtocol
@required
- (void)load;
- (void)load:(NSString *)location;
@optional
- (void)viewWillAppear:(BOOL)animated;
@end
