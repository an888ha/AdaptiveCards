//
//  CustomTableViewCell.m
//  ADCIOSVisualizer
//
//  Created by Ankit Maurya on 5/25/18.
//  Copyright © 2018 Microsoft. All rights reserved.
//

#import "CustomTableViewCell.h"



@interface CustomTableViewCell()
{
    
    __weak IBOutlet UIView *cardView;
}

@end

@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}


- (void)prepareForReuse{
    [super prepareForReuse];
    for (UIView *subview in cardView.subviews) {
        [subview removeFromSuperview];
    }
    
}

- (void)configure
{

    ACRView *acrView = self.vie;
    acrView.acrActionDelegate = self.handler;
    CGSize size = [acrView systemLayoutSizeFittingSize:CGSizeMake(self.width, 0)];
    NSLog(@"height is  %f ",size.height);
    
    [cardView addSubview:acrView];
    
    NSArray *vc = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(0)-[acrView]-(8)-|" options:0 metrics:nil views: @{@"acrView" : acrView}];
    NSArray *hc = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(0)-[acrView]-(0)-|" options:0 metrics:nil views: @{@"acrView" : acrView}];
    [cardView addConstraints:hc];
    [cardView  addConstraints:vc];
    
//     acrView.acrActionDelegate = cardActionHandler;
}


@end
