//
//  DataLoader.h
//  GoGallery
//
//  Created by Kirill Kirikov on 8/19/16.
//  Copyright © 2016 goit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"
#import "Venue.h"

@protocol DataLoaderProtocol <NSObject>

@optional
- (void) loadEventsWithCallback:(void (^)(NSArray <Event *> *, NSError *error))callback;
@end

@interface DataLoader : NSObject <DataLoaderProtocol>
- (void) loadEventsWithCallback:(void (^)(NSArray <Event *> *, NSError *error))callback;
@end

@interface APIDataLoader : NSObject <DataLoaderProtocol>

@end