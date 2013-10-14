//
//  ViewController.h
//  RGBSlider
//
//  Created by Seng Hin Mak on 23/3/13.
//  Copyright (c) 2013 42games. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *labelR;
@property (weak, nonatomic) IBOutlet UILabel *labelG;
@property (weak, nonatomic) IBOutlet UILabel *labelB;
@property (weak, nonatomic) IBOutlet UIView *colorBoxView;
@property (weak, nonatomic) IBOutlet UILabel *rgbLabel;

- (IBAction)sliderChanged:(UISlider*)sender;











@end
