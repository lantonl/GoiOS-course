//
//  CellArtworkCollectionView.m
//  GoGallery
//
//  Created by Anton A on 31.08.16.
//  Copyright © 2016 goit. All rights reserved.
//

#import "CellArtworkCollectionView.h"

@implementation CellArtworkCollectionView

- (void)configureWithArtwork:(Artwork *) artwork{
    UIImage *image = [UIImage imageNamed:artwork.imgPicture];
//    UIImage *originalImage = [image imageWithRenderingMode:                 UIImageRenderingModeAlwaysOriginal];
    self.artwork.image = image;
}

@end
