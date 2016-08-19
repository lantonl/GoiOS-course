//
//  ToDoItem.m
//  ToDoList
//
//  Created by Kirill Kirikov on 8/10/16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import "ToDoItem.h"



@implementation ToDoItem

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

-(void)priorityChangeValue{
    if(_priority < 4){
    _priority ++;
    }else {
        _priority = 1;
    }
}




@end
