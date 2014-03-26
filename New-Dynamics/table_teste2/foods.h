//
//  foods.h
//  teste_tabela
//
//  Created by VICTOR MUNHOZ THEODORO on 12/03/14.
//  Copyright (c) 2014 VICTOR MUNHOZ THEODORO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface foods : NSObject

@property NSString *name;
@property double *price;
@property double *kal;

-(id)initWithProperties:(NSString*)nameFood andkalories:(double)kalories andPrice:(double)pricez;

@end
