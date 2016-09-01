//
//  CellExhibition.m
//  GoGallery
//
//  Created by Anton A on 25.08.16.
//  Copyright © 2016 goit. All rights reserved.
//

#import "CellExhibition.h"


@implementation CellExhibition

- (void)configureWithExhibition:(Exhibition *) exhibition {
    self.exhibitionPreviewImage.image = [[exhibition.artworks objectAtIndex:0]returnFirstImage];
    self.exhibitionPreviewImage.contentMode = UIViewContentModeScaleToFill;
    self.galleryNameLabel.text = exhibition.gallery.name;
    self.exhibitionNameLabel.text = exhibition.name;
    self.authorExhibitionLabel.text = exhibition.authorName;
}
    

@end
