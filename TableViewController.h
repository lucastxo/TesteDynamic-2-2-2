//
//  TableViewController.h
//  table_teste2
//
//  Created by VICTOR MUNHOZ THEODORO on 13/03/14.
//  Copyright (c) 2014 VICTOR MUNHOZ THEODORO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "foods.h"

@class TableViewController;
@protocol TableViewControllerDelegate <NSObject>

@required
-(void)returnFoodArray:(NSMutableArray*)foodsPickedArray;

@end

@interface TableViewController : UITableViewController
{
    id<TableViewControllerDelegate>delegate;
}

@property NSMutableArray *foodsArray;
@property NSMutableArray *foodsPick;
@property NSInteger *rowNumber;
@property(retain) id delegate;


-(void)viewTransitionBack;


@end
