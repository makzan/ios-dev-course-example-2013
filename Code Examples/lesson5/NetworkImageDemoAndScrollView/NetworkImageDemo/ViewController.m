//
//  ViewController.m
//  NetworkImageDemo
//
//  Created by Seng Hin Mak on 5/10/13.
//  Copyright (c) 2013 Thomas. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+AFNetworking.h"
#import "UIView+Position.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSURL *albumUrl = [NSURL URLWithString:@"http://graph.facebook.com/663338843678077/photos"];
    NSURLRequest *request = [NSURLRequest requestWithURL:albumUrl];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        NSArray *data = [JSON objectForKey:@"data"];
        
        for (int i = 0; i < [data count]; i++) {
            float x = i * 320;
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(x, 0, 320, 460)];
            imgView.contentMode = UIViewContentModeScaleAspectFill;
            imgView.clipsToBounds = YES;
            
            // API path: data[i] -> images[2] -> source            
            NSArray *images = [data[i] objectForKey:@"images"];
            NSString *src = [images[2] objectForKey:@"source"];
            
            NSURL *imgURL = [NSURL URLWithString:src];            
            
            [imgView setImageWithURL:imgURL];
            
            [self.scrollView addSubview:imgView];
        }
        self.scrollView.contentSize = CGSizeMake(320 * [data count], 460);

        self.scrollView.pagingEnabled = YES;
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        //
    }];
    [operation start];
    
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

@end












