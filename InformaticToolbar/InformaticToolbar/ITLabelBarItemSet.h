//
//  ITLabelBarItemSet.h
//  InformaticToolbar
//
//  Created by Greg Wang on 12-10-14.
//  Copyright (c) 2012年 Greg Wang. All rights reserved.
//

#import "ITBarItemSet.h"

@interface ITLabelBarItemSet : ITBarItemSet

@property (nonatomic, strong, readonly) UILabel *textLabel;
@property (nonatomic, strong, readonly) UILabel *detailTextLabel;

- (ITLabelBarItemSet *)initWithItems:(NSArray *)barItems;
+ (ITLabelBarItemSet *)labelBarItemSet;
+ (ITLabelBarItemSet *)labelBarItemSetWithDismissTarget:(id)target andAction:(SEL)action;

@end
