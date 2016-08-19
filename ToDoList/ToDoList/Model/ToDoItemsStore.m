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
    return [NSMutableArray arrayWithArray:_items];
}

- (ToDoItem*) getObjecAtIndex:(NSUInteger)index{
    return [_items objectAtIndex:index];
}

-(void) replaceItemAtIndex:(ToDoItem*)item at :(NSUInteger) index{
    [_items replaceObjectAtIndex:index withObject:item];
}

- (NSUInteger) itemsCount {
    return _items.count;
}




@end
