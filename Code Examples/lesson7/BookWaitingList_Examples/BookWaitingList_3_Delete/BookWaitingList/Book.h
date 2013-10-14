//
//  Book.h
//  BookWaitingList
//
//  Created by Seng Hin Mak on 14/10/13.
//  Copyright (c) 2013 Thomas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Book : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * isbn;

@end
