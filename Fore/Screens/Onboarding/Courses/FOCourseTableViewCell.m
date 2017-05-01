//
//  FOCourseTableViewCell.m
//  Fore
//
//  Created by pavan krishna on 01/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "FOCourseTableViewCell.h"

@interface FOCourseTableViewCell()

@property (nonatomic, strong) UIImageView *courseImageView;
@property (nonatomic, strong) UILabel *nameOfCourseLabel;
@property (nonatomic, strong) UILabel *townLabel;
@property (nonatomic, strong) UILabel *parLabel;
@property (nonatomic, strong) UILabel *slopeLabel;
@property (nonatomic, strong) UIButton *starButton;

@end

@implementation FOCourseTableViewCell

#pragma mark - life cycle

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addViews];
    }
    return self;
}

-(void)prepareForReuse;
{
    [super prepareForReuse];
    
//    [self setMediaType:OUChallengeMediaTypeNone];
//    [[self mediaComponent] prepareForReuse];
//    //    [[self infoComponent] prepareForReuse];
//    //    [[self descriptionComponent] prepareForReuse];
//    
//    [self setVideoProgressBlock:nil];
//    [self setVideoCompletionBlock:nil];
//    [[self progressView] setProgress:0];
//    [[self progressView] setHidden:NO];
//    [self setHasVideoURL:NO];
//    
//    [self showSeparator:YES];
    
    
}

//-(void)prepareForReuse;
//{
//    [[self courseImageView] setImage:nil];
//    
//}


#pragma mark view building

-(void)addViews;
{
    [[self contentView] addSubview:[self courseImageView]];
    [[self contentView] addSubview:[self nameOfCourseLabel]];
    [[self contentView] addSubview:[self townLabel]];
    [[self contentView] addSubview:[self parLabel]];
    [[self contentView] addSubview:[self slopeLabel]];
    [[self contentView] addSubview:[self starButton]];
}

-(void)layoutSubviews;
{
    [super layoutSubviews];
    
    CGRect screenFrame = [[UIScreen mainScreen] bounds];
    
    [[self courseImageView] setFrame:CGRectMake(0,
                                               0,
                                               CGRectGetWidth(screenFrame),
                                               CGRectGetWidth(screenFrame))];
    
    [[self nameOfCourseLabel] setFrame:CGRectMake(0,
                                              CGRectGetMaxY([[self courseImageView] frame])+15,
                                              CGRectGetWidth([self frame])/2,
                                              10)];
    
    [[self townLabel] setFrame:CGRectMake(0,
                                                  CGRectGetMaxY([[self nameOfCourseLabel] frame])+3,
                                                  CGRectGetWidth([self frame])/2,
                                                  10)];
    
    [[self parLabel] setFrame:CGRectMake(CGRectGetMaxX([[self courseImageView] frame])-CGRectGetWidth([self frame])/5,
                                         CGRectGetMaxY([[self courseImageView] frame])+15,
                                         CGRectGetWidth([self frame])/5,
                                         10)];

    [[self slopeLabel] setFrame:CGRectMake(CGRectGetMaxX([[self parLabel] frame])+3,
                                         CGRectGetMaxY([[self courseImageView] frame])+15,
                                         CGRectGetWidth([self frame])/5,
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

-(void)setCourseImage:(NSString *)imagePath;
{
    [[self courseImageView] setImage:[UIImage imageNamed:imagePath]];
}

-(void)setCourseName:(NSString *)courseName;
{
    [[self nameOfCourseLabel] setText:courseName];
}

-(void)setTownName:(NSString *)townName;
{
    [[self townLabel] setText:townName];
}

-(void)setParText:(NSString *)par;
{
    [[self parLabel] setText:par];
}

-(void)setSlopeText:(NSString *)slope;
{
    [[self slopeLabel] setText:slope];
}

#pragma mark - Lazy loading

-(UIImageView *)courseImageView;
{
    if (_courseImageView) {
        return _courseImageView;
    }
    
    _courseImageView = [UIImageView new];
    [[_courseImageView layer] setBorderColor:[UIColor redColor].CGColor];
    [[_courseImageView layer] setBorderWidth:1];
    [_courseImageView setImage:[UIImage imageNamed:@"icon_time_display"]];
    [_courseImageView sizeToFit];
    
    return _courseImageView;
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

-(UILabel *)nameOfCourseLabel;
{
    if (_nameOfCourseLabel) {
        return _nameOfCourseLabel;
    }
    
    _nameOfCourseLabel = [self newLabel];
    
    return _nameOfCourseLabel;
}

-(UILabel *)townLabel;
{
    if (_townLabel) {
        return _townLabel;
    }
    
    _townLabel = [self newLabel];
    
    return _townLabel;
}

-(UILabel *)parLabel;
{
    if (_parLabel) {
        return _parLabel;
    }
    
    _parLabel = [self newLabel];
    
    return _parLabel;
}

-(UILabel *)slopeLabel;
{
    if (_slopeLabel) {
        return _slopeLabel;
    }
    
    _slopeLabel = [self newLabel];
    
    return _slopeLabel;
}

@end
