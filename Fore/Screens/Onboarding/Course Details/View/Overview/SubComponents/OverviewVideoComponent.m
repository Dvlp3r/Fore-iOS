//
//  OverviewVideoComponent.m
//  Fore
//
//  Created by pavan krishna on 01/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "OverviewVideoComponent.h"

@interface OverviewVideoComponent ()

@property (nonatomic, strong) UILabel *dummyLabel;

@end

@implementation OverviewVideoComponent

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubviews];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

-(void)prepareForReuse;
{
    [super prepareForReuse];
}

-(void)addSubviews;
{
    [[self contentView] addSubview:[self dummyLabel]];
}

-(void)layoutSubviews;
{
    [super layoutSubviews];
    
    [[self dummyLabel] setFrame:CGRectMake(10, 0, CGRectGetWidth([[UIScreen mainScreen] bounds]), 70)];
    [[self textLabel] sizeToFit];
}

-(UILabel *)dummyLabel;
{
    if (_dummyLabel) {
        return _dummyLabel;
    }
    
    _dummyLabel = [UILabel new];
    [_dummyLabel setTextColor:[UIColor grayColor]];
    [_dummyLabel setFont:[UIFont systemFontOfSize:14]];
    
    return _dummyLabel;
}

-(void)setDummyName:(NSString *)townName;
{
    [[self dummyLabel] setText:townName];
}

@end
