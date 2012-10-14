//
//  ITProgressBarItemSet.h
//  InformaticToolbar
//
//  Created by Greg Wang on 12-10-13.
//  Copyright (c) 2012年 Greg Wang. All rights reserved.
//

#import "ITBarItemSet.h"

@interface ITProgressBarItemSet : ITBarItemSet

@property (nonatomic, strong, readonly) UILabel *titleLabel;

+ (ITProgressBarItemSet *)progressBarItemSetWithTitle:(NSString *)title;
+ (ITProgressBarItemSet *)progressBarItemSetWithTitle:(NSString *)title dismissTarget:(id)target andAction:(SEL)action;

- (float)progress;
- (void)setProgress:(float)progress animated:(BOOL)animated;

@end
