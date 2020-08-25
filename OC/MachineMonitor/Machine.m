//
//  Machine.m
//  lession4-machine-monitor
//
//  Created by Jason Bai on 3/15/20.
//  Copyright © 2020 tjnu. All rights reserved.
//

#import "Machine.h"
#import "MachineData.h"

//The unit is second(s).
#define CHECK_TIMER_INTERVAL 10.0

#define PREPARE_CHECK_INTERVAL 2.0f
#define DO_CHECK_INTERVAL 3.0f

//The machine is busy state(Per 5 times check mechanism)
#define MACHINE_BUSY_THRESHOLD 5

@interface Machine()

@property (nonatomic, assign) BOOL isBusy;
@property (nonatomic, strong) NSTimer *checkTimer;
@property (nonatomic, assign) uint64_t checkCounter;
@property (nonatomic, strong) NSMutableArray<MachineDataListener> *listenerList;


@end

@implementation Machine

- (id)init
{
    self = [super init];
    if (self) {
        _name = @"Default-Name";
        _machineState = MS_INVALID;
        _isBusy = NO;
        _checkCounter = 0;
        _listenerList = [NSMutableArray<MachineDataListener> new];
    }
    return self;
}

-(void)dealloc
{
    [_checkTimer invalidate];
    _checkTimer = nil;
    [_listenerList removeAllObjects];
    _listenerList = nil;
}

#pragma mark - Public Function
- (void)start
{
    NSLog(@"Machine[%@] is start work.", _name);
    _checkTimer = [NSTimer scheduledTimerWithTimeInterval:CHECK_TIMER_INTERVAL target:self selector:@selector(checkMechanism) userInfo:nil repeats:YES];
}

- (void)stop
{
    NSLog(@"Machine[%@] is stop work.", _name);
}

- (void)addMachineDatListener:(id<MachineDataListener>)listener
{
    if (!listener) {
        return;
    }
    
    for (id<MachineDataListener> tmp in _listenerList) {
        if (!tmp) {
            continue;
        }
        
        if (tmp == listener) {
            return;
        }
    }
    
    [_listenerList addObject:listener];
}

- (void)delMachineDatListener:(id<MachineDataListener>)listener;
{
    if (!listener) {
        return;
    }
    [_listenerList removeObject:listener];
}

#pragma mark - Private Function
- (void)checkMechanism
{
    _isBusy = ((++_checkCounter % MACHINE_BUSY_THRESHOLD) == 0) ? YES : NO;
    if (_isBusy) {
        NSLog(@"[%@] is Busy[Check times:%lld]. Not send check info!!!", _name, _checkCounter);
    }
    [self prepareCheck];
}

- (void)prepareCheck
{
    _machineState = MS_CHECK_BEGIN;
    [self notifyMachineDataToServer];
    [self performSelector:@selector(doCheck) withObject:nil afterDelay:PREPARE_CHECK_INTERVAL];
}

- (void)doCheck
{
    _machineState = MS_CHECK_ONGOING;
    [self notifyMachineDataToServer];
    [self performSelector:@selector(endCheck) withObject:nil afterDelay:DO_CHECK_INTERVAL];
}

- (void)endCheck
{
    _machineState = MS_CHECK_END;
    [self notifyMachineDataToServer];
}

- (void)notifyMachineDataToServer
{
    MachineData *machineData = [[MachineData alloc] initWithName:_name timestamp:[self getCurrentTimestampStr] machineState:_machineState];

    for (id<MachineDataListener> tmp in _listenerList) {
        if (!tmp) {
            continue;
        }
        [tmp notifyMachineData:machineData];
    }
}
                                
- (NSString*)getCurrentTimestampStr
{
    NSDateFormatter*formatter =[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate*currentDate =[NSDate date];
    return [formatter stringFromDate:currentDate];
}

@end
