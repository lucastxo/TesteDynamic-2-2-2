//
//  tryViewController.h
//  TesteDynamic
//
//  Created by LUCAS TEIXEIRA DE OLIVEIRA on 11/03/14.
//  Copyright (c) 2014 LUCAS TEIXEIRA DE OLIVEIRA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TryBehavior.h"
#import "TableViewController.h"

@interface tryViewController : UIViewController <UIGestureRecognizerDelegate, UIViewControllerTransitioningDelegate>

@property TableViewController *tbvc;

@property NSMutableArray *pickedFoods;


- (IBAction)transition:(id)sender;

-(void)printFoodsFromArray;


@end
