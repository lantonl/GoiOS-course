//
//  EventsModel.m
//  GoGallery
//
//  Created by Kirill Kirikov on 8/19/16.
//  Copyright © 2016 goit. All rights reserved.
//

#import "EventsModel.h"
#import "Event.h"
#import "DataLoader.h"

@interface EventsModel()
@property (nonatomic, strong) NSArray <Event *> *events;
@property (nonatomic, strong) id<DataLoaderProtocol> dataLoader;
@end

@implementation EventsModel

+ (EventsModel *)sharedModel {
    static EventsModel *_sharedModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedModel = [[EventsModel alloc] init];
    });
    
    return _sharedModel;
}

- (id)init {
    if (self = [super init]) {
        self.dataLoader = [[DataLoader alloc] init];
        [self loadData];
    }
    return self;
}

- (void) loadData {
    __weak typeof(self) weakself = self;
    [self.dataLoader loadEventsWithCallback:^(NSArray<Event *> * events, NSError *error) {
        weakself.events = events;
    }];
}

@end
