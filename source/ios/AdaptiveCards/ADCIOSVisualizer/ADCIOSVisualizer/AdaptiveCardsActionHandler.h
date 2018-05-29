//
//  AdaptiveCardsActionHandler.h
//  TeamsAppCore
//
//  Created by Ankit Maurya on 5/3/18.
//

#ifndef AdaptiveCardsActionHandler_h
#define AdaptiveCardsActionHandler_h

#import <AdaptiveCards/ACFramework.h>



@interface AdaptiveCardsActionHandler : NSObject<ACRActionDelegate>

@property (strong) NSIndexPath *indexPath;
@property (strong) UITableViewController *baseTableViewController;

@end

#endif /* AdaptiveCardsActionHandler_h */
