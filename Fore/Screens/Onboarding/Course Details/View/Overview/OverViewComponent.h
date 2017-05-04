//
//  OverViewComponent.h
//  Fore
//
//  Created by pavan krishna on 01/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SOLWeatherData.h"

@interface OverViewComponent : UIView<UITableViewDataSource,UITableViewDelegate>

- (void)updateWeatherViewWithData:(SOLWeatherData *)data;

@end
