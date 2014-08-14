//
//  KIViewController.m
//  FastQR
//
//  Created by kaiinui on 2014/08/14.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "KIViewController.h"
#import "Classes/KIFastQRCaptureView.h"

@interface KIViewController ()

@end

@implementation KIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    KIFastQRCaptureView *fastQR = [[KIFastQRCaptureView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:fastQR];
    [fastQR startCaptureWithDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - KIFastQRCaptureDelegate

- (void)captureOutput:(NSString *)obtainedString {
    NSLog(@"%@", obtainedString);
}

@end
