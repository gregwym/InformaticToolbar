//
//  ITBarItemSet.m
//  InformaticToolbar
//
//  Created by Greg Wang on 12-10-13.
//  Copyright (c) 2012年 Greg Wang. All rights reserved.
//

#import "ITBarItemSet.h"

@interface ITBarItemSet ()

@property (nonatomic, strong) NSArray *barItems;

@end

@implementation ITBarItemSet

@synthesize barItems = _barItems;
@synthesize dismissTarget = _dismissTarget;
@synthesize dismissAction = _dismissAction;

- (ITBarItemSet *)initWithItems:(NSArray *)barItems
{
	self = [super init];
	if (self != nil) {
		self.barItems = barItems;
		self.dismissTarget = nil;
		self.dismissAction = nil;
	}
	return self;
}

- (ITBarItemSet *)initWithItems:(NSArray *)barItems withDismissTarget:(id)target action:(SEL)action
{
	self = [super init];
	if (self != nil) {
		self.barItems = barItems;
		self.dismissTarget = target;
		self.dismissAction = action;
	}
	return self;
}

- (IBAction)dismiss:(id)sender
{
	NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self.dismissTarget selector:self.dismissAction object:self];
	[[NSOperationQueue mainQueue] addOperation:operation];
}

@end
