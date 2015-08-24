//
//  PendingOperations.m
//  ClassicPhotos
//
//  Created by optimusmac4 on 8/24/15.
//  Copyright (c) 2015 optimusmac4. All rights reserved.
//

#import "PendingOperations.h"

@implementation PendingOperations

-(NSMutableDictionary *)downloadInProgress{
    if(!_downloadInProgress){
        _downloadInProgress=[[NSMutableDictionary alloc]init];
    }
    return _downloadInProgress;
}

-(NSOperationQueue *)downloadQueue{             //For the Download Queue
    if(!_downloadQueue){
        _downloadQueue=[[NSOperationQueue alloc]init];
        _downloadQueue.name=@"Download Queue";
        _downloadQueue.maxConcurrentOperationCount=1;
    }
    return _downloadQueue;
}

-(NSMutableDictionary *)filtrationsInProgress{
    if(!_filtrationsInProgress){
        _filtrationsInProgress=[[NSMutableDictionary alloc]init];
    }
    return _filtrationsInProgress;
}

-(NSOperationQueue *)filtrationQueue{           // For the Filtration Queue
    if(!_filtrationQueue){
        _filtrationQueue=[[NSOperationQueue alloc]init];
        _filtrationQueue.name=@"Image Filtration Queue";
        _filtrationQueue.maxConcurrentOperationCount=1;
    }
    return _filtrationQueue;
}
@end
