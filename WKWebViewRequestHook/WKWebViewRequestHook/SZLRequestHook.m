//
//  SZLRequestHook.m
//  WKWebViewRequestHook
//
//  Created by admin on 2019/11/26.
//  Copyright © 2019 sunzhongliang. All rights reserved.
//

#import "SZLRequestHook.h"
#import "SZLWKWebViewProtocol.h"

@implementation SZLRequestHook

// 开始拦截
+ (void)startHook {
    NSString *className =  @"WKBrowsingContextController";
    Class cls = NSClassFromString(className);
    SEL sel = NSSelectorFromString(@"registerSchemeForCustomProtocol:");
    
    if (cls && sel) {
        if ([(id)cls respondsToSelector:sel]) {
            IMP imp = [cls methodForSelector:sel];
            void (*func)(id, SEL, NSString*) = (void *)imp;
            func(cls, sel, @"http");
            func(cls, sel, @"https");
                    
            // [(id)cls performSelector:sel withObject:@"http"];
            // [(id)cls performSelector:sel withObject:@"https"];
        }
    }
    
    [NSURLProtocol registerClass:[SZLWKWebViewProtocol class]];
}

// 是否拦截此请求
+ (BOOL)canHookWithRequest:(NSURLRequest *)request {
    if ([request.URL.pathExtension caseInsensitiveCompare:@"png"] == NSOrderedSame ||
        [request.URL.pathExtension caseInsensitiveCompare:@"jpg"] == NSOrderedSame)
    {
        return YES;
    }
    return NO;
}

/// 转发拦截到的请求
/// @param request 请求
+ (NSURLRequest *)forwardRequest:(NSURLRequest *)request {
    NSMutableURLRequest *mutableReqeust = [request mutableCopy];
    mutableReqeust.URL = [NSURL URLWithString:@"https://www.baidu.com/img/bd_logo1.png?where=super"];
    
    return mutableReqeust;
}

@end
