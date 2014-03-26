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
        _gravity = [[UIGravityBehavior alloc]init];
        _collision = [[UICollisionBehavior alloc]init];
        
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
        
        int py = 0;
        
        FoodCard *foodCard = [[FoodCard alloc]initWithFrame:CGRectMake(0,py , 320, 70)];
        [[foodCard nameLabel]setText:f.name];
        [[self view]addSubview:foodCard];
        [[self viewFoodsArray]addObject:foodCard];
        [[self gravity]addItem:foodCard];
        [[self animator]addBehavior:[self gravity]];
        [[self collision]addItem:foodCard];
        [[self collision]setTranslatesReferenceBoundsIntoBoundary:YES];
        [[self animator]addBehavior:[self collision]];
        
        NSLog(@"main:%@",f.name);
        
        py = py+60;
        
        
    }
}


-(void)returnFoodArray:(NSMutableArray *)foodsPickedArray{
    
    [[self pickedFoods]addObjectsFromArray:foodsPickedArray ];
}




- (IBAction)removeFoosViews:(id)sender {
    
    [[self viewFoodsArray]makeObjectsPerformSelector:@selector(removeFromSuperview)];
    for (UIView *view in _viewFoodsArray) {
        [[self gravity]removeItem:view];
        [[self collision]removeItem:view];
    }

}


- (IBAction)transition:(id)sender {
    
    [[self pickedFoods]removeAllObjects];
    [[self viewFoodsArray]removeAllObjects];
    [[self tbvc]setDelegate:self];
    [self presentViewController:_tbvc animated:YES completion:nil];
    
}

-(void)printFoodsFromArray{
    
    if (_pickedFoods != nil) {
        for (foods *f in _pickedFoods) {
            NSLog(@"nome comida: %@",f.name);
        }
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
