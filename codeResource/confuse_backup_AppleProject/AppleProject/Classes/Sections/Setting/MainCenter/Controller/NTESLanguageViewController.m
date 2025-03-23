//
//  NTESLanguageViewController.m
//  NIM
//
//  Created by Yan Wang on 2024/6/29.
//  Copyright © 2024 Netease. All rights reserved.
//

#import "NTESLanguageViewController.h"
#import "CCCCommonTableDelegate.h"
#import "CCCCommonTableData.h"
#import "SVProgressHUD.h"
#import "UIView+Toast.h"
#import "NTESLanguageTableViewCell.h"
#import "LEEAlert.h"
#import "LEEAlertHelper.h"
#import "NTESMainTabController.h"

@interface NTESLanguageViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,copy  ) NSArray                 *tData;
@property (nonatomic,copy  ) NSArray                 *data;

@property (nonatomic,assign) NIMUserGender           selectedGender;

@property (nonatomic,copy  ) NSMutableArray *MuttableData;
@property (nonatomic,strong) UIView *searchView;
@property (nonatomic,strong) UITextField *searchField;
@property (nonatomic,strong) UIButton *btnClose;

@end

@implementation NTESLanguageViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg"]];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    bg.image = [UIImage imageNamed:@"common_bg"];
    [self.view addSubview:bg];
//    self.view.backgroundColor = [UIColor colorWithRed:243/255.0 green:242/255.0 blue:252/255.0 alpha:1.0];

    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_TOP_HEIGHT)];
    [self.view addSubview:bgView];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(5, SCREEN_STATUS_HEIGHT+4, 40, 40);
    [backButton setImage:[UIImage imageNamed:@"back_arrow_bl"] forState:(UIControlStateNormal)];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:backButton];
    
    UILabel *labtitle = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-200)/2, SCREEN_STATUS_HEIGHT+4, 200, 40)];
    labtitle.font = [UIFont systemFontOfSize:16.f];
    labtitle.textColor = [UIColor blackColor];
    labtitle.textAlignment = NSTextAlignmentCenter;
    labtitle.text = LangKey(@"system_change_language");
    [bgView addSubview:labtitle];
    
//    [self buildData];
    
//    __weak typeof(self) wself = self;
//    self.delegator = [[KEKECommonTableDelegate alloc] initWithTableData:^NSArray *{
//        return wself.data;
//    }];
    
    [self.view addSubview:self.searchView];
    self.searchView.frame = CGRectMake(15, SCREEN_TOP_HEIGHT+15, SCREEN_WIDTH-30, 40);
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(15, SCREEN_TOP_HEIGHT+70+15, SCREEN_WIDTH-30, SCREEN_HEIGHT-SCREEN_TOP_HEIGHT-100) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
//    self.tableView.scrollEnabled = NO;
    self.tableView.layer.cornerRadius = 12;
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[NTESLanguageTableViewCell class] forCellReuseIdentifier:@"lang"];
    
    
    self.tData = @[
    @{
        @"Title" : @"中文",
        @"Language"      : @"zh",
    },
    @{
        @"Title" : @"中文繁体（新加坡）",
        @"Language"      : @"hant",
    },
    @{
        @"Title"         : @"English",
        @"Language"      : @"en",
    },
    @{
        @"Title"         : @"ภาษาไทย ", // 泰语
        @"Language"      : @"th",
    },
    @{
        @"Title"         : @"Việt nam", // 越南
        @"Language"      : @"vi",
    },
    @{
        @"Title"         : @"हिंदी", // 印度
        @"Language"      : @"hi",
    },
    @{
        @"Title"         : @"にほんご", // 日语
        @"Language"      : @"ja",
    },
    @{
        @"Title"         : @"한국어", //韩语
        @"Language"      : @"ko",
    },
    @{
        @"Title"         : @"Español", // 西班牙
        @"Language"      : @"spa",
    },
    @{
        @"Title"         : @"Língua portuguesa", // 葡萄牙
        @"Language"      : @"pt",
    },
    @{
        @"Title"         : @"En français", // 法语
        @"Language"      : @"fr",
    },
    @{
        @"Title"         : @"العربية", // 阿拉伯语-沙特
        @"Language"      : @"sa",
    },
    @{
        @"Title"         : @"বাঙ্গালি",// 孟加拉语
        @"Language"      : @"bd",
    },
    @{
        @"Title"         : @"русск",// 俄语
        @"Language"      : @"ru",
    },
    @{
        @"Title"         : @"اردو",// 乌尔都语-巴基斯坦
        @"Language"      : @"pk",
    },
    @{
        @"Title"         : @"Das ist Deutsch.",// 德语
        @"Language"      : @"de",
    },
    @{
        @"Title"         : @"Kiswahili",// 斯瓦希里语  - 乌干达
        @"Language"      : @"ug",
    },
    @{
        @"Title"         : @"Türkçe",// 土耳其语
        @"Language"      : @"tr",
    },
    @{
        @"Title"         : @"العربية المصرية",// 埃及阿拉伯语
        @"Language"      : @"eg",
    },
    @{
        @"Title"         : @"italiano",// 意大利语
        @"Language"      : @"it",
    }];
    
    self.data = [NSArray arrayWithArray:self.tData];
    
    self.MuttableData = [NSMutableArray array];
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *searchText = textField.text;
    
//    NSString *searchText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if (searchText.length>0) {
//        NSMutableArray *muArray = [NSMutableArray array];
//        for (NSDictionary *dic in self.data) {
//            if ([dic[@"Title"] rangeOfString:searchText].location != NSNotFound) {
//                [muArray addObject:dic];
//            }
//        }
//        self.data = [muArray copy];
//        [self.tableView reloadData];
    }else{
        self.data = self.tData;
        [self.tableView reloadData];
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    if(textField.text.length == 0){
        self.data = self.tData;
        [self.tableView reloadData];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    NSString *searchText = textField.text;
    if (searchText.length>0) {
        NSMutableArray *muArray = [NSMutableArray array];
        for (NSDictionary *dic in self.data) {
            if ([dic[@"Title"] rangeOfString:searchText].location != NSNotFound) {
                [muArray addObject:dic];
            }
        }
        self.data = [muArray copy];
        [self.tableView reloadData];
    }else{
        self.data = self.tData;
        [self.tableView reloadData];
    }
    
    return YES;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    self.data = self.tData;
    [self.tableView reloadData];
    return YES;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *backView = [UIView new];
    backView.backgroundColor = [UIColor clearColor];
    return backView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *backView = [UIView new];
    backView.backgroundColor = [UIColor clearColor];
    return backView;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NTESLanguageTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"lang" forIndexPath:indexPath];
      //MyTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"ft"];
      //if(cell == nil) {
      //    cell = [[MyTableViewCell alloc] initWithStyle:UITableViewStylePlain reuseIdentifier:@"ft"];
      //}
    NSDictionary *dic = self.data[indexPath.row];
    cell.labTitle.text = dic[@"Title"];

      return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   
    [self changedLanguages:self.data[indexPath.row][@"Language"]];

}

- (void)changedLanguages:(NSString *)lang {
    
    NSString *alertStr = LangKey(@"system_change_language");
    NSString *cancle = LangKey(@"contact_tag_fragment_cancel");
    NSString *sure = LangKey(@"contact_tag_fragment_sure");
    
    [LEEAlert alert].config
    .LeeAddTitle(^(UILabel *label) {
        label.text = alertStr;
        label.textColor = [UIColor darkGrayColor];
    })
    .LeeAddAction(^(LEEAction *action) {
        
        action.type = LEEActionTypeDefault;
        action.title = sure;
        action.titleColor = TextColor_4;
        action.backgroundColor = [UIColor whiteColor];
        action.backgroundHighlightColor = [UIColor colorWithRed:239/255.0f green:239/255.0f blue:239/255.0f alpha:1.0f];
        action.borderWidth = 1.0f;
        action.borderColor = action.backgroundHighlightColor;
        action.clickBlock = ^{
//            [NIMUserDefaults standardUserDefaults].language = lang;
//            [self exitApp];
            
            [[NIMUserDefaults standardUserDefaults] updateLanguageWith:lang];
            
            // 语言切换后返回到"我的"页面
            NTESMainTabController *mainTabController = [NTESMainTabController instance];
            if (mainTabController) {
                // 先切换到目标标签页，避免闪烁
                [mainTabController setSelectedIndex:2];
                
                // 确保 TabBar 是显示的
                [mainTabController showTabBar];
                
                // 关闭所有子页面，回到根视图控制器
                [UIView performWithoutAnimation:^{
                    for (UINavigationController *nav in mainTabController.viewControllers) {
                        [nav popToRootViewControllerAnimated:NO];
                    }
                    
                    // 关闭当前视图控制器
                    [self.navigationController popToRootViewControllerAnimated:NO];
                }];
            }
        };
    })
    .LeeAddAction(^(LEEAction *action) {
        
        action.type = LEEActionTypeCancel;
        action.title = cancle;
        action.titleColor = TextColor_4;
        action.backgroundColor = [UIColor whiteColor];
        action.backgroundHighlightColor = [UIColor colorWithRed:239/255.0f green:239/255.0f blue:239/255.0f alpha:1.0f];
        action.borderWidth = 1.0f;
        action.borderColor = action.backgroundHighlightColor;
    })
    .LeeShow();

}

-(void)exitApp{
    NSString *alertStr = LangKey(@"system_change_language_title");
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:alertStr preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:LangKey(@"contact_tag_fragment_sure") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        exit(0);
    }]];

    [alert addAction:[UIAlertAction actionWithTitle:LangKey(@"contact_tag_fragment_cancel") style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
    }]];
    
    UIViewController *rootVC = [UIApplication sharedApplication].windows.firstObject.rootViewController;
    [rootVC presentViewController:alert animated:YES completion:nil];
    
}

- (void)buildData{
    
    NSString *lang = [NIMUserDefaults standardUserDefaults].language;
    NSArray *data = @[
#ifdef DEBUG
        
        @{
            HeaderTitle:@"",
            RowContent :@[
                @{
                    Title         : @"中文",
                    CellClass     : @"KEKESelectSettingCell",
                    RowHeight     : @(56),
                    CellAction    : @"changedLanguage:",
                    ExtraInfo     : @([lang isEqualToString:@"zh"]),
                    Language      : @"zh",
                },
            ],
            FooterTitle:@""
        },
#endif
        @{
            HeaderTitle:@"",
            RowContent :@[
                @{
                    Title         : @"English",
                    CellClass     : @"KEKESelectSettingCell",
                    RowHeight     : @(56),
                    CellAction    : @"changedLanguage:",
                    ExtraInfo     : @([lang isEqualToString:@"en"]),
                    Language      : @"en",

                },
            ],
            FooterTitle:@""
        },
        
        @{
            HeaderTitle:@"",
            RowContent :@[
                @{
                    Title         : @"ภาษาไทย ", // 泰语
                    CellClass     : @"KEKESelectSettingCell",
                    RowHeight     : @(56),
                    CellAction    : @"changedLanguage:",
                    ExtraInfo     : @([lang isEqualToString:@"th"]),
                    Language      : @"th",

                },
            ],
            FooterTitle:@""
        },
        
        @{
            HeaderTitle:@"",
            RowContent :@[
                @{
                    Title         : @"Việt nam", // 越南
                    CellClass     : @"KEKESelectSettingCell",
                    RowHeight     : @(56),
                    CellAction    : @"changedLanguage:",
                    ExtraInfo     : @([lang isEqualToString:@"vi"]),
                    Language      : @"vi",

                },
            ],
            FooterTitle:@""
        },
        
        @{
            HeaderTitle:@"",
            RowContent :@[
                @{
                    Title         : @"हिंदी", // 印度
                    CellClass     : @"KEKESelectSettingCell",
                    RowHeight     : @(56),
                    CellAction    : @"changedLanguage:",
                    ExtraInfo     : @([lang isEqualToString:@"hi"]),
                    Language      : @"hi",

                },
            ],
            FooterTitle:@""
        },
        
        @{
            HeaderTitle:@"",
            RowContent :@[
                @{
                    Title         : @"にほんご", // 日语
                    CellClass     : @"KEKESelectSettingCell",
                    RowHeight     : @(56),
                    CellAction    : @"changedLanguage:",
                    ExtraInfo     : @([lang isEqualToString:@"ja"]),
                    Language      : @"ja",

                },
            ],
            FooterTitle:@""
        },
        
        @{
            HeaderTitle:@"",
            RowContent :@[
                @{
                    Title         : @"한국어", //韩语
                    CellClass     : @"KEKESelectSettingCell",
                    RowHeight     : @(56),
                    CellAction    : @"changedLanguage:",
                    ExtraInfo     : @([lang isEqualToString:@"ko"]),
                    Language      : @"ko",

                },
            ],
            FooterTitle:@""
        },
        
        @{
            HeaderTitle:@"",
            RowContent :@[
                @{
                    Title         : @"Español", // 西班牙
                    CellClass     : @"KEKESelectSettingCell",
                    RowHeight     : @(56),
                    CellAction    : @"changedLanguage:",
                    ExtraInfo     : @([lang isEqualToString:@"spa"]),
                    Language      : @"spa",

                },
            ],
            FooterTitle:@""
        },
        
        @{
            HeaderTitle:@"",
            RowContent :@[
                @{
                    Title         : @"Língua portuguesa", // 葡萄牙
                    CellClass     : @"KEKESelectSettingCell",
                    RowHeight     : @(56),
                    CellAction    : @"changedLanguage:",
                    ExtraInfo     : @([lang isEqualToString:@"pt"]),
                    Language      : @"pt",

                },
            ],
            FooterTitle:@""
        },
        @{
            HeaderTitle:@"",
            RowContent :@[
                @{
                    Title         : @"En français", // 法语
                    CellClass     : @"KEKESelectSettingCell",
                    RowHeight     : @(56),
                    CellAction    : @"changedLanguage:",
                    ExtraInfo     : @([lang isEqualToString:@"fr"]),
                    Language      : @"fr",

                },
            ],
            FooterTitle:@""
        },
        @{
            HeaderTitle:@"",
            RowContent :@[
                @{
                    Title         : @"العربية", // 阿拉伯语-沙特
                    CellClass     : @"KEKESelectSettingCell",
                    RowHeight     : @(56),
                    CellAction    : @"changedLanguage:",
                    ExtraInfo     : @([lang isEqualToString:@"sa"]),
                    Language      : @"sa",

                },
            ],
            FooterTitle:@""
        },
        @{
            HeaderTitle:@"",
            RowContent :@[
                @{
                    Title         : @"বাঙ্গালি" ,// 孟加拉语
                    CellClass     : @"KEKESelectSettingCell",
                    RowHeight     : @(56),
                    CellAction    : @"changedLanguage:",
                    ExtraInfo     : @([lang isEqualToString:@"bd"]),
                    Language      : @"bd",

                },
            ],
            FooterTitle:@""
        },
        @{
            HeaderTitle:@"",
            RowContent :@[
                @{
                    Title         : @"русск" ,// 俄语
                    CellClass     : @"KEKESelectSettingCell",
                    RowHeight     : @(56),
                    CellAction    : @"changedLanguage:",
                    ExtraInfo     : @([lang isEqualToString:@"ru"]),
                    Language      : @"ru",

                },
            ],
            FooterTitle:@""
        },
        @{
            HeaderTitle:@"",
            RowContent :@[
                @{
                    Title         : @"اردو" ,// 乌尔都语-巴基斯坦
                    CellClass     : @"KEKESelectSettingCell",
                    RowHeight     : @(56),
                    CellAction    : @"changedLanguage:",
                    ExtraInfo     : @([lang isEqualToString:@"pk"]),
                    Language      : @"pk",

                },
            ],
            FooterTitle:@""
        },
        @{
            HeaderTitle:@"",
            RowContent :@[
                @{
                    Title         : @"Das ist Deutsch." ,// 德语
                    CellClass     : @"KEKESelectSettingCell",
                    RowHeight     : @(56),
                    CellAction    : @"changedLanguage:",
                    ExtraInfo     : @([lang isEqualToString:@"de"]),
                    Language      : @"de",

                },
            ],
            FooterTitle:@""
        },
        @{
            HeaderTitle:@"",
            RowContent :@[
                @{
                    Title         : @"Kiswahili" ,// 斯瓦希里语  - 乌干达
                    CellClass     : @"KEKESelectSettingCell",
                    RowHeight     : @(56),
                    CellAction    : @"changedLanguage:",
                    ExtraInfo     : @([lang isEqualToString:@"ug"]),
                    Language      : @"ug",

                },
            ],
            FooterTitle:@""
        },
        @{
            HeaderTitle:@"",
            RowContent :@[
                @{
                    Title         : @"Türkçe" ,// 土耳其语
                    CellClass     : @"KEKESelectSettingCell",
                    RowHeight     : @(56),
                    CellAction    : @"changedLanguage:",
                    ExtraInfo     : @([lang isEqualToString:@"tr"]),
                    Language      : @"tr",

                },
            ],
            FooterTitle:@""
        },
        @{
            HeaderTitle:@"",
            RowContent :@[
                @{
                    Title         : @"العربية المصرية" ,// 埃及阿拉伯语
                    CellClass     : @"KEKESelectSettingCell",
                    RowHeight     : @(56),
                    CellAction    : @"changedLanguage:",
                    ExtraInfo     : @([lang isEqualToString:@"eg"]),
                    Language      : @"eg",

                },
            ],
            FooterTitle:@""
        },
        @{
            HeaderTitle:@"",
            RowContent :@[
                @{
                    Title         : @"italiano" ,// 意大利语
                    CellClass     : @"KEKESelectSettingCell",
                    RowHeight     : @(56),
                    CellAction    : @"changedLanguage:",
                    ExtraInfo     : @([lang isEqualToString:@"it"]),
                    Language      : @"it",

                },
            ],
            FooterTitle:@""
        },
        
    ];
    self.data = [NIMCommonTableSection sectionsWithData:data];
}


- (void)refresh{
    [self buildData];
    [self.tableView reloadData];
}


- (UIView *)searchView{
    if(!_searchView){
        _searchView = [[UIView alloc]init];
        _searchView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        _searchView.layer.cornerRadius = 8;
        _searchView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
        _searchView.layer.shadowOffset = CGSizeMake(0,3);
        _searchView.layer.shadowOpacity = 1;
        _searchView.layer.shadowRadius = 0;
        UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake(13, 12, 16, 16)];
        icon.image = [UIImage imageNamed:@"icon_search"];
        [_searchView addSubview:icon];
        
        _searchField = [[UITextField alloc]initWithFrame:CGRectMake(13+12+10, 0, SCREEN_WIDTH-30-26-16-10, 40)];
        _searchField.placeholder = @"搜索".nim_localized;
        _searchField.textColor = [UIColor colorWithRed:28/255.0 green:45/255.0 blue:66/255.0 alpha:1];
        _searchField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _searchField.delegate = self;
        _searchField.returnKeyType = UIReturnKeySearch;
        [_searchView addSubview:_searchField];
        
//        _btnClose = [UIButton buttonWithType:UIButtonTypeCustom];
//        _btnClose.frame = CGRectMake(SCREEN_WIDTH-15-13-16, 12, 16, 16);
//        [_btnClose setImage:[UIImage imageNamed:@"icon_search_close"] forState:UIControlStateNormal];
//        [_searchView addSubview:_btnClose];
//        _btnClose.hidden = YES;
    }
    return _searchView;
}

@end
