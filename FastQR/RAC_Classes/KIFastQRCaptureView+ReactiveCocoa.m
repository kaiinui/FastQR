#import "KIFastQRCaptureView+ReactiveCocoa.h"

@implementation KIFastQRCaptureView (ReactiveCocoaAdditions)

static void *SubscriberKey = &SubscriberKey;

- (RACSignal *)rac_startCapture {
    [self startCaptureWithDelegate:self];
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        objc_setAssociatedObject(self, &SubscriberKey, subscriber, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return nil;
    }];
}

# pragma mark - KIFastQRCaptureDelegate

- (void)captureOutput:(NSString *)obtainedString {
    NSLog(@"%@", obtainedString);
    id<RACSubscriber> subscriber = objc_getAssociatedObject(self, &SubscriberKey);
    [subscriber sendNext:obtainedString];
}

@end
