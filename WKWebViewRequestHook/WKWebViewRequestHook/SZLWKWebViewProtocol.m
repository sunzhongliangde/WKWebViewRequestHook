//
//  SZLWKWebViewProtocol.m
//  WKWebViewRequestHook
//
//  Created by admin on 2019/11/25.
//  Copyright © 2019 sunzhongliang. All rights reserved.
//

#import "SZLWKWebViewProtocol.h"
#import "SZLRequestHook.h"

#define kURLProtocolHandledKey @"URLProtocolHandledKey"
@interface SZLWKWebViewProtocol()<NSURLSessionDelegate>

@property (atomic, strong, readwrite) NSURLSessionDataTask *task;
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSOperationQueue *queue;

@end

@implementation SZLWKWebViewProtocol

+ (BOOL)canInitWithRequest:(NSURLRequest *)request
{
    BOOL hooked = [SZLRequestHook canHookWithRequest:request];
    if (hooked) {
        if ([NSURLProtocol propertyForKey:kURLProtocolHandledKey inRequest:request]) {
            return NO;
        }
        return YES;
    }
    return NO;
}

+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request
{
    return [SZLRequestHook forwardRequest:request];
}

// 判重
+ (BOOL)requestIsCacheEquivalent:(NSURLRequest *)a toRequest:(NSURLRequest *)b
{
    return [super requestIsCacheEquivalent:a toRequest:b];
}

- (void)startLoading
{
    NSMutableURLRequest *mutableReqeust = [[self request] mutableCopy];
    
    // 标示改request已经处理过了，防止无限循环
    [NSURLProtocol setProperty:@YES forKey:kURLProtocolHandledKey inRequest:mutableReqeust];
    
    NSURLSessionConfiguration *configure = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.session  = [NSURLSession sessionWithConfiguration:configure delegate:self delegateQueue:self.queue];
    self.task = [self.session dataTaskWithRequest:mutableReqeust];
    [self.task resume];
}

- (void)stopLoading
{
    [self.session invalidateAndCancel];
    self.session = nil;
}

#pragma mark - Getter
- (NSOperationQueue *)queue
{
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
    }
    return _queue;
}
@end
