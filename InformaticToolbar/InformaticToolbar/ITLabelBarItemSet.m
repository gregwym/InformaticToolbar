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

- (ITLabelBarItemSet *)init
{
	CGFloat labelWidth = 240.0;
	UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 2.0, labelWidth, 16.0)];
	textLabel.textAlignment = NSTextAlignmentCenter;
	textLabel.font = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
	textLabel.backgroundColor = [UIColor clearColor];
	textLabel.textColor = [UIColor whiteColor];
	textLabel.shadowColor = [UIColor darkGrayColor];
	
	UILabel *detailTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 18.0, labelWidth, 14.0)];
	detailTextLabel.textAlignment = NSTextAlignmentCenter;
	detailTextLabel.font = [UIFont systemFontOfSize:[UIFont systemFontSize] - 2.0];
	detailTextLabel.backgroundColor = [UIColor clearColor];
	detailTextLabel.textColor = [UIColor whiteColor];
	detailTextLabel.shadowColor = [UIColor darkGrayColor];
	
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, labelWidth, 32.0)];
	[view addSubview:textLabel];
	[view addSubview:detailTextLabel];
	
	NSArray *items = [NSArray arrayWithObject:[[UIBarButtonItem alloc] initWithCustomView:view]];
	
	self = [super initWithItems:items];
	if (self != nil) {
		self.textLabel = textLabel;
		self.detailTextLabel = detailTextLabel;
	}
	return self;
}

+ (ITLabelBarItemSet *)labelBarItemSet
{
	ITLabelBarItemSet *labelBarItemSet = [[self alloc] init];
	if (labelBarItemSet != nil) {
		
	}
	return labelBarItemSet;
}

+ (ITLabelBarItemSet *)labelBarItemSetWithDismissTarget:(id)target andAction:(SEL)action
{
	ITLabelBarItemSet *labelBarItemSet = [[self alloc] init];
	if (labelBarItemSet != nil) {
		labelBarItemSet.dismissTarget = target;
		labelBarItemSet.dismissAction = action;
	}
	return labelBarItemSet;
}

@end
