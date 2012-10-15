//
//  ITViewController.m
//  InformaticToolbar
//
//  Created by Greg Wang on 12-10-13.
//  Copyright (c) 2012年 Greg Wang. All rights reserved.
//

#import "ITViewController.h"
#import "InformaticToolbar.h"

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
	[self updateToolbarToLatestStateAnimated:animated];
	
	self.updateProgressTimer = [NSTimer scheduledTimerWithTimeInterval:0.8 target:self selector:@selector(increaseProgress) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - actions

- (IBAction)addLabelBarItemSet:(id)sender
{
	ITLabelBarItemSet *labelBarItemSet = [ITLabelBarItemSet labelBarItemSetWithDismissTarget:self andAction:@selector(dismissBarItemSet:)];
	labelBarItemSet.textLabel.text = @"This is text label. ";
	labelBarItemSet.detailTextLabel.text = @"This is detail text label. ";
	[self pushBarItemSet:labelBarItemSet animated:YES];
	
	NSLog(@"Visible Bar Item Set: %@", self.visibleBarItemSet);
	NSLog(@"Bar Item Sets: %@", self.barItemSets);
}

- (IBAction)addProgressBarItemSet:(id)sender
{
	ITProgressBarItemSet *progressBarItemSet = [ITProgressBarItemSet progressBarItemSetWithTitle:@"This is progress title. " dismissTarget:self andAction:@selector(dismissBarItemSet:)];
	[self pushBarItemSet:progressBarItemSet animated:YES];
	
	NSLog(@"Visible Bar Item Set: %@", self.visibleBarItemSet);
	NSLog(@"Bar Item Sets: %@", self.barItemSets);
}

- (IBAction)addConfirmationBarItemSet:(id)sender
{
	ITConfirmationBarItemSet *confirmationBarItemSet = [ITConfirmationBarItemSet confirmationBarItemSetWithTarget:self andConfirmAction:@selector(confirmBarItemSet:) andDismissAction:@selector(dismissBarItemSet:)];
	confirmationBarItemSet.textLabel.text = @"Do you want to continue? ";
	confirmationBarItemSet.detailTextLabel.text = @"Tap on the check mark to confirm. ";
	[self pushBarItemSet:confirmationBarItemSet animated:YES];
	
	NSLog(@"Visible Bar Item Set: %@", self.visibleBarItemSet);
	NSLog(@"Bar Item Sets: %@", self.barItemSets);
}
								
- (void)increaseProgress
{
	for (ITProgressBarItemSet *barItemSet in self.barItemSets) {
		if ([barItemSet isKindOfClass:[ITProgressBarItemSet class]]) {
			float progress = barItemSet.progress > 0.99 ? 0.0 : barItemSet.progress + 0.1;
			[barItemSet setProgress:progress animated:YES];
		}
	}
}

- (void)dismissBarItemSet:(ITBarItemSet *)sender
{
	NSLog(@"Did tap dismiss button %@", sender);
	[self removeBarItemSet:sender animated:YES];
}

- (void)confirmBarItemSet:(ITBarItemSet *)sender
{
	NSLog(@"Did tap confirm button %@", sender);
	[self removeBarItemSet:sender animated:YES];
	[self addProgressBarItemSet:self];
}

@end
