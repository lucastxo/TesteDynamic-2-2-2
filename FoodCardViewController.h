//
//  FoodCardViewController.h
//  table_teste2
//
//  Created by Victor Munhoz Theodoro on 22/03/14.
//  Copyright (c) 2014 VICTOR MUNHOZ THEODORO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodCardViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *foodImage;
@property (strong, nonatomic) IBOutlet UILabel *foodName;
@property (strong, nonatomic) IBOutlet UILabel *foodCalories;

@end
