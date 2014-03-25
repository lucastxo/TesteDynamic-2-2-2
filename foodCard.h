//
//  foodCard.h
//  TesteDynamic
//
//  Created by LUCAS TEIXEIRA DE OLIVEIRA on 12/03/14.
//  Copyright (c) 2014 LUCAS TEIXEIRA DE OLIVEIRA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TryBehavior.h"

@interface foodCard : UIView

@property double calories;
@property double price;
@property NSString* name;
@property UILabel *caloriesTag;
@property UILabel *priceTag;
@property UILabel *nameTag;
@property UIView *imagem;


-(id)initWithProperties:(NSString*)foodName andCalories:(double)kalories andPrice:(double)pricez;


@end
