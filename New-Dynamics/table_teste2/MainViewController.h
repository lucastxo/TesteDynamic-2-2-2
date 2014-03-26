//
//  MainViewController.h
//  table_teste2
//
//  Created by VICTOR MUNHOZ THEODORO on 13/03/14.
//  Copyright (c) 2014 VICTOR MUNHOZ THEODORO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewController.h"
#import "FoodCard.h"


@interface MainViewController : UIViewController<TableViewControllerDelegate , UIDynamicItem, UIDynamicAnimatorDelegate>

@property TableViewController *tbvc;

@property NSMutableArray *pickedFoods;
@property NSMutableArray *viewFoodsArray;
@property(nonatomic, strong) UIDynamicAnimator *animator;

@property(nonatomic, strong) UIGravityBehavior *gravity;
@property(nonatomic, strong) UICollisionBehavior *collision;



- (IBAction)removeFoosViews:(id)sender;

- (IBAction)transition:(id)sender;

-(void)printFoodsFromArray;

@end
