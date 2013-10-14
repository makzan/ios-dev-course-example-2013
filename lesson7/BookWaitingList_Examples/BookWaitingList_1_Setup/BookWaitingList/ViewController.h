//
//  ViewController.h
//  BookWaitingList
//
//  Created by Seng Hin Mak on 14/10/13.
//  Copyright (c) 2013 Thomas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *bookTitleLabel;
@property (weak, nonatomic) IBOutlet UITextField *bookISBNLabel;
- (IBAction)pressedSaveButton:(id)sender;

@end
