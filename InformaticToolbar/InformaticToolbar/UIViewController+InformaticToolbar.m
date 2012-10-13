//
//  UIViewController+InformaticToolbar.m
//  InformaticToolbar
//
//  Created by Greg Wang on 12-10-13.
//  Copyright (c) 2012年 Greg Wang. All rights reserved.
//

#import "UIViewController+InformaticToolbar.h"

@implementation UIViewController (InformaticToolbar)

- (void)pushBarButtonItemSet:(ITBarItemSet *)barButtonItemSet animated:(BOOL)animated;
{
	NSMutableArray *toolbarItems = [barButtonItemSet.barButtonItems mutableCopy];
	[toolbarItems insertObject:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil] atIndex:0];
	[toolbarItems addObject:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil]];
	if (barButtonItemSet.dismissTarget != nil && [barButtonItemSet.dismissTarget respondsToSelector:barButtonItemSet.dismissAction]) {
		[toolbarItems addObject:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:barButtonItemSet.dismissTarget action:barButtonItemSet.dismissAction]];
	}
	
	[self setToolbarItems:toolbarItems animated:animated];
}

- (void)appendBarButtonItemSet:(ITBarItemSet *)barButtonItemSet
{
	
}

- (void)removeBarButtonItemSet:(ITBarItemSet *)barButtonItemSet animated:(BOOL)animated
{
	
}

- (void)removeAllBarButtonItemSetsAnimated:(BOOL)animated
{
	
}

@end
