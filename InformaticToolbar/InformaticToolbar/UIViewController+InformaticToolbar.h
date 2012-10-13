//
//  UIViewController+InformaticToolbar.h
//  InformaticToolbar
//
//  Created by Greg Wang on 12-10-13.
//  Copyright (c) 2012年 Greg Wang. All rights reserved.
//

#import "ITBarItemSet.h"

@interface UIViewController (InformaticToolbar)

- (void)pushBarButtonItemSet:(ITBarItemSet *)barButtonItemSet animated:(BOOL)animated;
- (void)appendBarButtonItemSet:(ITBarItemSet *)barButtonItemSet;

- (void)removeBarButtonItemSet:(ITBarItemSet *)barButtonItemSet animated:(BOOL)animated;
- (void)removeAllBarButtonItemSetsAnimated:(BOOL)animated;

@end
