//
//  FoodCard.m
//  table_teste2
//
//  Created by Victor Munhoz Theodoro on 22/03/14.
//  Copyright (c) 2014 VICTOR MUNHOZ THEODORO. All rights reserved.
//

#import "FoodCard.h"

@implementation FoodCard

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _nameLabel = [[UILabel alloc]init];
        [[self nameLabel]setFrame:CGRectMake(160, 30, 100, 50)];
        [[self nameLabel]setTextColor:[UIColor blackColor]];
        [self addSubview:_nameLabel];
        self.backgroundColor = [UIColor orangeColor];
               

        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
}


@end
