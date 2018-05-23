//
//  STApplicationContext.m
//  
//
//  Created by 何朝晖 on 16/7/6.
//
//
#import "STApplicationContext.h"
#import "UIAlertView+STApplicationContext.h"

@interface STApplicationContext ()

@end

@implementation STApplicationContext {
    NSHashTable *_alertViewHashTable;
}

static STApplicationContext *_sharedContext;

+ (STApplicationContext *)sharedContext {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ _sharedContext = [[STApplicationContext alloc] init]; });
    return _sharedContext;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _alertViewHashTable = [NSHashTable weakObjectsHashTable];
    }
    return self;
}

- (NSArray *)availableAlertViews {
    return [[_alertViewHashTable allObjects] copy];
}

- (void)dismissAllAlertViews {
    if (self.availableAlertViews.count > 0) {
        [self.availableAlertViews enumerateObjectsUsingBlock:^(UIAlertView *obj, NSUInteger idx, BOOL *stop) {
            [obj dismissWithClickedButtonIndex:obj.cancelButtonIndex animated:NO];
        }];
    }
}
@end