//
//  CCCSessionConfigurator.m
// AppleProjectKit
//
//  Created by chris on 2016/11/7.
//  Copyright © 2016年 NetEase. All rights reserved.
//

#import "CCCSessionConfigurator.h"
#import "CCCSessionMsgDatasource.h"
#import "CCCSessionInteractorImpl.h"
#import "UIViewNimKit.h"
#import "BBBMessageModel.h"
#import "CCCGlobalMacro.h"
#import "CCCSessionInteractorImpl.h"
#import "CCCSessionDataSourceImpl.h"
#import "CCCSessionLayoutImpl.h"
#import "CCCSessionTableAdapter.h"
/*
                                            CCCSessionViewController 类关系图
 
 
             .........................................................................
             .                                                                       .
             .                                                                       .
             .                                                                       .                  | ---> [NIMSessionDatasource]
             .                                                                       .
             .                                                       | ---> [NIMSessionInteractor] -->  |
             .
             .                                                                                          | ---> [NIMSessionLayout]
             .
             ↓
  [CCCSessionViewController]-------> [CCCSessionConfigurator] -----> |
             |
             |
             |
             |
             ↓                                                       | ---> [CCCSessionTableAdapter]
       [UITableView]                                                              .
            ↑                                                                     .
            .                                                                     .
            .                                                                     .
            .......................................................................
 */

@interface CCCSessionConfigurator()

@property (nonatomic,strong) CCCSessionInteractorImpl   *interactor;

@property (nonatomic,strong) CCCSessionTableAdapter     *tableAdapter;

@end

@implementation CCCSessionConfigurator

- (void)setup:(CCCSessionViewController *)vc
{
    NIMSession *session    = vc.session;
    id<CCCSessionConfig> sessionConfig = vc.sessionConfig;
    UITableView *tableView  = vc.tableView;
    AAAInputView *inputView = vc.sessionInputView;
    
    CCCSessionDataSourceImpl *datasource = [[CCCSessionDataSourceImpl alloc] initWithSession:session config:sessionConfig];
    CCCSessionLayoutImpl *layout         = [[CCCSessionLayoutImpl alloc] initWithSession:session config:sessionConfig];
    layout.tableView = tableView;
    layout.inputView = inputView;
    
    
    _interactor                          = [[CCCSessionInteractorImpl alloc] initWithSession:session config:sessionConfig];
    _interactor.delegate                 = vc;
    _interactor.dataSource               = datasource;
    _interactor.layout                   = layout;
    
    [layout setDelegate:_interactor];
    
    _tableAdapter = [[CCCSessionTableAdapter alloc] init];
    _tableAdapter.interactor = _interactor;
    _tableAdapter.delegate   = vc;
    vc.tableView.delegate = _tableAdapter;
    vc.tableView.dataSource = _tableAdapter;
    
    
    [vc setInteractor:_interactor];
}


@end
