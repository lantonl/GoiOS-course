//
//  ToDoItemsStore.h
//  ToDoList
//
//  Created by Kirill Kirikov on 8/10/16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDoItem.h"
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    PrioritySetNone,
    PrioritySetLow,
    PrioritySetDefault,
    PrioritySetHigh,
    PrioritySetUrgent,
} PrioritySet;
@interface NSString (PrioritySet)
- (PrioritySet) priority;
@end

@protocol ToDoItemsStoreProtocol <NSObject>
- (void) addItem:(ToDoItem *)item;
- (void) removeItem:(NSUInteger)item;
- (NSArray<ToDoItem *> *)items;
- (NSUInteger) itemsCount;
- (UIColor*) priorityColorSetter:(PrioritySet)priority;
@end

@interface ToDoItemsStore : NSObject <ToDoItemsStoreProtocol>

@end