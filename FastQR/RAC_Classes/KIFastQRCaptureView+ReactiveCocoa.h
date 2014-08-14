#import "../Classes/KIFastQRCaptureView.h"
#import <ReactiveCocoa.h>
#import <objc/runtime.h>

@interface KIFastQRCaptureView (ReactiveCocoaAdditions) <KIFastQRCaptureDelegate>

@property (nonatomic, retain) id<RACSubscriber> subscriber;

- (RACSignal *)rac_startCapture;

@end
