//
//  ToDoItemsListViewController.m
//  ToDoList
//
//  Created by Kirill Kirikov on 8/10/16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import "ToDoItemsListViewController.h"
#import "ToDoItemsStore.h"
#import "CustomCell.h"




@interface ToDoItemsListViewController() <UITableViewDataSource, UITableViewDelegate, CustomCellDelegate>
@property (weak, nonatomic) IBOutlet UITextField *summaryTextField;
@property (weak, nonatomic) IBOutlet UITextField *titleTextFIeld;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControlPrioritySelection;
@property (weak, nonatomic) IBOutlet UILabel *selectedSegmentText;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) id<ToDoItemsStoreProtocol> store;
@end

@implementation ToDoItemsListViewController

static NSString *kCellIdentifier = @"Cell";
static NSString *kDynamicCellIdentifier = @"DynamicCell";

- (void) viewDidLoad {
    [super viewDidLoad];
   
    self.tableView.rowHeight = 80;
    
    [self updateText: _segmentedControlPrioritySelection.selectedSegmentIndex];
    
    self.store = [[ToDoItemsStore alloc] init];
    [self addItemWithTitle:@"Buy new iPhone"
                andSummary:@"When iPhone 8 will be available."
               andPriority:1];
    [self addItemWithTitle:@"Sell my Galaxy S7"
                andSummary:@"Because iPhone is cool!"
               andPriority:2];
    [self addItemWithTitle:@"Sell my Galaxy S7"
                andSummary:@"Because iPhone is cool!"
               andPriority:3];
    [self addItemWithTitle:@"Sell my Galaxy S7"
                andSummary:@"Because iPhone is cool!"
               andPriority:4];
    [self addItemWithTitle:@"Sell my Galaxy S7"
                andSummary:@"Because iPhone is cool!"
               andPriority:2];

}

#pragma mark - UITableViewDelegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ToDoItem *item = [[self.store items] objectAtIndex:indexPath.row];
    item.isDone = !item.isDone;
    
    [tableView reloadRowsAtIndexPaths:@[indexPath]
                     withRowAnimation:UITableViewRowAnimationAutomatic];
}


#pragma mark - UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.store itemsCount];
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        UITableViewCell *cell;
        cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
        CustomCell* newCustomCell = (CustomCell*)cell;
        ToDoItem *item = [[self.store items] objectAtIndex:indexPath.row];
        newCustomCell.delegate = self;
        [newCustomCell configureWithItem:item];
        return cell;
}


- (void)tableView:(UITableView *)tableView
                    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
                     forRowAtIndexPath:(NSIndexPath *)indexPath{
        if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.store removeItem: indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationRight];
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
    }

#pragma mark - Actions

- (void) addItemWithTitle:(NSString *)title andSummary:(NSString *)summary andPriority:(NSUInteger)priority{
    ToDoItem *item = [[ToDoItem alloc] init];
    item.title = title;
    item.summary = summary;
    item.priority = priority;
    [self.store addItem:item];
};


- (IBAction)didTouchAddButton:(id)sender {
    NSString *title     = self.titleTextFIeld.text;
    NSString *summary   = self.summaryTextField.text;
    NSUInteger priority = _segmentedControlPrioritySelection.selectedSegmentIndex +1;
    [self addItemWithTitle:title andSummary:summary andPriority:priority];
    
    NSUInteger newElementIndex = [self.store itemsCount] - 1;
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:newElementIndex inSection:0]]
                          withRowAnimation:UITableViewRowAnimationAutomatic];
    self.titleTextFIeld.text = nil;
    self.summaryTextField.text = nil;
    //self.selectedSegmentText = 0;
    [self.view endEditing:YES];

}


- (IBAction)didSelectSegment:(id)sender{
    [self updateText:[sender selectedSegmentIndex]];
}

- (void)updateText:(NSInteger)selIndex{
    switch (selIndex) {
        case 0:
            _selectedSegmentText.text = @"Low";
            _selectedSegmentText.textColor = [UIColor blueColor];
            break;
        case 1:
            _selectedSegmentText.text = @"Default";
            _selectedSegmentText.textColor = [UIColor greenColor];
            break;
        case 2:
            _selectedSegmentText.text = @"High";
            _selectedSegmentText.textColor = [UIColor orangeColor   ];
            break;
        case 3:
            _selectedSegmentText.text = @"Urgent";
            _selectedSegmentText.textColor = [UIColor redColor];
            break;
            
        default:
            break;
    }
}

#pragma mark - CustomCell Delegate


- (void)didTapAddButton:(CustomCell *)cell {
    NSString *title           = cell.titleTextField.text;
    NSString *summary         = cell.summaryTextField.text;
    NSIndexPath *indexPath    = [self.tableView indexPathForCell:cell];
    NSUInteger index          = (NSUInteger)indexPath.row;
    [self editItem:[self.store getObjecAtIndex:index] withTitle:title andSummary:summary atIndex:indexPath.row];
   [self.tableView reloadRowsAtIndexPaths:@[[self.tableView indexPathForCell:cell]]
                          withRowAnimation:UITableViewRowAnimationAutomatic];
}
-(void) editItem:(ToDoItem*)item withTitle: (NSString *)title andSummary:(NSString *)summary atIndex: (NSUInteger)index{
    item.title   = title;
    item.summary = summary;
    [self.store replaceItemAtIndex:item at: index];
    
}


- (void)didTapPriorityButton:(CustomCell *)cell {
    NSIndexPath *indexPath    = [self.tableView indexPathForCell:cell];
    NSUInteger index = (NSUInteger)indexPath.row;
    ToDoItem* item = [self.store getObjecAtIndex:index];
    [item priorityChangeValue];
    [self.tableView reloadRowsAtIndexPaths:@[[self.tableView indexPathForCell:cell]]
                             withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
