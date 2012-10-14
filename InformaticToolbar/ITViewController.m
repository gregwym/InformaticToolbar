//
//  ITViewController.m
//  InformaticToolbar
//
//  Created by Greg Wang on 12-10-13.
//  Copyright (c) 2012年 Greg Wang. All rights reserved.
//

#import "ITViewController.h"
#import "UIViewController+InformaticToolbar.h"
#import "ITProgressBarItemSet.h"

@interface ITViewController ()

@property (nonatomic) NSUInteger progress;
@property (nonatomic, strong) NSTimer *updateProgressTimer;
@property (nonatomic, strong) ITProgressBarItemSet *progressBarItemSet;

@end

@implementation ITViewController

@synthesize progress = _progress;
@synthesize updateProgressTimer = _updateProgressTimer;
@synthesize progressBarItemSet = _progressBarItemSet;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
	NSLog(@"Visible Bar Item Set: %@", self.visibleBarItemSet);
	NSLog(@"Bar Item Sets: %@", self.barItemSets);
	
	self.progressBarItemSet = [ITProgressBarItemSet progressBarItemSetWithTitle:@"Downloading new schedule" dismissTarget:self andAction:@selector(dismissBarItemSet:)];
	[self pushBarItemSet:self.progressBarItemSet animated:YES];
	
	NSLog(@"Visible Bar Item Set: %@", self.visibleBarItemSet);
	NSLog(@"Bar Item Sets: %@", self.barItemSets);
	
	self.progress = 0;
	self.updateProgressTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(increaseProgress) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
								
- (void)increaseProgress
{
	self.progress = (self.progress + 1) % 100;
	[self.progressBarItemSet setProgress:self.progress / 100.0  animated:YES];
}

- (void)dismissBarItemSet:(ITBarItemSet *)sender
{
	NSLog(@"Did tap dismiss button %@", sender);
	[self removeBarItemSet:sender animated:YES];
}

@end
