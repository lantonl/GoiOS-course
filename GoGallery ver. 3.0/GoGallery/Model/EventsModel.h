//
//  EventsModel.h
//  GoGallery
//
//  Created by Kirill Kirikov on 8/19/16.
//  Copyright © 2016 goit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"

@interface EventsModel : NSObject
+ (EventsModel *)sharedModel;
- (NSArray<Event *> *) events;
- (NSUInteger) eventsCount;

@end
