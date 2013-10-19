//
//  ViewController.m
//  TableViewDemo
//
//  Created by Seng Hin Mak on 19/10/13.
//  Copyright (c) 2013 Thomas. All rights reserved.
//
#import "ViewController.h"

@interface ViewController (){
    int chosenIndex;
}
@property (nonatomic, strong) NSArray *bookList;
@property (nonatomic, strong) NSMutableArray *statuses;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.bookList = @[@"Programming iOS7",
                      @"Master JavaScript",
                      @"iOS for beginner",
                      @"Ruby on Rails",
                      @"Programming iOS7",
                      @"Master JavaScript",
                      @"iOS for beginner",
                      @"Ruby on Rails",
                      @"Programming iOS7",
                      @"Master JavaScript",
                      @"iOS for beginner",
                      @"Ruby on Rails",
                      @"Programming iOS7",
                      @"Master JavaScript",
                      @"iOS for beginner",
                      @"Ruby on Rails",
                      @"Master JavaScript",
                      @"iOS for beginner",
                      @"Ruby on Rails",
                      @"Programming iOS7",
                      @"Master JavaScript",
                      @"iOS for beginner",
                      @"Ruby on Rails",
                      @"Programming iOS7",
                      @"Master JavaScript",
                      @"iOS for beginner",
                      @"Ruby on Rails",
                      @"Master JavaScript",
                      @"iOS for beginner",
                      @"Ruby on Rails",
                      @"Programming iOS7",
                      @"Master JavaScript",
                      @"iOS for beginner",
                      @"Ruby on Rails",
                      @"Programming iOS7",
                      @"Master JavaScript",
                      @"iOS for beginner",
                      @"Ruby on Rails"];
    
    self.statuses = [NSMutableArray arrayWithCapacity:30];
    for (int i = 0; i < [self.bookList count]; i++) {
        [self.statuses addObject:@(NO)];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark -
# pragma mark Table View DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return [self.bookList count];
    }
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"normal";
    if (indexPath.section == 1) {
        identifier = @"switch cell";
    }
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        if (indexPath.section == 1) {
            UISwitch *switchView = [[UISwitch alloc] init];
            [switchView addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
            cell.accessoryView = switchView;
        }
    }
    
    if (indexPath.section == 0) {
        cell.textLabel.text = @"Add New Book";
    } else if (indexPath.section == 1 ) {
        cell.textLabel.text = self.bookList[indexPath.row];
        
        
        UISwitch *switchView = (UISwitch*)cell.accessoryView;
        switchView.on = [self.statuses[indexPath.row] boolValue];
        switchView.tag = indexPath.row;
        
        
        
//        cell.accessoryType = UITableViewCellAccessoryNone;
//        if (indexPath.row == chosenIndex) {
//            cell.accessoryType = UITableViewCellAccessoryCheckmark;            
//        }

    }

    
    
    return cell;
}

#pragma mark Table View Delegates

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    chosenIndex = indexPath.row;
    
    [tableView reloadData];
}

- (void)switchValueChanged:(UISwitch*)sender
{
    NSLog(@"Switch %d : Value Changed %d. %@", sender.tag, sender.on, self.bookList[sender.tag]);
    self.statuses[sender.tag] = @(sender.on);
}

@end



















