//
//  HoleByHoleTableViewCell.m
//  Fore
//
//  Created by pavan krishna on 03/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "HoleByHoleTableViewCell.h"

@interface HoleByHoleTableViewCell()

@property (nonatomic, strong) UIImageView *holeImageView;
@property (nonatomic, strong) UILabel *holeInfoLabel;
@property (nonatomic, strong) UILabel *parInfoLabel;
@property (nonatomic, strong) UILabel *yardsInfoLabel;
@property (nonatomic, strong) UILabel *handicapInfoLabel;

@end

@implementation HoleByHoleTableViewCell

#pragma mark - life cycle

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setBackgroundColor:[UIColor yellowColor]];
        [self addViews];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    if ( !(self = [super initWithCoder:aDecoder]) ) return nil;
    
    // Your code goes here!
    [self addViews];
    return self;
}

-(void)prepareForReuse;
{
    [super prepareForReuse];
    
}

#pragma mark view building

-(void)addViews;
{
    [[self contentView] addSubview:[self holeImageView]];
    [[self contentView] addSubview:[self holeInfoLabel]];
    [[self contentView] addSubview:[self parInfoLabel]];
    [[self contentView] addSubview:[self yardsInfoLabel]];
    [[self contentView] addSubview:[self handicapInfoLabel]];
}

-(void)layoutSubviews;
{
    [super layoutSubviews];
        
    [[self holeImageView] setFrame:CGRectMake(20,
                                                CGRectGetMidY([[self contentView] frame])-CGRectGetHeight([[self contentView] frame])/2,
                                                CGRectGetWidth([[self contentView] frame])/8,
                                                CGRectGetHeight([[self contentView] frame])/2)];
    
    [[self holeInfoLabel] setFrame:CGRectMake(CGRectGetMaxX([[self holeImageView] frame])+20,
                                              CGRectGetMidY([[self contentView] frame]),
                                              30,
                                                  10)];
    
    [[self parInfoLabel] setFrame:CGRectMake(CGRectGetMaxX([[self holeInfoLabel] frame])+20,
                                              CGRectGetMidY([[self contentView] frame]),
                                              30,
                                              10)];

    [[self yardsInfoLabel] setFrame:CGRectMake(CGRectGetMaxX([[self parInfoLabel] frame])+20,
                                              CGRectGetMidY([[self contentView] frame]),
                                              30,
                                              10)];

    [[self handicapInfoLabel] setFrame:CGRectMake(CGRectGetMaxX([[self yardsInfoLabel] frame])+20,
                                              CGRectGetMidY([[self contentView] frame]),
                                              30,
                                              10)];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

#pragma mark - Public methods

-(void)setHoleImage:(NSString *)imagePath;
{
    [[self holeImageView] setImage:[UIImage imageNamed:imagePath]];
}

-(void)setHoleInfo:(NSString *)holeName;
{
    [[self holeInfoLabel] setText:holeName];
}

-(void)setParInfo:(NSString *)parInfo;
{
    [[self parInfoLabel] setText:parInfo];
}

-(void)setYardsInfo:(NSString *)yardsInfo;
{
    [[self yardsInfoLabel] setText:yardsInfo];
}

-(void)setHandicapInfo:(NSString *)handicapInfo;
{
    [[self handicapInfoLabel] setText:handicapInfo];
}

#pragma mark - Lazy loading

-(UIImageView *)holeImageView;
{
    if (_holeImageView) {
        return _holeImageView;
    }
    
    _holeImageView = [UIImageView new];
    [_holeImageView setImage:[UIImage imageNamed:@"course_dummy_image"]];
    [[_holeImageView layer] setBorderColor:[UIColor redColor].CGColor];
    [[_holeImageView layer] setBorderWidth:1];
    [[_holeImageView layer] setCornerRadius:20];
//    [_holeImageView sizeToFit];
    
    return _holeImageView;
}

-(UILabel*)newLabel;
{
    UILabel *label = [UILabel new];
    [[label layer] setBorderColor:[UIColor redColor].CGColor];
    [[label layer] setBorderWidth:1];
    [label setFont:[UIFont systemFontOfSize:10]];
    [label setTextColor:[UIColor lightGrayColor]];
    [label setTextAlignment:NSTextAlignmentLeft];
    
    return label;
}

-(UILabel *)holeInfoLabel;
{
    if (_holeInfoLabel) {
        return _holeInfoLabel;
    }
    
    _holeInfoLabel = [self newLabel];
//    [_holeInfoLabel setText:@"Hole 12"];
    return _holeInfoLabel;
}

-(UILabel *)parInfoLabel;
{
    if (_parInfoLabel) {
        return _parInfoLabel;
    }
    
    _parInfoLabel = [self newLabel];
//    [_parInfoLabel setText:@"Par 5"];

    return _parInfoLabel;
}

-(UILabel *)yardsInfoLabel;
{
    if (_yardsInfoLabel) {
        return _yardsInfoLabel;
    }
    
    _yardsInfoLabel = [self newLabel];
//    [_yardsInfoLabel setText:@"345 yards"];

    return _yardsInfoLabel;
}

-(UILabel *)handicapInfoLabel;
{
    if (_handicapInfoLabel) {
        return _handicapInfoLabel;
    }
    
    _handicapInfoLabel = [self newLabel];
//    [_handicapInfoLabel setText:@"Handicap 6"];

    return _handicapInfoLabel;
}

@end
