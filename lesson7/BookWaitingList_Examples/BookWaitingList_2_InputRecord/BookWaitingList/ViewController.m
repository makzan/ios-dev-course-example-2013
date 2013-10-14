//
//  ViewController.m
//  BookWaitingList
//
//  Created by Seng Hin Mak on 14/10/13.
//  Copyright (c) 2013 Thomas. All rights reserved.
//

#import "ViewController.h"
#import "Book.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *bookList;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Read the book list from CoreData
    self.bookList = [Book MR_findAll];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressedSaveButton:(id)sender {
    Book *book = [Book MR_createEntity];
    book.title = self.bookTitleLabel.text;
    book.isbn = self.bookISBNLabel.text;
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    
    [self.bookTitleLabel resignFirstResponder];
    [self.bookISBNLabel resignFirstResponder];
    
    // Clear the label
    self.bookTitleLabel.text = @"";
    self.bookISBNLabel.text = @"";
    
    // Read the book list from CoreData, again
    self.bookList = [Book MR_findAll];
    
    // Refresh the table
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.bookList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    Book *book = (Book*)self.bookList[indexPath.row];
    cell.textLabel.text = book.title;
    cell.detailTextLabel.text = book.isbn;
    
    return cell;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame = self.view.frame;
    frame.origin.y = -195;
    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame = frame;
    }];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == self.bookISBNLabel) {
        CGRect frame = self.view.frame;
        frame.origin.y = 20;
        [UIView animateWithDuration:0.3 animations:^{
            self.view.frame = frame;
        }];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.bookTitleLabel) {
        [self.bookISBNLabel becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    return NO;
}







@end
