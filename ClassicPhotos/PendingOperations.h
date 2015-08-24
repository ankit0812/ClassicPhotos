//
//  PendingOperations.h
//  ClassicPhotos
//
//  Created by optimusmac4 on 8/24/15.
//  Copyright (c) 2015 optimusmac4. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PendingOperations : NSObject

@property(nonatomic,strong) NSMutableDictionary *downloadInProgress;
@property(nonatomic,strong) NSOperationQueue *downloadQueue;

@property(nonatomic,strong) NSMutableDictionary *filtrationsInProgress;
@property(nonatomic,strong) NSOperationQueue *filtrationQueue;

@end
