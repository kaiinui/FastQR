//
//  KIViewController.m
//  FastQR
//
//  Created by kaiinui on 2014/08/14.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "KIViewController.h"
#import "Classes/KIFastQRCaptureView.h"
#import "RAC_Classes/KIFastQRCaptureView+ReactiveCocoa.h"

@interface KIViewController ()

@end

@implementation KIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    KIFastQRCaptureView *fastQR = [[KIFastQRCaptureView alloc] initWithFrame:self.view.frame];
    [fastQR startCaptureWithDelegate:self];
    [self.view addSubview:fastQR];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - KIFastQRDelegate

- (void)fastQRView:(UIView *)fastQRView captureOutput:(NSString *)obtainedString {
    NSLog(@"%@", obtainedString);
}

@end
