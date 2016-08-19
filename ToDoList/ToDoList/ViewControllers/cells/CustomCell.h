//
//  CustomCell.h
//  ToDoList
//
//  Created by Anton A on 16.08.16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoItem.h"
#import "ToDoItemsStore.h"
#import "button.h"
@class CustomCell;

@protocol CustomCellDelegate <NSObject>

- (void)didTapAddButton:(CustomCell *)cell;
- (void)didTapPriorityButton:(CustomCell *)cell;

@end

@interface CustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *summaryTextField;
@property (weak, nonatomic) IBOutlet Button *priorityButtonTouch;



@property (weak, nonatomic) id <CustomCellDelegate> delegate;




- (void)configureWithItem:(ToDoItem *)item;




@end
