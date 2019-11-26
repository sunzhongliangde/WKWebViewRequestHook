//
//  SZLRequestHook.h
//  WKWebViewRequestHook
//
//  Created by admin on 2019/11/26.
//  Copyright © 2019 sunzhongliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SZLRequestHook : NSObject

/// 初始化拦截
+ (void)startHook;


/// 是否拦截此请求
/// @param request 请求
+ (BOOL)canHookWithRequest:(NSURLRequest *)request;


/// 转发拦截到的请求
/// @param request 请求
+ (NSURLRequest *)forwardRequest:(NSURLRequest *)request;

@end

NS_ASSUME_NONNULL_END
