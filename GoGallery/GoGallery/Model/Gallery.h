//
//  Gallery.h
//  GoGallery
//
//  Created by Kirill Kirikov on 8/22/16.
//  Copyright © 2016 goit. All rights reserved.
//

#import "Venue.h"

@interface Gallery : Venue


@property (strong, nonatomic) NSString* email;
@property (strong, nonatomic) NSString* facebook;

- (instancetype) initWithDictionary:(NSDictionary *)data;

@end
