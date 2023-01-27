#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"
@interface
RCT_EXTERN_MODULE(RibbonModule, NSObject)
RCT_EXTERN_METHOD(configure: (NSString*) name)
RCT_EXTERN_METHOD(triggerAndShow: (NSString*) value)
RCT_EXTERN_METHOD(trigger: (NSString*) name
    resolver:(RCTPromiseResolveBlock)resolve
    rejecter:(RCTPromiseRejectBlock)reject)
RCT_EXTERN_METHOD(showDialog)
RCT_EXTERN_METHOD(setPreview: (BOOL) value)
RCT_EXTERN_METHOD(getAttributes:
                  (RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
RCT_EXTERN_METHOD(setAttributes: (NSDictionary*) attributes)
RCT_EXTERN_METHOD(removeAttribute: (NSString*) key)
RCT_EXTERN_METHOD(removeAttributes: (NSArray*) key)
RCT_EXTERN_METHOD(removeAllAttributes)
RCT_EXTERN_METHOD(setIdentity: (NSString*) userId)
RCT_EXTERN_METHOD(clearSession)
@end
