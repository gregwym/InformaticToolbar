//
//  UIViewController+InformaticToolbar.h
//  InformaticToolbar
//
//  Created by Greg Wang on 12-10-13.
//  Copyright (c) 2012年 Greg Wang. All rights reserved.
//

#import "ITBarItemSet.h"

@interface UIViewController (InformaticToolbar)

@property (nonatomic, strong, readonly) NSArray *barItemSets;
@property (nonatomic, weak, readonly) ITBarItemSet *visibleBarItemSet;

/* 
 * Call this method in viewDidAppear: to update toolbar's appearance to the latest state
 */
- (void)updateToolbarToLatestStateAnimated:(BOOL)animated;

- (void)pushBarItemSet:(ITBarItemSet *)barItemSet animated:(BOOL)animated;
- (void)appendBarItemSet:(ITBarItemSet *)barItemSet;

- (void)removeBarItemSet:(ITBarItemSet *)barItemSet animated:(BOOL)animated;
- (void)removeAllBarItemSetsAnimated:(BOOL)animated;

@end
