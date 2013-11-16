//
//  Photos.m
//  CustomTableViewDemo
//
//  Created by Seng Hin Mak on 9/11/13.
//  Copyright (c) 2013 Twinsgames. All rights reserved.
//

#import "Photos.h"
#import "Photo.h"

@implementation Photos
- (id)init
{
    self = [super init];
    if (self) {
        Photo *photo1 = [[Photo alloc] init];
        photo1.title = @"Cat 1";
        photo1.image = [UIImage imageNamed:@"cat1.jpg"];
        
        Photo *photo2 = [[Photo alloc] init];
        photo2.title = @"Cat 2";
        photo2.image = [UIImage imageNamed:@"cat2.jpg"];
        
        Photo *photo3 = [[Photo alloc] init];
        photo3.title = @"Cat 3";
        photo3.image = [UIImage imageNamed:@"cat3.jpg"];
        
        self.allPhotos = @[photo1, photo2, photo3];
    }
    return self;
}
@end
















