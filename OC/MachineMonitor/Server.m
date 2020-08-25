//
//  Server.m
//  lession4-machine-monitor
//
//  Created by Jason Bai on 3/15/20.
//  Copyright © 2020 tjnu. All rights reserved.
//

#import "Server.h"
#import "Machine.h"
#import "MachineData.h"

@interface Server()

@property (nonatomic, copy)NSString *name;

@end

@implementation Server

- (id)initWithName:(NSString*)serverName
{
    self = [super init];
    if (self) {
        _name = serverName;
    }
    return self;
}

- (void)initialize
{

}

- (void)start
{

}

- (void)stop
{

}

- (void)notifyMachineData:(MachineData*)machineData
{
    if (machineData) {
        NSLog(@"{To:%@}:[%@]-[%@]-[%@]", _name, machineData.timestamp, machineData.name, [machineData getMachineStateStr]);
    }
}

@end
