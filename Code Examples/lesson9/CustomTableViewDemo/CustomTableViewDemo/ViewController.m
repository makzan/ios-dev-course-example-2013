//
//  ViewController.m
//  CustomTableViewDemo
//
//  Created by Seng Hin Mak on 9/11/13.
//  Copyright (c) 2013 Twinsgames. All rights reserved.
//

#import "ViewController.h"
#import "Photos.h"
#import "Photo.h"

@interface ViewController ()
@property (nonatomic, strong) Photos *photos;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.photos = [[Photos alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.photos.allPhotos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:nil] forCellReuseIdentifier:@"photo cell"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"photo cell"];
    
    Photo *photo = self.photos.allPhotos[indexPath.row];
    
    UILabel *label = (UILabel*)[cell viewWithTag:1001];
    label.text = photo.title;
    
    UIImageView *imgView = (UIImageView *)[cell viewWithTag:1002];
    imgView.image = photo.image;
    
    return cell;    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

@end


















