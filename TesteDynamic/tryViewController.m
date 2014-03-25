//
//  tryViewController.m
//  TesteDynamic
//
//  Created by LUCAS TEIXEIRA DE OLIVEIRA on 11/03/14.
//  Copyright (c) 2014 LUCAS TEIXEIRA DE OLIVEIRA. All rights reserved.
//

#import "tryViewController.h"
#import "foodCard.h"
#import "TryBehavior.h"
#import "Diagonal.h"
#import "CircleCustomGesture.h"

@interface tryViewController () <UIDynamicAnimatorDelegate>
@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (strong, nonatomic) TryBehavior *tryBehavior;
@property (weak, nonatomic) IBOutlet UIView *dropView;
@property (strong, nonatomic) NSMutableArray* foodsArray1;
@property (strong, nonatomic) UIView *flippedView;
@property (strong, nonatomic) NSString *joined;




@property double totalPrice;
@property double totalCalories;


@end

@implementation tryViewController

static const CGSize DROP_SIZE = { 70, 70 };



-(TryBehavior *)tryBehavior{
    if(!_tryBehavior){
        self.tryBehavior = [[TryBehavior alloc]init];
        [self.animator addBehavior:[self tryBehavior]];
    }
    return  _tryBehavior;
}

-(UIDynamicAnimator *)animator{
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.dropView];
        _animator.delegate = self;
    }
    return _animator;
}

-(NSMutableArray *)foodsArray{
    if (!_foodsArray1) {
        _foodsArray1 = [[NSMutableArray alloc]init];
    }
    return _foodsArray1;
}





-(IBAction)deleteView:(UITapGestureRecognizer*)sender{
    if (!_foodsArray1) {
        return;
    }
    else{
        _totalPrice = 0;
        _totalCalories = 0;
        for (UIView *d in _foodsArray1) {
            [d removeFromSuperview];
            [[self tryBehavior]removeItem:d];
            
            
        }
        [_foodsArray1 removeAllObjects];
        [_pickedFoods removeAllObjects];
        
        
        
    }
}



-(double)calculaPrice{
    if (!_foodsArray1) {
        return 0;
    }
    else{
        _totalPrice = 0;
        for (foodCard *d in _foodsArray1) {
            _totalPrice += d.price;
            //NSLog(@"%.2f", _totalPrice);
            
        }
    }
    return _totalPrice;
}

-(double)calculaCalories{
    if (!_foodsArray1) {
        return 0;
    }
    else{
        _totalCalories = 0;
        for (foodCard *d in _foodsArray1) {
            _totalCalories += d.calories;
            
            
        }

    }
    
    return _totalCalories;
    
}

-(void)getName{
    
    if (!_pickedFoods) {
        return;
    }
    else{
        
        NSMutableArray *receiveString = [[NSMutableArray alloc]init];
        
        for(foodCard *d in _foodsArray1){
            [receiveString addObject:d.name];
        }
        _joined = [[NSString alloc]init];
        _joined = [receiveString componentsJoinedByString:@", "];
    
    }
}




-(void)drop{
    CGRect frame;
    frame.origin = CGPointZero;
    frame.size = DROP_SIZE;
    int x =(arc4random()%(int)self.dropView.bounds.size.width)/DROP_SIZE.width;
    frame.origin.x = x * DROP_SIZE.width;
    
    
    
    for (NSString *d in _pickedFoods) {
        
        if ([d  isEqual:@"Coxinha"]) {
            foodCard *coxinha = [[foodCard alloc]initWithProperties:@"Coxinha" andCalories:500 andPrice:5.0];
            coxinha.frame = frame;
            [coxinha setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"coxinha.png"]]];
            
            
            
            
            [[self dropView]addSubview:coxinha];
            [[self tryBehavior]addItem:coxinha];
            [[self foodsArray]addObject:coxinha];
        }
        
        else if ([d isEqual:@"Orange juice"]){
            foodCard *coxinha = [[foodCard alloc]initWithProperties:@"Orange juice" andCalories:350 andPrice:3.5];
            coxinha.frame = frame;
            [coxinha setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"sucolaranja.png"]]];
            
            
            [[self dropView]addSubview:coxinha];
            [[self tryBehavior]addItem:coxinha];
            [[self foodsArray]addObject:coxinha];
        }
        
        else if ([d isEqual:@"Magnum"]){
            foodCard *coxinha = [[foodCard alloc]initWithProperties:@"Magnum" andCalories:700 andPrice:6.0];
            coxinha.frame = frame;
            [coxinha setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"magnum.png"]]];
            
            
            [[self dropView]addSubview:coxinha];
            [[self tryBehavior]addItem:coxinha];
            [[self foodsArray]addObject:coxinha];
        }
        
    
    
    }
    
    
   
    }




- (UIColor *)randomColor
{
    switch (arc4random()%5) {
        case 0: return [UIColor greenColor];
        case 1: return [UIColor blueColor];
        case 2: return [UIColor orangeColor];
        case 3: return [UIColor redColor];
        case 4: return [UIColor purpleColor];
    }
    return [UIColor blackColor];
}

-(void) goToSeconVC
{
    [self getName];
    _flippedView = [[UIView alloc]initWithFrame:CGRectMake(0,0,[[UIScreen mainScreen] applicationFrame].size.width,
                                                           [[UIScreen mainScreen] applicationFrame].size.height)];
    [_flippedView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"layout_view3.jpg"]]];
    
    UILabel *price = [[UILabel alloc]initWithFrame:CGRectMake(50, 350, 100, 30)];
    
    price.text = [NSString stringWithFormat:@"Price: %.2f", [self calculaPrice]];
    
    UILabel *calories = [[UILabel alloc]initWithFrame:CGRectMake(50, 290, 150, 30)];
    
    calories.text = [NSString stringWithFormat:@"Calories: %.2f", [self calculaCalories]];
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(50, 230, 200, 30)];
    
    name.text = _joined;
    
    [_flippedView addGestureRecognizer:[[CircleCustomGesture alloc]initWithTarget:self action:@selector(goToFirstVC)]];
    [_flippedView addSubview:price];
    [_flippedView addSubview:calories];
    [_flippedView addSubview:name];
    
    [UIView transitionFromView:self.view toView:_flippedView duration:1.0 options:UIViewAnimationOptionTransitionFlipFromRight completion:nil];
    

    
}

-(void) goToFirstVC{
    [UIView transitionFromView:_flippedView toView:self.view duration:1.0 options:UIViewAnimationOptionTransitionFlipFromRight completion:nil];
    
}





-(void)returnFoodArray:(NSMutableArray *)foodsPickedArray{
    
    [[self pickedFoods]addObjectsFromArray:foodsPickedArray];
}
    


- (void)viewDidLoad
{
    
    [_dropView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"layout_view2.png"]]];

    
    self.pickedFoods = [[NSMutableArray alloc]init];
    _tbvc = [[TableViewController alloc]init];
    [[self tbvc]setDelegate:self];
    
    Diagonal *diagonalGesture = [[Diagonal alloc]initWithTarget:self action:@selector(deleteView:)];
    
    [self.dropView addGestureRecognizer:[[CircleCustomGesture alloc]initWithTarget:self action:@selector(goToSeconVC)]];
    [[self dropView]addGestureRecognizer:diagonalGesture];
    
}

-(void)viewDidDisappear:(BOOL)animated{
    [_pickedFoods removeAllObjects];
    
    
    
}

    
-(void)viewDidAppear:(BOOL)animated{
    [self drop];
}



- (IBAction)transition:(id)sender {
    
    
    [[self tbvc]setDelegate:self ];
    [self presentViewController:_tbvc animated:YES completion:nil];
}

-(void)printFoodsFromArray{
    
    if (_pickedFoods != nil) {
        for (foodCard *f in _pickedFoods) {
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
