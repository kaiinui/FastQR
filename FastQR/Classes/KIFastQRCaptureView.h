//
//  KIFastQRCaptureView.h
//  FastQR
//
//  Created by kaiinui on 2014/08/14.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol KIFastQRCaptureDelegate

- (void)captureOutput:(NSString *)obtainedString;

@end

@interface KIFastQRCaptureView : UIView <AVCaptureMetadataOutputObjectsDelegate>

@property (nonatomic, strong) AVCaptureSession *session;
@property (nonatomic, assign) id<KIFastQRCaptureDelegate> delegate;

- (void)startCaptureWithDelegate:(id<KIFastQRCaptureDelegate>)delegate;
- (void)stopCapture;

@end
