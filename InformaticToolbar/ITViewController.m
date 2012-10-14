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

@property (nonatomic, strong) NSTimer *updateProgressTimer;

@end

@implementation ITViewController

@synthesize updateProgressTimer = _updateProgressTimer;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
	self.updateProgressTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(increaseProgress) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - actions

- (IBAction)addProgressBarItemSet:(id)sender
{
	ITProgressBarItemSet *progressBarItemSet = [ITProgressBarItemSet progressBarItemSetWithTitle:@"Downloading new schedule" dismissTarget:self andAction:@selector(dismissBarItemSet:)];
	[self pushBarItemSet:progressBarItemSet animated:YES];
	
	NSLog(@"Visible Bar Item Set: %@", self.visibleBarItemSet);
	NSLog(@"Bar Item Sets: %@", self.barItemSets);
}
								
- (void)increaseProgress
{
	for (ITProgressBarItemSet *barItemSet in self.barItemSets) {
		if ([barItemSet isKindOfClass:[ITProgressBarItemSet class]]) {
			float progress = barItemSet.progress == 0.99 ? 0.0 : barItemSet.progress + 0.01;
			[barItemSet setProgress:progress animated:YES];
		}
	}
}

- (void)dismissBarItemSet:(ITBarItemSet *)sender
{
	NSLog(@"Did tap dismiss button %@", sender);
	[self removeBarItemSet:sender animated:YES];
}

@end
