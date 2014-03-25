//
//  TryBehavior.h
//  TesteDynamic
//
//  Created by LUCAS TEIXEIRA DE OLIVEIRA on 11/03/14.
//  Copyright (c) 2014 LUCAS TEIXEIRA DE OLIVEIRA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TryBehavior : UIDynamicBehavior

-(void)addItem:(id<UIDynamicItem>)item;
-(void)removeItem:(id<UIDynamicItem>)item;

@end
