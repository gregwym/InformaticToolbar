//
//  ITBarItemSet.h
//  InformaticToolbar
//
//  Created by Greg Wang on 12-10-13.
//  Copyright (c) 2012年 Greg Wang. All rights reserved.
//

@interface ITBarItemSet : NSObject

@property (nonatomic, strong, readonly) NSArray *barButtonItems;
@property (nonatomic, weak) id dismissTarget;
@property (nonatomic) SEL dismissAction;

- (ITBarItemSet *)initWithItems:(NSArray *)barButtonItems;

@end
