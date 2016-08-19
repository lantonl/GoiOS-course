//
//  Button.m
//  ToDoList
//
//  Created by Anton A on 17.08.16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import "Button.h"

@interface Button()


@end
@implementation Button


-(void) setPriorityState:(NSUInteger)priorityState{
    _priorityState = priorityState;
    
    if (_priorityState == PrioritySetLow) {
        UIImage *image = [UIImage imageNamed:@"low"];
        UIImage *originalImage = [image imageWithRenderingMode:                 UIImageRenderingModeAlwaysOriginal];
        [self setBackgroundImage:originalImage forState:UIControlStateNormal];
    }else if (_priorityState == PrioritySetDefault) {
        UIImage *image = [UIImage imageNamed:@"default"];
        UIImage *originalImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [self setBackgroundImage:originalImage forState:UIControlStateNormal];
    }else if (_priorityState == PrioritySetHigh) {
        UIImage *image = [UIImage imageNamed:@"high"];
        UIImage *originalImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [self setBackgroundImage:originalImage forState:UIControlStateNormal];
    }else if (_priorityState == PrioritySetUrgent) {
        UIImage *image = [UIImage imageNamed:@"urgent"];
        UIImage *originalImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [self setBackgroundImage:originalImage forState:UIControlStateNormal];
    }
}


@end
