//
//  MachineDataListener.h
//  lession4-machine-monitor
//
//  Created by Jason Bai on 3/15/20.
//  Copyright © 2020 tjnu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MachineData;

NS_ASSUME_NONNULL_BEGIN

@protocol MachineDataListener <NSObject>

@required

- (void)notifyMachineData:(MachineData*)machineData;

@end

NS_ASSUME_NONNULL_END
