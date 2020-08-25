//
//  MachineData.m
//  lession4-machine-monitor
//
//  Created by Jason Bai on 3/15/20.
//  Copyright © 2020 tjnu. All rights reserved.
//

#import "MachineData.h"

@implementation MachineData

- (id)initWithName:(NSString*)name
         timestamp:(NSString*)timestamp
      machineState:(MachineState)machineState
{
    self = [super init];
    if (self) {
        _name = name;
        _timestamp = timestamp;
        _machineState = machineState;
    }
    return self;
}

- (NSString*)getMachineStateStr
{
    NSString *machineStateStr;
    switch (_machineState) {
        case MS_INVALID:
        {
            machineStateStr = @"MS_INVALID";
            break;
        }
            
        case MS_CHECK_BEGIN:
        {
            machineStateStr = @"MS_CHECK_BEGIN";
            break;
        }
            
        case MS_CHECK_ONGOING:
        {
            machineStateStr = @"MS_CHECK_ONGOING";
            break;
        }
            
        case MS_CHECK_END:
        {
            machineStateStr = @"MS_CHECK_END";
            break;
        }

        default:
        {
            break;
        }
    }
    return machineStateStr;
}

@end
