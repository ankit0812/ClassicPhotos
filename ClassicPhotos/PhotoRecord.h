//
//  PhotoRecord.h
//  ClassicPhotos
//
//  Created by optimusmac4 on 8/24/15.
//  Copyright (c) 2015 optimusmac4. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PhotoRecord : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) UIImage *image;
@property (nonatomic,strong) NSURL *URL;
@property (nonatomic,readonly) BOOL hasImage;
@property (nonatomic, getter=isFiltered) BOOL filtered;
@property (nonatomic, getter=isFailed) BOOL failed;

@end
