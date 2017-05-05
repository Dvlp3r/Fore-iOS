//
//  CustomTextField.m
//  Fore
//
//  Created by pavan krishna on 04/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "CustomTextField.h"
@interface CustomTextField()

@property (nonatomic, strong) UIView *backgroundView;

@end

@implementation CustomTextField

- (id)initWithFrame:(CGRect)frame;
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundView:[[UIView alloc] initWithFrame:frame]];
        [self addSubview:[self backgroundView]];
        [self addSubviews];
        [self updateConstraints];
    }
    return self;
}

- (void)addSubviews;
{
    [self addSubview:[self urlTextfield]];
    [self addSubview:[self iconImageView]];
    [[self iconImageView] setUserInteractionEnabled:YES];
    
    [[self urlTextfield] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[self iconImageView] setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [[self urlTextfield] setAccessibilityLabel:@"urltextfield"];
    [[self urlTextfield] setKeyboardType:UIKeyboardTypeURL];
    [[self urlTextfield] setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [[self urlTextfield] setAutocorrectionType:UITextAutocorrectionTypeNo];
    [[self urlTextfield] setFont:[[self themeService] lightItalicFontWithSize:17.0f]];
    [[self urlTextfield] setTextColor:[[self themeService] whiteColor]];
    
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"pstextfield_placeholder_text", "Text field placeholder text")
                                                                    attributes:@{ NSForegroundColorAttributeName : [[self themeService] whiteColor] }];
    [[self urlTextfield] setAttributedPlaceholder:attString];
    
    [self setNeedsUpdateConstraints];
    
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                        action:@selector(imageTapped)];
    [[self iconImageView] addGestureRecognizer:gestureRecognizer];
}

- (void)updateConstraints;
{
    [super updateConstraints];
    
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    [[self iconImageView] makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.centerY);
        make.right.equalTo(self.right).with.offset(-10);
    }];
    
    [[self urlTextfield] makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.and.bottom.equalTo(self).with.insets(insets);
        make.right.equalTo(self.right).with.offset(-33);
    }];
    
    [[self backgroundView] makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)imageTapped;
{
    [[self delegate] imageViewTapped];
}


@end
