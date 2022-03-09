// RCTCalendarModule.m
#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface RCT_EXTERN_MODULE(NativeModule, NSObject)

RCT_EXTERN_METHOD(log: (nonnull NSString *)level message: (nonnull NSString *)message)
RCT_EXTERN_METHOD(sumTwoNumbers: (nonnull NSNumber *)a b: (nonnull NSNumber *)b)

@end
