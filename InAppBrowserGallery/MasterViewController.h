//
//  MasterViewController.h
//  InAppBrowserGallery
//
//  Created by Shintaro Tanaka on 2017/10/11.
//  Copyright © 2017年 Shintaro Tanaka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SafariServices/SafariServices.h>

static NSString *const kUpdateAddress = @"update_address";
static NSString *const kNavigationOccurred = @"navigation_occurred";

@interface MasterViewController : UIViewController <SFSafariViewControllerDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *SFSafariViewOpenButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *SafariOpenButton;
@property (weak, nonatomic) IBOutlet UITextField *addressBar;

@property (nonatomic, readonly) NSString *location;

- (IBAction)actionDidEndOnExit:(id)sender;
- (IBAction)actionClickSF:(id)sender;
- (IBAction)actionClickSafari:(id)sender;

@end


