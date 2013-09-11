//
//  ITLabelBarItemSet.m
//  InformaticToolbar
//
//  Created by Greg Wang on 12-10-14.
//  Copyright (c) 2012年 Greg Wang. All rights reserved.
//

#import "ITLabelBarItemSet.h"

@interface ITLabelBarItemSet ()

@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UILabel *detailTextLabel;

@end

@implementation ITLabelBarItemSet

@synthesize textLabel = _textLabel;
@synthesize detailTextLabel = _detailTextLabel;

- (ITLabelBarItemSet *)initWithItems:(NSArray *)barItems;
{
	CGFloat labelWidth = barItems == nil ? 240.0 : 216.0;
	UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 1.0, labelWidth, 17.0)];
	textLabel.textAlignment = NSTextAlignmentCenter;
	textLabel.font = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
	if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
		textLabel.backgroundColor = [UIColor clearColor];
		textLabel.textColor = [UIColor whiteColor];
		textLabel.shadowColor = [UIColor darkTextColor];
	}

	UILabel *detailTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 18.0, labelWidth, 14.0)];
	detailTextLabel.textAlignment = NSTextAlignmentCenter;
	detailTextLabel.font = [UIFont systemFontOfSize:[UIFont systemFontSize] - 2.0];
	if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
		detailTextLabel.backgroundColor = [UIColor clearColor];
		detailTextLabel.textColor = [UIColor whiteColor];
		detailTextLabel.shadowColor = [UIColor darkTextColor];
	}

	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, labelWidth, 32.0)];
	[view addSubview:textLabel];
	[view addSubview:detailTextLabel];
	
	NSArray *items = @[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil], [[UIBarButtonItem alloc] initWithCustomView:view], [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil]];
	
	if (barItems != nil) {
		items = [items arrayByAddingObjectsFromArray:barItems];
	}
	
	self = [super initWithItems:items];
	if (self != nil) {
		self.textLabel = textLabel;
		self.detailTextLabel = detailTextLabel;
	}
	return self;
}

+ (ITLabelBarItemSet *)labelBarItemSet
{
	ITLabelBarItemSet *labelBarItemSet = [ITLabelBarItemSet labelBarItemSetWithDismissTarget:nil andAction:nil];
	return labelBarItemSet;
}

+ (ITLabelBarItemSet *)labelBarItemSetWithDismissTarget:(id)target andAction:(SEL)action
{
	ITLabelBarItemSet *labelBarItemSet = [[self alloc] initWithItems:nil];
	if (labelBarItemSet != nil) {
		labelBarItemSet.dismissTarget = target;
		labelBarItemSet.dismissAction = action;
	}
	return labelBarItemSet;
}

@end
