//
//  ViewController.m
//  ClassicPhotos
//
//  Created by optimusmac4 on 8/21/15.
//  Copyright (c) 2015 optimusmac4. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    
    self.title = @"Testing For NSOperations";
    self.tableView.rowHeight = 80.0;
    [super viewDidLoad];
     // Do any additional setup after loading the view, typically from a nib.

}

- (void)viewDidUnload {

    [self setPhotos:nil];   // Empty the data source on Unloading the View
    [super viewDidUnload];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Lazy instantiation

- (NSDictionary *)photos {
    
    if (!_photos) {
        NSURL *dataSourceURL = [NSURL URLWithString:kDatasourceURLString]; // initializing the URL with dataSource URL
        _photos = [[NSDictionary alloc] initWithContentsOfURL:dataSourceURL];
    }
    return _photos;
}

#pragma - UITableView datasource and delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = self.photos.count;
    return count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *kCellIdentifier = @"Cell Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
   
    NSString *rowKey = [[self.photos allKeys] objectAtIndex:indexPath.row];
    NSURL *imageURL = [NSURL URLWithString:[self.photos objectForKey:rowKey]];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage *image = nil;
    
  
    if (imageData) {
        UIImage *unfiltered_image = [UIImage imageWithData:imageData];
        image = [self applySepiaFilterToImage:unfiltered_image];
    }
    
    cell.textLabel.text = rowKey;
    cell.imageView.image = image;
    
    return cell;
}

#pragma mark - Image filtration


- (UIImage *)applySepiaFilterToImage:(UIImage *)image {
    
    CIImage *inputImage = [CIImage imageWithData:UIImagePNGRepresentation(image)];
    UIImage *sepiaImage = nil;
    CIContext *context = [CIContext contextWithOptions:nil];
    CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone" keysAndValues: kCIInputImageKey, inputImage, @"inputIntensity", [NSNumber numberWithFloat:0.8], nil];
    CIImage *outputImage = [filter outputImage];
    CGImageRef outputImageRef = [context createCGImage:outputImage fromRect:[outputImage extent]];
    sepiaImage = [UIImage imageWithCGImage:outputImageRef];
    CGImageRelease(outputImageRef);
    return sepiaImage;
}


@end
