//
//  ViewController.m
//  preload-cells
//
//  Created by GabrielMassana on 18/02/2016.
//  Copyright © 2016 GabrielMassana. All rights reserved.
//

#import "PLCViewController.h"

#import "PureLayout.h"
#import "PLCTableViewCell.h"

@interface PLCViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation PLCViewController

#pragma mark - ViewLifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.tableView registerClass:[PLCTableViewCell class]
           forCellReuseIdentifier:[PLCTableViewCell reuseIdentifier]];
    
    [self updateViewConstraints];
}

#pragma mark - Subviews

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f,
                                                                   0.0f,
                                                                   CGRectGetWidth([UIScreen mainScreen].bounds),
                                                                   CGRectGetHeight([UIScreen mainScreen].bounds))
                                                  style:UITableViewStylePlain];
        
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.alwaysBounceVertical = YES;
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        _tableView.rowHeight = CGRectGetHeight([UIScreen mainScreen].bounds) / 2.0f;
        
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    
    return _tableView;
}

#pragma mark - Getters

- (NSArray *)dataArray
{
    if (!_dataArray)
    {
        _dataArray = @[@"Alabama", @"Alaska", @"Arizona", @"Arkansas", @"California", @"Colorado", @"Connecticut", @"Delaware", @"Florida", @"Georgia", @"Hawaii", @"Idaho", @"Illinois Indiana", @"Iowa", @"Kansas ", @"Kentucky ", @"Louisiana ", @"Maine ", @"Maryland ", @"Massachusetts ", @"Michigan ", @"Minnesota ", @"Mississippi ", @"Missouri ", @"Montana Nebraska ", @"Nevada ", @"New Hampshire ", @"New Jersey ", @"New Mexico ", @"New York ", @"North Carolina ", @"North Dakota ", @"Ohio ", @"Oklahoma ", @"Oregon ", @"Pennsylvania Rhode Island ", @"South Carolina ", @"South Dakota ", @"Tennessee ", @"Texas ", @"Utah ", @"Vermont ", @"Virginia ", @"Washington ", @"West Virginia ", @"Wisconsin ", @"Wyoming"];
    }
    
    return _dataArray;
}

#pragma mark - Constraints

- (void)updateViewConstraints
{
    [super updateViewConstraints];
    
    /*-------------------*/
    
    [self.tableView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    
    [self.tableView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    
    [self.tableView autoPinEdgeToSuperviewEdge:ALEdgeTop];

    [self.tableView autoPinEdgeToSuperviewEdge:ALEdgeBottom
                                     withInset:-CGRectGetHeight([UIScreen mainScreen].bounds) / 2.0];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PLCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[PLCTableViewCell reuseIdentifier]
                                                             forIndexPath:indexPath];;
    
    NSLog(@"row = %@", @(indexPath.row));

    [self configureCell:cell
           forIndexPath:indexPath];
    
    [cell layoutByApplyingConstraints];
    
    return cell;
}

#pragma mark  - ConfigureCell

- (void)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath
{
    [((PLCTableViewCell *)cell) updateCellWithString:self.dataArray[indexPath.row]];
    
    /*-------------------*/

    if (indexPath.row % 2 == 0)
    {
        cell.backgroundColor = [UIColor lightGrayColor];
    }
    else
    {
        cell.backgroundColor = [UIColor yellowColor];
    }
}

@end
