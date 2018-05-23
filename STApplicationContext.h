//
//  STApplicationContext.h
//  
//
//  Created by 何朝晖 on 16/7/6.
//
//
#import <Foundation/Foundation.h>

@interface STApplicationContext : NSObject

+ (STApplicationContext *)sharedContext;
/// 目前存在的所有UIAlertView
@property(nonatomic, copy, readonly) NSArray *availableAlertViews;

- (void)dismissAllAlertViews;

@end