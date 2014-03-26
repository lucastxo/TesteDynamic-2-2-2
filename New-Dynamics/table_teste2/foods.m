//
//  foods.m
//  teste_tabela
//
//  Created by VICTOR MUNHOZ THEODORO on 12/03/14.
//  Copyright (c) 2014 VICTOR MUNHOZ THEODORO. All rights reserved.
//

#import "foods.h"

@implementation foods

-(id)initWithProperties:(NSString*)nameFood andkalories:(double)kalories andPrice:(double)pricez{
   
    self = [super init];
    if (self) {
        
        self.name = nameFood;
        self.kal = &(kalories);
        self.price = &(pricez);
        
    }
    
    return self;
}



@end
