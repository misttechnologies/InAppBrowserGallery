//
//  MasterViewController.m
//  InAppBrowserGallery
//
//  Created by Shintaro Tanaka on 2017/10/11.
//  Copyright © 2017年 Shintaro Tanaka. All rights reserved.
//

#import "MasterViewController.h"

@interface MasterViewController ()

@end


@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.addressBar.delegate = self;
    // CHANGE ME if you want to change default HOME url.
    self.addressBar.text = @"http://localhost:5000/examples/";
    
    NSURLCache *cache = [NSURLCache sharedURLCache];
    [cache removeAllCachedResponses];
    cache.diskCapacity = 0;
    cache.memoryCapacity = 0;

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNavigation:) name:kNavigationOccurred object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:kUpdateAddress object:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleNavigation:(NSNotification *)notif {
    self.addressBar.text = [notif userInfo][@"location"];
}

#pragma - handling textfield

- (IBAction)actionDidEndOnExit:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:kUpdateAddress object:self];
}

- (IBAction)actionClickSF:(id)sender {
    SFSafariViewController *sf = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:self.location]];
    sf.delegate = self;
    [self presentViewController:sf animated:YES completion:nil];
}

- (IBAction)actionClickSafari:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.location]];
}

- (NSString *)location {
    return self.addressBar.text;
}

#pragma mark - UITextFieldDelegate methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (![textField.text hasPrefix:@"http://"] && ![textField.text hasPrefix:@"https://"]) {
        textField.text = [NSString stringWithFormat:@"http://%@", textField.text];
    }
    return YES;
}

#pragma mark - SFSafariViewControllerDelegate methods

- (void)safariViewController:(SFSafariViewController *)controller didCompleteInitialLoad:(BOOL)didLoadSuccessfully {
    // load completed
}

- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller {
    // DONE pressed
}

@end
