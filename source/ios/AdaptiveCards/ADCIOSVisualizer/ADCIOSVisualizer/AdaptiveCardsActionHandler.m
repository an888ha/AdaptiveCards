//
//  AdaptiveCardsActionHandler.m
//  TeamsAppCore
//
//  Created by Ankit Maurya on 5/3/18.
//

#import <Foundation/Foundation.h>
#import "AdaptiveCardsActionHandler.h"

@implementation AdaptiveCardsActionHandler

- (void) didFetchUserResponses:(ACOAdaptiveCard *)card action:(ACOBaseActionElement *)action
{
    if(action.type == ACROpenUrl)
    {
        NSLog(@"Open URL");
    }
    else if(action.type == ACRSubmit){
        NSLog(@"Action Submit");
    }
    else if(action.type == ACRShowCard)
    {
        NSLog(@"Action ShowCard");
          [self.baseTableViewController.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:self.indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
    
}

- (void)didLoadElements
{
//    if([self.baseTableViewController.tableView.indexPathsForVisibleRows containsObject:self.indexPath])
//    {
//        [self.baseTableViewController.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:self.indexPath] withRowAnimation:UITableViewRowAnimationNone];
//    }
    NSLog(@"Did Load Elements ; ankit");
    [self.baseTableViewController.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:self.indexPath] withRowAnimation:UITableViewRowAnimationNone];
}


@end


