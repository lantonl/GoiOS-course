//
//  CustomCell.m
//  ToDoList
//
//  Created by Anton A on 16.08.16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell



- (IBAction)checkMarkButton:(UIButton *)sender {
}

- (IBAction)didTouchCellAddButton:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didTapAddButton:)]) {
        [self.delegate didTapAddButton:self];
    }
}

- (IBAction)didTouchPriorityCellButton:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didTapPriorityButton:)]) {
        [self.delegate didTapPriorityButton:self];
    }
    

}


/*- (void)addButtonTaped {
    if (self.addButtonAction) {
        self.addButtonAction();
    }
}
*/
- (void)configureWithItem:(ToDoItem *)item {
    self.titleTextField.text         = item.title;
    self.titleTextField.textColor    = [item priorityColorSetter:item.priority];
    self.summaryTextField.text       = item.summary;
    self.accessoryType               = item.isDone ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    self.priorityButtonTouch.priorityState = item.priority;
}




@end
