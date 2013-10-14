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
    
    // Testing Code
    Book *book = [Book MR_createEntity];
    book.title = @"Programming iOS7";
    book.isbn = @"1234567890123";
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    // End Testing Code
    
    // Read the book list from CoreData
    self.bookList = [Book MR_findAll];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressedSaveButton:(id)sender {
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










@end
