//
//  OverViewComponent.m
//  Fore
//
//  Created by pavan krishna on 01/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "OverViewComponent.h"

#import "ParInfoComponent.h"
#import "CourseInfoComponent.h"
#import "AmenitiesComponent.h"
#import "MapInfoComponent.h"
#import "WeatherInfoComponent.h"
#import "OverviewVideoComponent.h"
#import "CallProShopComponent.h"

@interface OverViewComponent()

@property (nonatomic, strong) LayoutManager *layoutManager;
@property (nonatomic, strong) UITableView *overViewTableView;

@end

@implementation OverViewComponent

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.layoutManager = [[LayoutManager alloc] init];
        self.backgroundColor = [UIColor whiteColor];
        [self addSubviews];
        
        [[self overViewTableView] registerClass:[ParInfoComponent class] forCellReuseIdentifier:@"parInfoCellIdentifier"];
        [[self overViewTableView] registerClass:[CourseInfoComponent class] forCellReuseIdentifier:@"courseInfoCellIdentifier"];
        [[self overViewTableView] registerClass:[AmenitiesComponent class] forCellReuseIdentifier:@"amenitiesCellIdentifier"];
        [[self overViewTableView] registerClass:[MapInfoComponent class] forCellReuseIdentifier:@"mapInfoCellIdentifier"];
        [[self overViewTableView] registerClass:[WeatherInfoComponent class] forCellReuseIdentifier:@"weatherInfoCellIdentifier"];
        [[self overViewTableView] registerClass:[OverviewVideoComponent class] forCellReuseIdentifier:@"overviewVideoCellIdentifier"];
        [[self overViewTableView] registerClass:[CallProShopComponent class] forCellReuseIdentifier:@"callProShopCellIdentifier"];
    }
    return self;
}

-(void)addSubviews;
{
    [self addSubview:[self overViewTableView]];
}

-(void)updateConstraints;
{
    [[self overViewTableView] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.height.equalTo(@([self.layoutManager height:75]));
        make.left.equalTo(self);
        make.right.equalTo(self);
    }];
    
    [super updateConstraints];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    NSInteger rowValue = indexPath.row;
    switch (rowValue) {
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier:@"parInfoCellIdentifier"];
            [(ParInfoComponent*)cell setParInfo:@"00"];
            [(ParInfoComponent*)cell setSlopeInfo:@"000"];
            [(ParInfoComponent*)cell setRatingInfo:@"00"];
            [(ParInfoComponent*)cell setLengthInfo:@"0000"];
            break;
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:@"courseInfoCellIdentifier"];
            [(CourseInfoComponent*)cell setInfoContent:@"Info about course"];
            break;
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:@"amenitiesCellIdentifier"];
//            [(AmenitiesComponent*)cell setDummyName:@"Dummy text"];
            break;
        case 3:
            cell = [tableView dequeueReusableCellWithIdentifier:@"mapInfoCellIdentifier"];
//            [(MapInfoComponent*)cell setDummyName:@"Dummy text"];
            break;
        case 4:
            cell = [tableView dequeueReusableCellWithIdentifier:@"weatherInfoCellIdentifier"];
            [(WeatherInfoComponent*)cell setDummyName:@"Weather info"];
            break;
        case 5:
            cell = [tableView dequeueReusableCellWithIdentifier:@"overviewVideoCellIdentifier"];
            [(OverviewVideoComponent*)cell setDummyName:@"Video Component"];
            break;
        case 6:
            cell = [tableView dequeueReusableCellWithIdentifier:@"callProShopCellIdentifier"];
            [(CallProShopComponent*)cell setCallText:@"Call Pro Shop"];
            [(CallProShopComponent*)cell setCellImage:@"call_image"];
            break;
        case 7:
            cell = [tableView dequeueReusableCellWithIdentifier:@"callProShopCellIdentifier"];
            [(CallProShopComponent*)cell setCallText:@"Visit Website"];
            [(CallProShopComponent*)cell setCellImage:@"visit_website_image"];
            break;
        default:
            break;
            
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSInteger rowValue = indexPath.row;
    NSInteger rowHeight = 0;
    switch (rowValue) {
        case 0:
            rowHeight = 80;
            break;
        case 1:
            rowHeight = 100;
            break;
        case 2:
            rowHeight = 100;
            break;
        case 3:
            rowHeight = 160;
            break;
        case 4:
            rowHeight = 80;
            break;
        case 5:
            rowHeight = 160;
            break;
        case 6:
            rowHeight = 80;
            break;
        case 7:
            rowHeight = 80;
            break;
        default:
            break;
            
    }

    return rowHeight;
}

#pragma mark - Lazy Loading

-(UITableView *)overViewTableView;
{
    if (_overViewTableView) {
        return _overViewTableView;
    }
    
    _overViewTableView = [UITableView new];
    //    [[_overViewTableView layer] setBorderColor:[UIColor brownColor].CGColor];
    //    [[_overViewTableView layer] setBorderWidth:1];
    [_overViewTableView setDataSource:self];
    [_overViewTableView setDelegate:self];
    [_overViewTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [_overViewTableView setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    [_overViewTableView setBackgroundColor:[UIColor clearColor]];
    
    return _overViewTableView;
}

@end