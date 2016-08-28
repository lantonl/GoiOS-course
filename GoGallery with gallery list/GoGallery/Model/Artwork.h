//
//  Artwork.h
//  GoGallery
//
//  Created by Anton A on 23.08.16.
//  Copyright © 2016 goit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Artwork : NSObject


@property (strong, nonatomic) NSString* ID;
@property (strong, nonatomic) NSString* type;
@property (assign, nonatomic) NSString* year;
@property (strong, nonatomic) NSString* author;
@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* imgPicture;

- (instancetype) initWithDictionary:(NSDictionary *)data;
- (NSString*) getImageNameForPreview;
- (UIImage*) returnFirstImage;
@end
