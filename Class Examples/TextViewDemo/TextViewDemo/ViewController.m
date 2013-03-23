//
//  ViewController.m
//  TextViewDemo
//
//  Created by Seng Hin Mak on 23/3/13.
//  Copyright (c) 2013 42games. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CGRect frame = self.view.frame;
    frame.origin.y = -80;
    
    [UIView animateWithDuration:.25 animations:^{
        self.view.frame = frame;
    } completion:^(BOOL finished) {
        [self.feedbackTextView becomeFirstResponder];
    }];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    CGRect frame = self.view.frame;
    frame.origin.y = -80;

    [UIView animateWithDuration:.25 animations:^{
        self.view.frame = frame;
    }];

}
- (void)textViewDidEndEditing:(UITextView *)textView {
    CGRect frame = self.view.frame;
    frame.origin.y = 20;
    [UIView animateWithDuration:.25 animations:^{
        self.view.frame = frame;
    }];
}










@end
