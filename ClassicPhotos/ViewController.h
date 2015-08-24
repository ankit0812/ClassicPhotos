//
//  ViewController.h
//  ClassicPhotos
//
//  Created by optimusmac4 on 8/21/15.
//  Copyright (c) 2015 optimusmac4. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>
#define kDatasourceURLString @"http://www.raywenderlich.com/downloads/ClassicPhotosDictionary.plist"       

//our URL which will have the datasource

@interface ViewController : UITableViewController

@property (nonatomic, strong) NSDictionary *photos; //main data source of controller

@end

