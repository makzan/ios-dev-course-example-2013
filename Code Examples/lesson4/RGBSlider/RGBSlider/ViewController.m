//
//  ViewController.m
//  RGBSlider
//
//  Created by Seng Hin Mak on 23/3/13.
//  Copyright (c) 2013 42games. All rights reserved.
//

#import "ViewController.h"

#define SLIDER_R    1
#define SLIDER_G    2
#define SLIDER_B    3

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *labels;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.labels = [NSMutableArray arrayWithCapacity:4];
    [self.labels addObject:[NSNull null]];
    self.labels[SLIDER_R] = self.labelR;
    self.labels[SLIDER_G] = self.labelG;
    self.labels[SLIDER_B] = self.labelB;
    NSLog(@"%@", self.labels);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderChanged:(UISlider*)sender {
    for (int i = SLIDER_R; i<=SLIDER_B; i++) {
        if (sender.tag == i) {
            UILabel *label = self.labels[i];
            label.text = [NSString stringWithFormat:@"%.0f", sender.value];
        }
    }
    
    int r = self.labelR.text.intValue;
    int g = self.labelG.text.intValue;
    int b = self.labelB.text.intValue;
    
    self.colorBoxView.backgroundColor = [UIColor colorWithRed:r/255.0f
                                                        green:g/255.0f
                                                         blue:b/255.0f
                                                        alpha:1];
    
    self.rgbLabel.text = [NSString stringWithFormat:@"#%02X%02X%02X", r, g, b];
    
    // change label text based on dark or light color background.
    if (r+g+b < 255*3/2) {
        self.rgbLabel.textColor = [UIColor whiteColor];
    } else {
        self.rgbLabel.textColor = [UIColor blackColor];
    }
    
}
@end


























