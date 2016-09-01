//
//  DataLoader.m
//  GoGallery
//
//  Created by Kirill Kirikov on 8/19/16.
//  Copyright © 2016 goit. All rights reserved.
//

#import "DataLoader.h"
#import "Exhibition.h"
#import "Artwork.h"
#import "Gallery.h"

@implementation DataLoader

- (void) loadEventsWithCallback:(void (^)(NSArray <Event *> *, NSError *error))callback {
    
    NSError *error = nil;
    NSArray *rawGalleries   = [self loadJSON:@"galleries" withError:&error];
    NSArray *rawExhibitions = [self loadJSON:@"exhibitions" withError:&error];
    NSArray *rawArtwork     = [self loadJSON:@"works" withError:&error];
    
    
    if (error) {
        return callback(nil, error);
    }
    
    NSMutableDictionary *artworks = [[NSMutableDictionary alloc] initWithCapacity:[rawArtwork count]];
    for (NSDictionary *dic in rawArtwork) {
        Artwork* artwork = [[Artwork alloc] initWithDictionary:dic];
        [artworks setObject:artwork forKey:artwork.ID];
    }
    
    
    NSMutableDictionary <NSString *, Gallery *> *galleries = [[NSMutableDictionary alloc] initWithCapacity:[rawGalleries count]];
    
    for (NSDictionary *dic in rawGalleries) {
        Gallery *gal = [[Gallery alloc] initWithDictionary:dic];
        [galleries setObject:gal forKey:gal.ID];
    }
    
    NSMutableArray *exhibitions = [NSMutableArray arrayWithCapacity:[rawExhibitions count]];
    for (NSDictionary *dic in rawExhibitions) {
        Exhibition *ex = [[Exhibition alloc] initWithDictionary:dic];
        NSString *galleryId = [[dic[@"_p_gallery"] componentsSeparatedByString:@"$"] lastObject];
        ex.gallery = galleries[galleryId];
        
        NSDictionary *artworksDictionary = dic[@"works"];
        NSMutableArray* tempWorksArray = [[NSMutableArray alloc]init];
        for (NSDictionary *workDict in artworksDictionary)
        {
            [tempWorksArray addObject:artworks[workDict[@"objectId"]]];
        }
        if([tempWorksArray count] > 0){
        ex.artworks = [NSArray arrayWithArray:tempWorksArray];
        }else{
            Artwork* artwork = [[Artwork alloc]init];
            artwork.imgPicture = @"no-image-available.jpg";
            ex.artworks = [NSArray arrayWithObject:artwork];
        }
        [exhibitions addObject:ex];
    }

    callback(exhibitions, nil);
}


- (NSArray *) loadJSON:(NSString *)json withError:(NSError **)error {
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:json ofType:@"json"]];
    NSArray *raw = [NSJSONSerialization JSONObjectWithData:data options:0 error:error];
    return raw;
}

@end
