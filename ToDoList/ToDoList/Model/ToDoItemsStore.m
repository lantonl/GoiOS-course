//
//  ToDoItemsStore.m
//  ToDoList
//
//  Created by Kirill Kirikov on 8/10/16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import "ToDoItemsStore.h"

@interface ToDoItemsStore()
@property (nonatomic, strong) NSMutableArray *items;
@end

@implementation NSString (PrioritySet)

- (PrioritySet) priority {
    if ([self isEqualToString:@"Low"]) {
        return PrioritySetLow;
    } else if ([self isEqualToString:@"Default"]){
        return PrioritySetDefault;
    } else if ([self isEqualToString:@"High"]){
        return PrioritySetHigh;
    } else if ([self isEqualToString:@"Urgent"]){
        return PrioritySetUrgent;
    }
    return PrioritySetNone;
}

@end


@implementation ToDoItemsStore

- (instancetype)init
{
    self = [super init];
    if (self) {
        _items = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) addItem:(ToDoItem *)item {
    [_items addObject:item];
}

- (void) removeItem:(NSUInteger)item {
    [_items removeObjectAtIndex:item];
}

- (NSArray<ToDoItem *> *)items {
    return [NSArray arrayWithArray:_items];
}

- (NSUInteger) itemsCount {
    return _items.count;
}

- (UIColor*) priorityColorSetter:(PrioritySet)priority{
    UIColor* color;
    if (priority == PrioritySetLow) {
        color = [UIColor blueColor];
    } else if (priority == PrioritySetDefault){
        color = [UIColor greenColor];
    } else if (priority == PrioritySetHigh){
        color = [UIColor orangeColor];
    } else if (priority == PrioritySetUrgent){
        color = [UIColor redColor];
    }
    return color;
}


@end
