//
//  ToDoItem.h
//  ToDoList
//
//  Created by Kirill Kirikov on 8/10/16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    PrioritySetNone,
    PrioritySetLow,
    PrioritySetDefault,
    PrioritySetHigh,
    PrioritySetUrgent,
} PrioritySet;

@interface ToDoItem : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *summary;
@property (nonatomic, assign) NSUInteger priority;
@property (assign) BOOL isDone;

- (UIColor*) priorityColorSetter:(PrioritySet)priority;
- (void) priorityChangeValue;
@end
