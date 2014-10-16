//
//  ViewController.m
//  ToothpasteILoveAndAdored
//
//  Created by MIKE LAND on 10/16/14.
//  Copyright (c) 2014 MIKE LAND. All rights reserved.
//

#import "AdoredToothpastesViewController.h"

@interface AdoredToothpastesViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation AdoredToothpastesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCellID"];
    return cell;
}

@end
