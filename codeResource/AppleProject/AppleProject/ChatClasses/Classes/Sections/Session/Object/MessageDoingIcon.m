// __DEBUG__
// __CLOSE_PRINT__
//
//  MessageDoingIcon.m
// Indicator
//
//  Created by chris on 2016/11/7.
//  Copyright © 2016年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCSessionConfigurator.h"
#import "MessageDoingIcon.h"
//: #import "CCCSessionMsgDatasource.h"
#import "AddIndicator.h"
//: #import "CCCSessionInteractorImpl.h"
#import "OfImpl.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "BBBMessageModel.h"
#import "AccumulationCenter.h"
//: #import "CCCGlobalMacro.h"
#import "CCCGlobalMacro.h"
//: #import "CCCSessionInteractorImpl.h"
#import "OfImpl.h"
//: #import "CCCSessionDataSourceImpl.h"
#import "ContainerTing.h"
//: #import "CCCSessionLayoutImpl.h"
#import "InformationImpl.h"
//: #import "CCCSessionTableAdapter.h"
#import "AddTable.h"

/*
                                            TutorialViewController 类关系图
 
 
             .........................................................................
             .                                                                       .
             .                                                                       .
             .                                                                       .                  | ---> [NIMSessionDatasource]
             .                                                                       .
             .                                                       | ---> [WriterSContentSumeractor] -->  |
             .
             .                                                                                          | ---> [ShouldLayout]
             .
             ↓
  [TutorialViewController]-------> [MessageDoingIcon] -----> |
             |
             |
             |
             |
             ↓                                                       | ---> [AddTable]
       [UITableView]                                                              .
            ↑                                                                     .
            .                                                                     .
            .                                                                     .
            .......................................................................
 */

//: @interface CCCSessionConfigurator()
@interface MessageDoingIcon()

//: @property (nonatomic,strong) CCCSessionInteractorImpl *interactor;
@property (nonatomic,strong) OfImpl *interactor;

//: @property (nonatomic,strong) CCCSessionTableAdapter *tableAdapter;
@property (nonatomic,strong) AddTable *tableAdapter;

//: @end
@end

//: @implementation CCCSessionConfigurator
@implementation MessageDoingIcon

//: - (void)setup:(CCCSessionViewController *)vc
- (void)objectEmpty:(TutorialViewController *)vc
{
    //: NIMSession *session = vc.session;
    NIMSession *session = vc.session;
    //: id<CCCSessionConfig> sessionConfig = vc.sessionConfig;
    id<FromConfig> sessionConfig = vc.iconConfig;
    //: UITableView *tableView = vc.tableView;
    UITableView *tableView = vc.tableView;
    //: AAAInputView *inputView = vc.sessionInputView;
    ClueView *inputView = vc.sessionInputView;

    //: CCCSessionDataSourceImpl *datasource = [[CCCSessionDataSourceImpl alloc] initWithSession:session config:sessionConfig];
    ContainerTing *datasource = [[ContainerTing alloc] initWithSize:session frame:sessionConfig];
    //: CCCSessionLayoutImpl *layout = [[CCCSessionLayoutImpl alloc] initWithSession:session config:sessionConfig];
    InformationImpl *layout = [[InformationImpl alloc] initWithFind:session rangeNumber:sessionConfig];
    //: layout.tableView = tableView;
    layout.tableView = tableView;
    //: layout.inputView = inputView;
    layout.inputView = inputView;


    //: _interactor = [[CCCSessionInteractorImpl alloc] initWithSession:session config:sessionConfig];
    _interactor = [[OfImpl alloc] initWithParameter:session next:sessionConfig];
    //: _interactor.delegate = vc;
    _interactor.delegate = vc;
    //: _interactor.dataSource = datasource;
    _interactor.dataSource = datasource;
    //: _interactor.layout = layout;
    _interactor.layout = layout;

    [layout setDelegate:_interactor];

    //: _tableAdapter = [[CCCSessionTableAdapter alloc] init];
    _tableAdapter = [[AddTable alloc] init];
    //: _tableAdapter.interactor = _interactor;
    _tableAdapter.interactor = _interactor;
    //: _tableAdapter.delegate = vc;
    _tableAdapter.delegate = vc;
    //: vc.tableView.delegate = _tableAdapter;
    vc.tableView.delegate = _tableAdapter;
    //: vc.tableView.dataSource = _tableAdapter;
    vc.tableView.dataSource = _tableAdapter;


    //: [vc setInteractor:_interactor];
    [vc setInteractor:_interactor];
}


//: @end
@end
