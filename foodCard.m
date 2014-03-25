//
//  foodCard.m
//  TesteDynamic
//
//  Created by LUCAS TEIXEIRA DE OLIVEIRA on 12/03/14.
//  Copyright (c) 2014 LUCAS TEIXEIRA DE OLIVEIRA. All rights reserved.
//

#import "foodCard.h"

@implementation foodCard




-(id)initWithProperties:(NSString *)foodName andCalories:(double)kalories andPrice:(double)pricez{
    self =[super init];
    
    if (self) {
        self.name = foodName;
        self.calories = kalories;
        self.price = pricez;
        
        CGRect nameFrame = CGRectMake(5, 5, 60, 10);
        CGRect PriceFrame = CGRectMake(5, 25, 60, 10);
        CGRect caloriesFrame = CGRectMake(5, 45, 60, 10);
        
        
        _priceTag = [[UILabel alloc]initWithFrame:PriceFrame];
        _nameTag = [[UILabel alloc]initWithFrame:nameFrame];
        _caloriesTag = [[UILabel alloc]initWithFrame:caloriesFrame];
        
       
        [_priceTag setFont:[UIFont fontWithName:@"Helvetica" size:8]];
        [_nameTag setFont:[UIFont fontWithName:@"Helvetica" size:8]];
        [_caloriesTag setFont:[UIFont fontWithName:@"Helvetica" size:8]];
        
        self.nameTag.text = foodName;
        self.priceTag.text = [NSString stringWithFormat:@"Price: %.2f", pricez];
        self.caloriesTag.text = [NSString stringWithFormat:@"Calories: %.2f", kalories];
        
        self.nameTag.backgroundColor = [UIColor whiteColor];
        self.priceTag.backgroundColor = [UIColor whiteColor];
        self.caloriesTag.backgroundColor = [UIColor whiteColor];
        
//        [self addSubview:_nameTag];
//        [self addSubview:_caloriesTag];
//        [self addSubview:_priceTag];
        
        
       
    }
    
    return self;
}






@end

