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
    [[fastQR rac_startCapture] subscribeNext:^(id obtainedString) {
        NSLog(@"%@", obtainedString);
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Got!" message:obtainedString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }];
    [self.view addSubview:fastQR];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
