//
//  PhotoRecord.m
//  ClassicPhotos
//
//  Created by optimusmac4 on 8/24/15.
//  Copyright (c) 2015 optimusmac4. All rights reserved.
//

#import "PhotoRecord.h"

@implementation PhotoRecord

-(BOOL)isFailed{
    return _failed;
}

-(BOOL)isFiltered{
    return _filtered;
}

-(BOOL)hasImage{
    return _image!=nil;
}

@end
