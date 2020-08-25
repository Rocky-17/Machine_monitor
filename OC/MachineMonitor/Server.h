//
//  Server.h
//  lession4-machine-monitor
//
//  Created by Jason Bai on 3/15/20.
//  Copyright © 2020 tjnu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MachineDataListener.h"

NS_ASSUME_NONNULL_BEGIN

@interface Server: NSObject<MachineDataListener> 


- (id)initWithName:(NSString*)serverName;

- (void)initialize;
- (void)start;
- (void)stop;

@end

NS_ASSUME_NONNULL_END
