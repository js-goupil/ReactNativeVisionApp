//
//  RNVisionImageView.m
//  MentorshipMarch2022
//
//  Created by Matt Bowen on 3/9/22.
//

#import "RNVisionImageView.h"
#import "RCTViewManager.h"

@interface RCT_EXTERN_MODULE(RNVisionImageViewSwift, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(locations, NSArray);
RCT_EXPORT_VIEW_PROPERTY(colors, NSArray);

@end
