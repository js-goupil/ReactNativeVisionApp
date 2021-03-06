//
//  RNVisionImageView.m
//  MentorshipMarch2022
//
//  Created by Matt Bowen on 3/9/22.
//

#import <Foundation/Foundation.h>
#import "React/RCTViewManager.h"

@interface RCT_EXTERN_MODULE(VisionImageViewManager, RCTViewManager)
  RCT_EXPORT_VIEW_PROPERTY(imageMode, NSString);
  RCT_EXPORT_VIEW_PROPERTY(imageSource, NSString);
  RCT_EXPORT_VIEW_PROPERTY(cropForSaliency, BOOL);
@end
