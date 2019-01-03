//
//  UIViewController+NoPresent.m
//  DynamicAppIconDemo
//
//  Created by 惠上科技 on 2019/1/2.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import "UIViewController+NoPresent.h"
#import <objc/runtime.h>
@implementation UIViewController (NoPresent)

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method presentM = class_getInstanceMethod(self.class, @selector(presentViewController:animated:completion:));
        Method presentSwizzlingM = class_getInstanceMethod(self.class, @selector(lq_presentViewController:animated:completion:));
        method_exchangeImplementations(presentM, presentSwizzlingM);
    });
}

-(void)lq_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
    if ([viewControllerToPresent isKindOfClass:[UIAlertController class]]) {
        UIAlertController *alterController = (UIAlertController *)viewControllerToPresent;
        if (alterController.title == nil && alterController.message == nil) {
            return;
        }
    }
    [self lq_presentViewController:viewControllerToPresent animated:flag completion:completion];
}

@end
