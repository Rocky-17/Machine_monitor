//
//  MachineData.h
//  lession4-machine-monitor
//
//  Created by Jason Bai on 3/15/20.
//  Copyright © 2020 tjnu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Machine.h"

NS_ASSUME_NONNULL_BEGIN

@interface MachineData : NSObject

@property (nonatomic, copy)NSString *timestamp;
@property (nonatomic, copy)NSString *name;
@property (nonatomic, assign)MachineState machineState;

- (id)initWithName:(NSString*)name
         timestamp:(NSString*)timestamp
      machineState:(MachineState)machineState;

- (NSString*)getMachineStateStr;

@end

NS_ASSUME_NONNULL_END
