//
//  ExhibitionsListViewController.m
//  GoGallery
//
//  Created by Anton A on 25.08.16.
//  Copyright © 2016 goit. All rights reserved.
//

#import "ExhibitionsListViewController.h"
#import "ExhibitionDescriptionViewController.h"
#import "Exhibition.h"
#import "EventsModel.h"
#import "CellExhibition.h"


@interface ExhibitionsListViewController() <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


@implementation ExhibitionsListViewController

static NSString *kCellExhibitionIdentifier = @"CellExhibition";

- (void) viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

#pragma mark - UITableViewDelegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Exhibition* exhibition = (Exhibition*)[[[EventsModel sharedModel]events]objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"ShowExhibitionDescriptionSegue" sender:exhibition];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[EventsModel sharedModel]eventsCount];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:                                 kCellExhibitionIdentifier];
    Exhibition* exhibition = (Exhibition*)[[[EventsModel sharedModel]events]objectAtIndex:indexPath.row];
    [(CellExhibition*)cell configureWithExhibition:exhibition];
    return cell;
}


#pragma mark - UIViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(nullable id) sender{
    ExhibitionDescriptionViewController* viewController = segue.destinationViewController;
    viewController.exhibition = (Exhibition*)sender;
}



@end
