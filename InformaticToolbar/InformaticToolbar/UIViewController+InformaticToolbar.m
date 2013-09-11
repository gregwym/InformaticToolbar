//
//  UIViewController+InformaticToolbar.m
//  InformaticToolbar
//
//  Created by Greg Wang on 12-10-13.
//  Copyright (c) 2012年 Greg Wang. All rights reserved.
//

#import "UIViewController+InformaticToolbar.h"
#import "objc/runtime.h"

static NSString * const ITBarItemSets = @"ITBarItemSets";
static NSString * const ITVisibleBarItemSet = @"ITVisibleBarItemSet";

@implementation UIViewController (InformaticToolbar)

- (NSArray *)barItemSets
{
	return [self getBarItemSets];
}

- (NSMutableArray *)getBarItemSets
{
	NSMutableArray *barItemSets = objc_getAssociatedObject(self, (__bridge const void *)(ITBarItemSets));
	if (barItemSets == nil) {
		barItemSets = [[NSMutableArray alloc] init];
		[self setBarItemSets:barItemSets];
	}
	return barItemSets;
}

- (void)setBarItemSets:(NSMutableArray *)barItemSets
{
	objc_setAssociatedObject(self, (__bridge const void *)(ITBarItemSets), nil, OBJC_ASSOCIATION_RETAIN);
	objc_setAssociatedObject(self, (__bridge const void *)(ITBarItemSets), barItemSets, OBJC_ASSOCIATION_RETAIN);
}

- (ITBarItemSet *)visibleBarItemSet
{
	return objc_getAssociatedObject(self, (__bridge const void *)(ITVisibleBarItemSet));
}

- (void)setVisibleBarItemSet:(ITBarItemSet *)visibleBarItemSet animated:(BOOL)animated
{
	// If is not in the array, stop
	if (visibleBarItemSet != nil && ![self.barItemSets containsObject:visibleBarItemSet]) {
		return;
	}
	
	// deassociate old object
	objc_setAssociatedObject(self, (__bridge const void *)(ITVisibleBarItemSet), nil, OBJC_ASSOCIATION_ASSIGN);
	
	// If is nil, hide everything
	if (visibleBarItemSet == nil) {
		[self updateToolbarToLatestStateAnimated:animated];
		[self setToolbarItems:@[] animated:animated];
		return;
	}
	
	// Construct the toolbar
	NSMutableArray *toolbarItems = [visibleBarItemSet.barItems mutableCopy];

	// If is dismissable
	if (visibleBarItemSet.dismissTarget != nil && [visibleBarItemSet.dismissTarget respondsToSelector:visibleBarItemSet.dismissAction]) {
		UIBarButtonItem *dismissButton = [[UIBarButtonItem alloc] initWithTitle:[NSString stringWithFormat:@"✕"] style:UIBarButtonItemStylePlain target:visibleBarItemSet action:@selector(dismiss:)];
		[toolbarItems addObject:dismissButton];
	}
	
	// If there are more than one set, show the switch button
	if ([self.barItemSets count] > 1) {
		UIBarButtonItem *indexButton = [[UIBarButtonItem alloc] initWithTitle:[NSString stringWithFormat:@"➲"] style:UIBarButtonItemStylePlain target:self action:@selector(showNextBarItemSet)];
		[toolbarItems insertObject:indexButton atIndex:0];
	}
	
	// Associate the object
	objc_setAssociatedObject(self, (__bridge const void *)(ITVisibleBarItemSet), visibleBarItemSet, OBJC_ASSOCIATION_ASSIGN);
	
	// Present the toolbar and items
	[self setToolbarItems:toolbarItems animated:animated];
	[self updateToolbarToLatestStateAnimated:animated];
}

#pragma mark - methods

- (void)showNextBarItemSet
{
	NSUInteger index = [self.barItemSets indexOfObject:self.visibleBarItemSet];
	index = (index + 1) % [self.barItemSets count];
	[self setVisibleBarItemSet:[self.barItemSets objectAtIndex:index] animated:YES];
}

- (void)updateToolbarToLatestStateAnimated:(BOOL)animated
{
	if (self.navigationController.topViewController == self) {
		[self.navigationController setToolbarHidden:self.visibleBarItemSet == nil animated:animated];
	}
}

- (void)pushBarItemSet:(ITBarItemSet *)barItemSet animated:(BOOL)animated;
{
	if (![self.barItemSets containsObject:barItemSet]) {
		[self appendBarItemSet:barItemSet];
	}
	
	// Set as visible bar item set
	[self setVisibleBarItemSet:barItemSet animated:animated];
}

- (void)appendBarItemSet:(ITBarItemSet *)barItemSet
{
	[[self getBarItemSets] addObject:barItemSet];
	if ([self.barItemSets count] > 1) {
		[self setVisibleBarItemSet:self.visibleBarItemSet animated:YES];
	}
}

- (void)removeBarItemSet:(ITBarItemSet *)barItemSet animated:(BOOL)animated
{
	NSUInteger index = [self.barItemSets indexOfObject:barItemSet];
	[[self getBarItemSets] removeObject:barItemSet];
	
	if (self.visibleBarItemSet == barItemSet) {
		NSUInteger count = [self.barItemSets count];
		barItemSet = count == 0 ? nil : index >= count ? [self.barItemSets objectAtIndex:index - 1] : [self.barItemSets objectAtIndex:index];
		
		[self setVisibleBarItemSet:barItemSet animated:animated];
	}
	else if ([self.barItemSets count] == 1) {
		[self setVisibleBarItemSet:self.visibleBarItemSet animated:YES];
	}
}

- (void)removeAllBarItemSetsAnimated:(BOOL)animated
{
	[[self getBarItemSets] removeAllObjects];
	[self setVisibleBarItemSet:nil animated:animated];
}

@end
