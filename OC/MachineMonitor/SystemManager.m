//
//  SystemManager.m
//  lession4-machine-monitor
//
//  Created by Jason Bai on 3/29/20.
//  Copyright © 2020 tjnu. All rights reserved.
//

#import "SystemManager.h"
#import "Server.h"
#import "Machine.h"

#define MAX_MACHINE_COUNT 4

@interface SystemManager()

@property (nonatomic, strong) Server *server1;
@property (nonatomic, strong) Server *server2;
@property (nonatomic, strong) NSMutableArray<Machine*> *machineList;

@end

@implementation SystemManager

- (void)start
{
    _server1 = [[Server alloc] initWithName:@"Server-1"];
    _server2 = [[Server alloc] initWithName:@"Server-2"];
    
    _machineList = [NSMutableArray<Machine*> new];
    for (int i=0; i<MAX_MACHINE_COUNT; i++) {
        Machine *machine = [Machine new];
        machine.name = [NSString stringWithFormat:@"Machine-%d", i];
        
        [machine addMachineDatListener:_server1];
        [machine addMachineDatListener:_server2];
        [machine start];
        
        [_machineList addObject:machine];
    }
    
//    for (Machine *machine in _machineList) {
//        if (!machine) {
//            continue;
//        }
//        [machine delMachineDatListener:_server1];
//    }
}

@end
