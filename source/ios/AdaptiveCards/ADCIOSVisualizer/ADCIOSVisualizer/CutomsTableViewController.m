//
//  CutomsTableViewController.m
//  ADCIOSVisualizer
//
//  Created by Ankit Maurya on 5/25/18.
//  Copyright © 2018 Microsoft. All rights reserved.
//

#import "CutomsTableViewController.h"
#import "CustomTableViewCell.h"
#import <AdaptiveCards/ACFramework.h>
#import "AdaptiveCardsActionHandler.h"

@interface CutomsTableViewController ()
@property NSArray *cards;
@end


@implementation CutomsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dictionary = [[NSMutableDictionary alloc] init];
    self.cards = @[@"ImageGallery",@"Solitaire",@"InputForm",@"ActivityUpdate",@"CalendarReminder",@"Inputs",@"FactSet",@"Input.Time",@"Input.Toggle"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:nil] forCellReuseIdentifier: @"adaptivecardcell"];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath: (NSIndexPath *)indexPath {
    if(indexPath.row % 2 )
    {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"chatcell" forIndexPath:indexPath];
    cell.textLabel.text = @"1";
    return cell;
    }
    else
    {

        NSNumber *number = [NSNumber numberWithLong:indexPath.row];
        ACRView *acrView = [self.dictionary objectForKey:number];
//        (indexPath.row/2)%9
        if(!acrView)
        {
            NSString *path = [[NSBundle mainBundle] pathForResource:self.cards[3] ofType:@"json"];
            NSString *jsonStr = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
            ACOAdaptiveCardParseResult *cardParseResult = [ACOAdaptiveCard fromJson:jsonStr];
            ACRRenderResult* renderResult = [ACRRenderer render:cardParseResult.card
                                                         config:nil
                                                widthConstraint:self.tableView.frame.size.width];
            acrView = renderResult.view;
            [self.dictionary setObject:acrView forKey:number];
        }
        
        
        CustomTableViewCell *cell = (CustomTableViewCell*) [tableView dequeueReusableCellWithIdentifier:@"adaptivecardcell" forIndexPath:indexPath];
        
        AdaptiveCardsActionHandler *handler = [[AdaptiveCardsActionHandler alloc] init];
        handler.indexPath = indexPath;
        handler.baseTableViewController = self;
      
        
        cell.vie = acrView;
        cell.handler = handler;
        [cell configure];
        return cell;
    }
    return nil;
        
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
