//
//  UIAlertView+STApplicationContext.m
//  PengYunClass
//
//  Created by 何朝晖 on 16/7/6.
//  Copyright © 2016年 何朝晖. All rights reserved.
//

#import "UIAlertView+STApplicationContext.h"
#import "STApplicationContext.h"
#import <objc/runtime.h>

@implementation UIAlertView (STApplicationContext)

+ (void)load {
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(show)), class_getInstanceMethod(self, @selector(st_show)));
}

- (void)st_show {
    STApplicationContext *context = [STApplicationContext sharedContext];
    NSHashTable *hashTable = [context valueForKey:@"_alertViewHashTable"];
    if ([hashTable isKindOfClass:[NSHashTable class]]) {
        [hashTable addObject:self];
    }
    [self st_show];
}

@end
