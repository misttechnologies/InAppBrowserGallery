//
//  FirstViewController.m
//  InAppBrowserGallery
//
//  Created by Shintaro Tanaka on 2017/10/11.
//  Copyright © 2017年 Shintaro Tanaka. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"
#import "MasterViewController.h"

@interface FirstViewController ()

@property (strong, nonatomic) UIRefreshControl *refreshControl;

@end


@implementation FirstViewController

@synthesize webView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    webView.delegate = self;
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Loading..."];
    [self.refreshControl addTarget:self action:@selector(reload:) forControlEvents:UIControlEventValueChanged];

    [self.webView.scrollView addSubview:self.refreshControl];
}

- (void)viewWillAppear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshByNotification:) name:kUpdateAddress object:nil];
    [self load:((MasterViewController *)((AppDelegate *)[UIApplication sharedApplication].delegate).window.rootViewController).location];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reload:(id)controller {
    [self load];
}

- (void)load {
    [self.webView reload];
}

- (void)load:(NSString *)location {
    NSLog(@"%@", [NSString stringWithFormat:@"Begin loading: %@", location]);
    NSURL *url = [NSURL URLWithString:location];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [webView loadRequest:req];
}

- (void)refreshByNotification:(NSNotification *)notif {
    [self.refreshControl endRefreshing];
    [self load:((MasterViewController *)[notif object]).location];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    [[NSNotificationCenter defaultCenter] postNotificationName:kNavigationOccurred object:self.webView userInfo:@{@"location": request.URL.absoluteString}];
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.refreshControl endRefreshing];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

@end
