//
//  CustomTableViewCell.h
//  ADCIOSVisualizer
//
//  Created by Ankit Maurya on 5/25/18.
//  Copyright © 2018 Microsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdaptiveCardsActionHandler.h"
#import <AdaptiveCards/ACFramework.h>

@interface CustomTableViewCell : UITableViewCell

@property ACRView *vie;
@property CGFloat width;
@property AdaptiveCardsActionHandler *handler;

-(void) configure;

@end
