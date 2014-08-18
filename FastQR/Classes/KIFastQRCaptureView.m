#import "KIFastQRCaptureView.h"

@interface KIFastQRCaptureView ()

@property (nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;
@property (nonatomic, strong) NSString *formerResult;

@end

@implementation KIFastQRCaptureView

- (id)init {
    self = [super init];
    if (self) {
        [self initializeCapture];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initializeCapture];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeCapture];
    }
    return self;
}

- (void)startCaptureWithDelegate:(id<KIFastQRCaptureDelegate>)delegate {
    [_session startRunning];
    _delegate = delegate;
    
}

- (void)stopCapture {
    [_session stopRunning];
    _session = nil;
    
    [_previewLayer removeFromSuperlayer];
}

# pragma mark - Private Methods

- (void)initializeCapture {
    AVCaptureSession *session = [self setupSession];
    if (!session) {return;}
    [self.layer addSublayer:[self setupPreviewLayer]];
    [self setupConnection];
}

- (AVCaptureSession *)setupSession {
    AVCaptureDeviceInput *input = [self setupInput];
    if (!input) {
        return nil;
    }
    
    _session = [AVCaptureSession new];
    [_session addInput:input];
    [self setupMetadataOutput];
    return _session;
}

- (AVCaptureDeviceInput *)setupInput {
    NSError *error;
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    return [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
}

- (AVCaptureVideoPreviewLayer *)setupPreviewLayer {
    _previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_session];
    [_previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [_previewLayer setFrame:self.bounds];
    return _previewLayer;
}

- (AVCaptureMetadataOutput *)setupMetadataOutput {
    AVCaptureMetadataOutput *output = [AVCaptureMetadataOutput new];
    // should call -addOutput before -setMetadataObjectTypes
    // @url http://www.ama-dev.com/iphone-qr-code-library-ios-7/
    [_session addOutput:output];
    
    dispatch_queue_t dispatchQueue;
    dispatchQueue = dispatch_queue_create("KIFastQRCapture", NULL);
    [output setMetadataObjectsDelegate:self queue:dispatchQueue];
    [output setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
    
    return output;
}

- (AVCaptureConnection *)setupConnection {
    AVCaptureConnection *connection = _previewLayer.connection;
    connection.videoOrientation = AVCaptureVideoOrientationPortrait;
    return connection;
}

- (void)didGetQRCaptureResult:(NSString *)result {
    if ([_formerResult isEqualToString:result]) {return;}
    _formerResult = result;
    
    [_delegate fastQRView:self captureOutput:result];
}

# pragma mark - AVCaptureMetadataOutputObjectsDelegate

-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    if (metadataObjects != nil && [metadataObjects count] > 0 ) {
        AVMetadataMachineReadableCodeObject *meta = metadataObjects[0];
        if ([[meta type] isEqualToString:AVMetadataObjectTypeQRCode]) {
            [self performSelectorOnMainThread:@selector(didGetQRCaptureResult:) withObject:[meta stringValue] waitUntilDone:NO];
        }
    }
}

@end
