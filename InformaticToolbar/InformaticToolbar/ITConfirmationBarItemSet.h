//
//  ITConfirmationBarItemSet.h
//  InformaticToolbar
//
//  Created by Greg Wang on 12-10-14.
//  Copyright (c) 2012年 Greg Wang. All rights reserved.
//

#import "ITLabelBarItemSet.h"

@interface ITConfirmationBarItemSet : ITLabelBarItemSet

@property (nonatomic) SEL confirmAction;

+ (ITConfirmationBarItemSet *)confirmationBarItemSetWithTarget:(id)target andConfirmAction:(SEL)confirmAction andDismissAction:(SEL)dismissAction;

- (IBAction)confirm:(id)sender;

@end
