//
//  CustomTextField.h
//  Fore
//
//  Created by pavan krishna on 04/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomTextFieldSearchDelegate <NSObject>

- (void)imageViewTapped;

@end

@interface CustomTextField : UIView

@property (nonatomic, strong) UITextField *urlTextfield;
@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, assign) id<CustomTextFieldSearchDelegate> delegate;

@end
