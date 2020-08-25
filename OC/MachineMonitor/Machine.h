//
//  Machine.h
//  lession4-machine-monitor
//
//  Created by Jason Bai on 3/15/20.
//  Copyright © 2020 tjnu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MachineDataListener.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, MachineState) {
    MS_INVALID = 0,
    MS_CHECK_BEGIN,
    MS_CHECK_ONGOING,
    MS_CHECK_END,
};

@interface Machine : NSObject

@property (nonatomic, copy)NSString *name;
@property (nonatomic, assign, readonly)MachineState machineState;

- (void)start;
- (void)stop;

- (void)addMachineDatListener:(id<MachineDataListener>)listener;
- (void)delMachineDatListener:(id<MachineDataListener>)listener;

@end



NS_ASSUME_NONNULL_END
