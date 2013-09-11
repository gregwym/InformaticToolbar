//
//  ITConfirmationBarItemSet.m
//  InformaticToolbar
//
//  Created by Greg Wang on 12-10-14.
//  Copyright (c) 2012年 Greg Wang. All rights reserved.
//

#import "ITConfirmationBarItemSet.h"

@implementation ITConfirmationBarItemSet

@synthesize confirmAction = _confirmAction;

- (ITConfirmationBarItemSet *)init
{
	UIBarButtonItem *confirmButton = [[UIBarButtonItem alloc] initWithTitle:[NSString stringWithFormat:@"✓"] style:UIBarButtonItemStylePlain target:nil action:nil];
	
	self = [super initWithItems:@[confirmButton]];
	if (self != nil) {
		confirmButton.target = self;
		confirmButton.action = @selector(confirm:);
	}
	return self;
}

+ (ITConfirmationBarItemSet *)confirmationBarItemSetWithTarget:(id)target andConfirmAction:(SEL)confirmAction andDismissAction:(SEL)dismissAction;
{
	ITConfirmationBarItemSet *confirmationBarItemSet = [[ITConfirmationBarItemSet alloc] init];
	if (confirmationBarItemSet != nil) {
		confirmationBarItemSet.dismissTarget = target;
		confirmationBarItemSet.dismissAction = dismissAction;
		confirmationBarItemSet.confirmAction = confirmAction;
	}
	return confirmationBarItemSet;
}

- (IBAction)confirm:(id)sender
{
	NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self.dismissTarget selector:self.confirmAction object:self];
	[[NSOperationQueue mainQueue] addOperation:operation];
}

@end
