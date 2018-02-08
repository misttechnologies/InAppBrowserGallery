//
//  ThirdViewController.m
//  InAppBrowserGallery
//
//  Created by Shintaro Tanaka on 2017/10/11.
//  Copyright © 2017年 Shintaro Tanaka. All rights reserved.
//

#import "ThirdViewController.h"
#import "AppDelegate.h"

@interface ThirdViewController ()

@property (weak, nonatomic) AppDelegate *delegate;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (void)viewWillAppear:(BOOL)animated {
    [self load];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)safariViewController:(SFSafariViewController *)controller didCompleteInitialLoad:(BOOL)didLoadSuccessfully {
}

- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller {
    // DONE button
}

- (void)load {
    [self load:_delegate.location];
}

- (void)load:(NSString *)location {
}

@end

