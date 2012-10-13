//
//  ITBarItemSet.m
//  InformaticToolbar
//
//  Created by Greg Wang on 12-10-13.
//  Copyright (c) 2012年 Greg Wang. All rights reserved.
//

#import "ITBarItemSet.h"

@interface ITBarItemSet ()

@property (nonatomic, strong) NSArray *barButtonItems;

@end

@implementation ITBarItemSet

@synthesize barButtonItems = _barButtonItems;
@synthesize dismissTarget = _dismissTarget;
@synthesize dismissAction = _dismissAction;

- (ITBarItemSet *)initWithItems:(NSArray *)barButtonItems
{
	self = [super init];
	if (self != nil) {
		self.barButtonItems = barButtonItems;
	}
	return self;
}

- (ITBarItemSet *)initWithItems:(NSArray *)barButtonItems withDismissTarget:(id)target action:(SEL)action
{
	self = [super init];
	if (self != nil) {
		self.barButtonItems = barButtonItems;
		self.dismissTarget = target;
		self.dismissAction = action;
	}
	return self;
}

@end
