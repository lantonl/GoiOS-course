//
//  Artwork.m
//  GoGallery
//
//  Created by Anton A on 23.08.16.
//  Copyright © 2016 goit. All rights reserved.
//

#import "Artwork.h"

@implementation Artwork


- (instancetype) initWithDictionary:(NSDictionary *)data{
    self = [super init];
    if (self) {
        self.ID = data[@"_id"];
        self.type = data[@"type"];
        self.year = data[@"year"];
        self.author = data[@"author"];
        self.title = data[@"title"];
        self.imgPicture = data[@"imgPicture"];
        self.size = data[@"size"];
    }
    return self;
}

- (NSString*) getImageNameForPreview{
    NSString* imageName = self.imgPicture;
    return imageName;
}

- (UIImage*) returnFirstImage{
    UIImage* image = [UIImage imageNamed:self.imgPicture];
    return image;
}


@end
