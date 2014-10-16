//
//  ViewController.m
//  ToothpasteILoveAndAdored
//
//  Created by MIKE LAND on 10/16/14.
//  Copyright (c) 2014 MIKE LAND. All rights reserved.
//

#import "AdoredToothpastesViewController.h"
#import "ToothpastesTableViewController.h"

@interface AdoredToothpastesViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *adoredTableView;
@property NSMutableArray *adoredToothpastes;

@end

@implementation AdoredToothpastesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.adoredToothpastes = [NSMutableArray array];
    [self load];
    if (self.adoredToothpastes == nil) {
        self.adoredToothpastes = [NSMutableArray array];
    }


}

-(IBAction)unwindFromToothpastesViewController:(UIStoryboardSegue *)segue {
    ToothpastesTableViewController *viewController = segue.sourceViewController;
    [self.adoredToothpastes addObject:[viewController adoredToothpaste]];
    [self.adoredTableView reloadData];
    [self save];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.adoredToothpastes.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCellID"];
    cell.textLabel.text = [self.adoredToothpastes objectAtIndex:indexPath.row];
    return cell;
}

-(NSURL *)documentDirectory{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *files = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    return files.firstObject;
}

-(void)load{
    NSURL *pList = [[self documentDirectory] URLByAppendingPathComponent:@"pastes.plist"];
    self.adoredToothpastes = [NSMutableArray arrayWithContentsOfURL:pList];
}

-(void)save{
    NSURL *pList = [[self documentDirectory] URLByAppendingPathComponent:@"pastes.plist"];
    [self.adoredToothpastes writeToURL:pList atomically:YES];
}



@end
