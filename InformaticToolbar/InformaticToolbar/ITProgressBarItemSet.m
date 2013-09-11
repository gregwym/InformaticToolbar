//
//  ITProgressBarItemSet.m
//  InformaticToolbar
//
//  Created by Greg Wang on 12-10-13.
//  Copyright (c) 2012年 Greg Wang. All rights reserved.
//

#import "ITProgressBarItemSet.h"

@interface ITProgressBarItemSet ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIProgressView *progressView;

@end

@implementation ITProgressBarItemSet

@synthesize titleLabel = _titleLabel;
@synthesize progressView = _progressView;

- (ITProgressBarItemSet *)init
{
	CGFloat progressWidth = 200.0;
	UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 1.0, progressWidth, 17.0)];
	titleLabel.textAlignment = NSTextAlignmentCenter;
	titleLabel.font = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
	if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
		titleLabel.backgroundColor = [UIColor clearColor];
		titleLabel.textColor = [UIColor whiteColor];
		titleLabel.shadowColor = [UIColor darkTextColor];
	}
	
	UIProgressView *progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
	progressView.frame = CGRectMake(0.0, 21.0, progressWidth, 10.0);

	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, progressWidth, 32.0)];
	[view addSubview:titleLabel];
	[view addSubview:progressView];
	
	NSArray *items = @[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil], [[UIBarButtonItem alloc] initWithCustomView:view], [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil]];
	
	self = [super initWithItems:items];
	if (self != nil) {
		self.titleLabel = titleLabel;
		self.progressView = progressView;
	}
	return self;
}

+ (ITProgressBarItemSet *)progressBarItemSetWithTitle:(NSString *)title
{
	ITProgressBarItemSet *progressBarItemSet = [ITProgressBarItemSet progressBarItemSetWithTitle:title dismissTarget:nil andAction:nil];
	return progressBarItemSet;
}

+ (ITProgressBarItemSet *)progressBarItemSetWithTitle:(NSString *)title dismissTarget:(id)target andAction:(SEL)action
{
	ITProgressBarItemSet *progressBarItemSet = [[ITProgressBarItemSet alloc] init];
	if (progressBarItemSet != nil) {
		progressBarItemSet.titleLabel.text = title;
		progressBarItemSet.dismissTarget = target;
		progressBarItemSet.dismissAction = action;
	}
	return progressBarItemSet;
}

- (float)progress
{
	return [self.progressView progress];
}

- (void)setProgress:(float)progress animated:(BOOL)animated
{
	[self.progressView setProgress:progress animated:animated];
}

@end
