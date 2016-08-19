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


@interface NSString (PrioritySet)
- (PrioritySet) priority;
@end

@protocol ToDoItemsStoreProtocol <NSObject>
- (void) addItem:(ToDoItem *)item;
-(void) replaceItemAtIndex:(ToDoItem*)item at :(NSUInteger) index;
- (ToDoItem*) getObjecAtIndex:(NSUInteger)index;
- (void) removeItem:(NSUInteger)item;
- (NSArray<ToDoItem *> *)items;
- (NSUInteger) itemsCount;

@end

@interface ToDoItemsStore : NSObject <ToDoItemsStoreProtocol>

@end