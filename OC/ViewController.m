//
//  ViewController.m
//  lession4-machine-monitor
//
//  Created by Jason Bai on 3/15/20.
//  Copyright © 2020 tjnu. All rights reserved.
//

#import "ViewController.h"
#import "MachineMonitor/SystemManager.h"

@interface ViewController ()

@property (nonatomic, strong)SystemManager *systemManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _systemManager = [SystemManager new];
    [_systemManager start];
}


@end
