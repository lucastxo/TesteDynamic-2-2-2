//
//  MainViewController.m
//  table_teste2
//
//  Created by VICTOR MUNHOZ THEODORO on 13/03/14.
//  Copyright (c) 2014 VICTOR MUNHOZ THEODORO. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.pickedFoods = [[NSMutableArray alloc]init];
        _tbvc = [[TableViewController alloc]init];
        [[self tbvc]setDelegate:self];
        _viewFoodsArray = [[NSMutableArray alloc]init];
        _animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  
    
    
    
    
   
   
}
-(void)viewDidAppear:(BOOL)animated{
    
    for (foods *f in _pickedFoods) {
        
        FoodCard *foodCard = [[FoodCard alloc]initWithFrame:CGRectMake(0, 10, 320, 70)];
        [[foodCard nameLabel]setText:f.name];
        [[self view]addSubview:foodCard];
        [[self viewFoodsArray]addObject:foodCard];
        [_animator addBehavior:[foodCard gravity]];
        [_animator addBehavior:[foodCard collision]];
        NSLog(@"main:%@",f.name);
        
        
    }
}

-(void)returnFoodArray:(NSMutableArray *)foodsPickedArray{
    
    [[self pickedFoods]addObjectsFromArray:foodsPickedArray ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)removeFoosViews:(id)sender {
    
    [_viewFoodsArray removeAllObjects];

}

- (IBAction)transition:(id)sender {
    
   
    [[self tbvc]setDelegate:self ];
    [self presentViewController:_tbvc animated:YES completion:nil];
}

-(void)printFoodsFromArray{
    
    if (_pickedFoods != nil) {
        for (foods *f in _pickedFoods) {
            NSLog(@"nome comida: %@",f.name);
        }
    }
    
    
}

@end
