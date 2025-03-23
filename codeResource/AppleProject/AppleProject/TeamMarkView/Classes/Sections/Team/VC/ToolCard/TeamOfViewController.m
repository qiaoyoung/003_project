
#import <Foundation/Foundation.h>
typedef struct {
    Byte verdAntique;
    Byte *chemicalOff;
    unsigned int withSession;
    bool leap;
	int murderMember;
	int rubric;
} ConstrainData;

NSString *StringFromConstrainData(ConstrainData *data);


//: #2BBCFB
ConstrainData str_flueData = (ConstrainData){101, (Byte []){70, 87, 39, 39, 38, 35, 39, 164}, 7, false, 207, 155};


//: #009ADC
ConstrainData str_encounterTitle = (ConstrainData){244, (Byte []){215, 196, 196, 205, 181, 176, 183, 185}, 7, false, 75, 125};


//: common_bg
ConstrainData str_qualifyData = (ConstrainData){203, (Byte []){168, 164, 166, 166, 164, 165, 148, 169, 172, 152}, 9, false, 147, 14};


//: contact_list_activity_complete
ConstrainData str_textDateScanValue = (ConstrainData){160, (Byte []){195, 207, 206, 212, 193, 195, 212, 255, 204, 201, 211, 212, 255, 193, 195, 212, 201, 214, 201, 212, 217, 255, 195, 207, 205, 208, 204, 197, 212, 197, 85}, 30, false, 154, 122};


//: ZMONTeamCartSet%ld
ConstrainData str_eagerCenterTanName = (ConstrainData){50, (Byte []){104, 127, 125, 124, 102, 87, 83, 95, 113, 83, 64, 70, 97, 87, 70, 23, 94, 86, 28}, 18, false, 37, 5};


//: back_arrow_bl
ConstrainData str_intervalText = (ConstrainData){93, (Byte []){63, 60, 62, 54, 2, 60, 47, 47, 50, 42, 2, 63, 49, 225}, 13, false, 235, 211};

// __DEBUG__
// __CLOSE_PRINT__
//
//  TeamOfViewController.m
// Indicator
//
//  Created by Netease on 2019/7/16.
//  Copyright © 2019 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BBBTeamCardSelectedViewController.h"
#import "TeamOfViewController.h"
//: #import "UserGlobalMacro.h"
#import "UserGlobalMacro.h"
//: #import "ZMONTeamCartSetTableViewCell.h"
#import "SectionTapCellView.h"

//: @interface BBBTeamCardSelectedViewController ()<UITableViewDelegate, UITableViewDataSource>
@interface TeamOfViewController ()<UITableViewDelegate, UITableViewDataSource>

//: @property (nonatomic, strong) NSMutableArray <id <NIMKitSelectCardData>> *datas;
@property (nonatomic, strong) NSMutableArray <id <StateLanguage>> *datas;

//: @property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITableView *tableView;

//: @property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, assign) NSInteger selectedIndex;

//: @property (nonatomic, assign) NSInteger oriSelectedIndex;
@property (nonatomic, assign) NSInteger oriSelectedIndex;

//: @property (nonatomic, strong) UIView *footView;
@property (nonatomic, strong) UIView *footView;

//: @end
@end

//: @implementation BBBTeamCardSelectedViewController
@implementation TeamOfViewController

//: + (instancetype)instanceWithTitle:(NSString *)title
+ (instancetype)occurrentOf:(NSString *)title
                            //: items:(NSMutableArray <id <NIMKitSelectCardData>> *)items
                            will:(NSMutableArray <id <StateLanguage>> *)items
                           //: result:(NIMSelectedCompletion)result {
                           portion:(NIMSelectedCompletion)result {
    //: BBBTeamCardSelectedViewController *vc = [[BBBTeamCardSelectedViewController alloc] initWithItems:items];
    TeamOfViewController *vc = [[TeamOfViewController alloc] initWithCrop:items];
    //: vc.titleString = title ?: @"";
    vc.titleString = title ?: @"";
    //: vc.resultHandle = result;
    vc.resultHandle = result;
    //: return vc;
    return vc;
}

//: - (instancetype)initWithItems:(NSMutableArray <id <NIMKitSelectCardData>> *)items {
- (instancetype)initWithCrop:(NSMutableArray <id <StateLanguage>> *)items {
    //: if (self = [super init]) {
    if (self = [super init]) {
        //: _datas = items;
        _datas = items;
        //: _selectedIndex = -1;
        _selectedIndex = -1;
        //: __weak typeof(self) weakSelf = self;
        __weak typeof(self) weakSelf = self;
        //: [items enumerateObjectsUsingBlock:^(id<NIMKitSelectCardData> _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [items enumerateObjectsUsingBlock:^(id<StateLanguage> _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //: if (obj.selected) {
            if (obj.selected) {
                //: weakSelf.selectedIndex = idx;
                weakSelf.selectedIndex = idx;
            }
        //: }];
        }];
        //: _oriSelectedIndex = _selectedIndex;
        _oriSelectedIndex = _selectedIndex;
    }
    //: return self;
    return self;
}

//: - (void)viewWillAppear:(BOOL)animated{
- (void)viewWillAppear:(BOOL)animated{
    //: [super viewWillAppear:animated];
    [super viewWillAppear:animated];
    //: [self.navigationController.navigationBar setHidden:YES];
    [self.navigationController.navigationBar setHidden:YES];
}

//: -(void)viewWillDisappear:(BOOL)animated{
-(void)viewWillDisappear:(BOOL)animated{
    //: [super viewWillDisappear:animated];
    [super viewWillDisappear:animated];
    //: [self.navigationController.navigationBar setHidden:NO];
    [self.navigationController.navigationBar setHidden:NO];

}

//: - (void)backAction{
- (void)withItem{
    //: [self.navigationController popViewControllerAnimated:NO];
    [self.navigationController popViewControllerAnimated:NO];
}

//: - (void)viewDidLoad {
- (void)viewDidLoad {
    //: [super viewDidLoad];
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg"]];
    //: UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    //: bg.image = [UIImage imageNamed:@"common_bg"];
    bg.image = [UIImage imageNamed:StringFromConstrainData(&str_qualifyData)];
    //: [self.view addSubview:bg];
    [self.view addSubview:bg];

    //: UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, (44.0f + [UIDevice vg_statusBarHeight]))];
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, (44.0f + [UIDevice task]))];
    //: [self.view addSubview:bgView];
    [self.view addSubview:bgView];

    //: UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //: backButton.frame = CGRectMake(5, [UIDevice vg_statusBarHeight]+4, 40, 40);
    backButton.frame = CGRectMake(5, [UIDevice task]+4, 40, 40);
    //: [backButton setImage:[UIImage imageNamed:@"back_arrow_bl"] forState:(UIControlStateNormal)];
    [backButton setImage:[UIImage imageNamed:StringFromConstrainData(&str_intervalText)] forState:(UIControlStateNormal)];
    //: [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [backButton addTarget:self action:@selector(withItem) forControlEvents:UIControlEventTouchUpInside];
    //: [bgView addSubview:backButton];
    [bgView addSubview:backButton];

    //: UILabel *labtitle = [[UILabel alloc] initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width-200)/2, [UIDevice vg_statusBarHeight]+4, 200, 40)];
    UILabel *labtitle = [[UILabel alloc] initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width-200)/2, [UIDevice task]+4, 200, 40)];
    //: labtitle.font = [UIFont systemFontOfSize:16.f];
    labtitle.font = [UIFont systemFontOfSize:16.f];
    //: labtitle.textColor = [UIColor blackColor];
    labtitle.textColor = [UIColor blackColor];
    //: labtitle.textAlignment = NSTextAlignmentCenter;
    labtitle.textAlignment = NSTextAlignmentCenter;
    //: labtitle.text = _titleString ?: @"";
    labtitle.text = _titleString ?: @"";
    //: [bgView addSubview:labtitle];
    [bgView addSubview:labtitle];
//
//    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    submitButton.frame = CGRectMake(SCREEN_WIDTH-15-40, SCREEN_STATUS_HEIGHT+4, 40, 40);
//    [submitButton setImage:[UIImage imageNamed:@"icon_checkbox_selected"] forState:(UIControlStateNormal)];
//
//    [submitButton addTarget:self action:@selector(onDone:) forControlEvents:UIControlEventTouchUpInside];
//    [bgView addSubview:submitButton];



//    self.navigationItem.title = _titleString ?: @"";
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:LangKey(@"contact_list_activity_complete")//@"完成".nim_localized
//                                                                              style:UIBarButtonItemStyleDone target:self action:@selector(onDone:)];
//    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    //: [self.view addSubview:self.tableView];
    [self.view addSubview:self.tableView];
    //: self.tableView.tableFooterView = self.footView;
    self.tableView.tableFooterView = self.footView;
}

//: - (void)viewDidLayoutSubviews {
- (void)viewDidLayoutSubviews {
    //: [super viewDidLayoutSubviews];
    [super viewDidLayoutSubviews];
//    _tableView.frame = self.view.bounds;
}

//: #pragma mark - Action
#pragma mark - Action
//: - (void)onDone{
- (void)addBy{
    //: if (_oriSelectedIndex != _selectedIndex) {
    if (_oriSelectedIndex != _selectedIndex) {
        //: id <NIMKitSelectCardData> bodyData = _datas[_selectedIndex];
        id <StateLanguage> bodyData = _datas[_selectedIndex];
        //: if (_resultHandle) {
        if (_resultHandle) {
            //: _resultHandle(bodyData);
            _resultHandle(bodyData);
        }
    }
    //: [self.navigationController popViewControllerAnimated:NO];
    [self.navigationController popViewControllerAnimated:NO];
}

//: #pragma mark - Delegate
#pragma mark - Delegate
//: - (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //: CGFloat cornerRadius = 8.f;
    CGFloat cornerRadius = 8.f;// 圆角弧度半径
    // 设置cell的背景色为透明，如果不设置这个的话，则原来的背景色不会被覆盖
    //: cell.backgroundColor = UIColor.clearColor;
    cell.backgroundColor = UIColor.clearColor;

    // 创建一个shapeLayer
    //: CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    //: CAShapeLayer *backgroundLayer = [[CAShapeLayer alloc] init]; 
    CAShapeLayer *backgroundLayer = [[CAShapeLayer alloc] init]; //显示选中
    // 创建一个可变的图像Path句柄，该路径用于保存绘图信息
    //: CGMutablePathRef pathRef = CGPathCreateMutable();
    CGMutablePathRef pathRef = CGPathCreateMutable();
    // 获取cell的size
    // 第一个参数,是整个 cell 的 bounds, 第二个参数是距左右两端的距离,第三个参数是距上下两端的距离
    //: CGRect bounds = CGRectInset(cell.bounds, 0, 0);
    CGRect bounds = CGRectInset(cell.bounds, 0, 0);

    // CGRectGetMinY：返回对象顶点坐标
    // CGRectGetMaxY：返回对象底点坐标
    // CGRectGetMinX：返回对象左边缘坐标
    // CGRectGetMaxX：返回对象右边缘坐标
    // CGRectGetMidX: 返回对象中心点的X坐标
    // CGRectGetMidY: 返回对象中心点的Y坐标

    //: NSInteger row = indexPath.row;
    NSInteger row = indexPath.row;
    //: NSInteger lastRow =[tableView numberOfRowsInSection:indexPath.section] - 1;
    NSInteger lastRow =[tableView numberOfRowsInSection:indexPath.section] - 1;

    //第一行
   //: if(row == 0)
   if(row == 0)
    {
        // 初始起点为cell的左下角坐标
        //: CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
        // 起始坐标为左下角，设为p，（CGRectGetMinX(bounds), CGRectGetMinY(bounds)）为左上角的点，设为p1(x1,y1)，(CGRectGetMidX(bounds), CGRectGetMinY(bounds))为顶部中点的点，设为p2(x2,y2)。然后连接p1和p2为一条直线l1，连接初始点p到p1成一条直线l，则在两条直线相交处绘制弧度为r的圆角。
        //: CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);

        //: CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
        // 终点坐标为右下角坐标点，把绘图信息都放到路径中去,根据这些路径就构成了一块区域了
        //: CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
    }
    //最后一行
    //: else if (row == lastRow)
    else if (row == lastRow)
    {
        // 初始起点为cell的左上角坐标
        //: CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
        //: CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), cornerRadius);
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), cornerRadius);
        //: CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
        // 添加一条直线，终点坐标为右下角坐标点并放到路径中去
        //: CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds));
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds));

        //: cell.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
        cell.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
        //: cell.layer.shadowOffset = CGSizeMake(0,3);
        cell.layer.shadowOffset = CGSizeMake(0,3);
        //: cell.layer.shadowOpacity = 1;
        cell.layer.shadowOpacity = 1;
        //: cell.layer.shadowRadius = 0;
        cell.layer.shadowRadius = 0;
    //: }else
    }else
    {
        //添加cell的rectangle信息到path中（不包括圆角）
        //: CGPathAddRect(pathRef, nil, bounds);
        CGPathAddRect(pathRef, nil, bounds);
    }

    // 把已经绘制好的可变图像路径赋值给图层，然后图层根据这图像path进行图像渲染render
    //: layer.path = pathRef;
    layer.path = pathRef;
    //: backgroundLayer.path = pathRef;
    backgroundLayer.path = pathRef;
    // 注意：但凡通过Quartz2D中带有creat/copy/retain方法创建出来的值都必须要释放
    //: CFRelease(pathRef);
    CFRelease(pathRef);
    // 按照shape layer的path填充颜色，类似于渲染render
    // layer.fillColor = [UIColor colorWithWhite:1.f alpha:0.8f].CGColor;
    //: layer.fillColor = [UIColor whiteColor].CGColor;
    layer.fillColor = [UIColor whiteColor].CGColor;
    // view大小与cell一致
    //: UIView *roundView = [[UIView alloc] initWithFrame:bounds];
    UIView *roundView = [[UIView alloc] initWithFrame:bounds];
    // 添加自定义圆角后的图层到roundView中
    //: [roundView.layer insertSublayer:layer atIndex:0];
    [roundView.layer insertSublayer:layer atIndex:0];
    //: roundView.backgroundColor = UIColor.clearColor;
    roundView.backgroundColor = UIColor.clearColor;
    // cell的背景view
    //: cell.backgroundView = roundView;
    cell.backgroundView = roundView;

}
//: - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //: return _datas.count;
    return _datas.count;
}

//: - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //: return 56.0f;
    return 56.0f;
}

//: - (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    //: return 2.2250738585072014e-308;
    return 2.2250738585072014e-308;
}

//: - (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    //: UIView *backView = [UIView new];
    UIView *backView = [UIView new];
    //: backView.backgroundColor = [UIColor clearColor];
    backView.backgroundColor = [UIColor clearColor];
    //: return backView;
    return backView;
}

//: - (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    //: return 2.2250738585072014e-308;
    return 2.2250738585072014e-308;
}

//: - (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    //: UIView *backView = [UIView new];
    UIView *backView = [UIView new];
    //: backView.backgroundColor = [UIColor clearColor];
    backView.backgroundColor = [UIColor clearColor];
    //: return backView;
    return backView;
}

//: - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //: id <NIMKitSelectCardData> bodyData = _datas[indexPath.row];
    id <StateLanguage> bodyData = _datas[indexPath.row];

//    SectionTapCellView *cell = [SectionTapCellView cellWithTableView:tableView];
    //: NSString *identifier = [NSString stringWithFormat:@"ZMONTeamCartSet%ld",(long)indexPath.row];
    NSString *identifier = [NSString stringWithFormat:StringFromConstrainData(&str_eagerCenterTanName),(long)indexPath.row];
    //: ZMONTeamCartSetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    SectionTapCellView *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    //: if (!cell)
    if (!cell)
    {
        //: cell = [[ZMONTeamCartSetTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell = [[SectionTapCellView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }

    //: cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.iconImageView.image = [UIImage imageNamed:bodyData.img];
    cell.titleLabel.text = bodyData.title;
    cell.arrowsImageView.hidden = ![bodyData selected];

//    static NSString *NIMTeamTableCellReuseId = @"cell";
//    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NIMTeamTableCellReuseId];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NIMTeamTableCellReuseId];
//        
//    }
////    UIImageView *imgselect = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-30-20-15, 15, 20, 20)];
////    imgselect.image = [UIImage imageNamed:@"icon_accessory_selected"];
////    [cell addSubview:imgselect];
////    imgselect.hidden = [bodyData selected];
//    
//    cell.imageView.image = [UIImage imageNamed:bodyData.img];
//    cell.accessoryType  = [bodyData selected]? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
//    cell.textLabel.text = bodyData.title;



    //: return cell;
    return cell;
}

//: - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //: [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    //: _selectedIndex = indexPath.row;
    _selectedIndex = indexPath.row;
    //: [_datas enumerateObjectsUsingBlock:^(id<NIMKitSelectCardData> _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    [_datas enumerateObjectsUsingBlock:^(id<StateLanguage> _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //: BOOL selected = (idx == indexPath.row);
        BOOL selected = (idx == indexPath.row);
        [obj setSelected:selected];
    //: }];
    }];
    //: [self.tableView reloadData];
    [self.tableView reloadData];

//    if (_oriSelectedIndex != _selectedIndex) {
//        id <StateLanguage> bodyData = _datas[_selectedIndex];
//        if (_resultHandle) {
//            _resultHandle(bodyData);
//        }
//    }
//    [self.navigationController popViewControllerAnimated:NO];
}

//: #pragma mark - Getter
#pragma mark - Getter
//: - (UITableView *)tableView {
- (UITableView *)tableView {
    //: if (!_tableView) {
    if (!_tableView) {
        //: _tableView = [[UITableView alloc] initWithFrame:CGRectMake(15, (44.0f + [UIDevice vg_statusBarHeight]), [[UIScreen mainScreen] bounds].size.width-30, [[UIScreen mainScreen] bounds].size.height-(44.0f + [UIDevice vg_statusBarHeight])) style:UITableViewStylePlain];
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(15, (44.0f + [UIDevice task]), [[UIScreen mainScreen] bounds].size.width-30, [[UIScreen mainScreen] bounds].size.height-(44.0f + [UIDevice task])) style:UITableViewStylePlain];
        //: _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        _tableView.scrollEnabled = NO;
//        _tableView.layer.cornerRadius = 12;
        //: _tableView.delegate = self;
        _tableView.delegate = self;
        //: _tableView.dataSource = self;
        _tableView.dataSource = self;
        //: _tableView.backgroundColor = [UIColor clearColor];
        _tableView.backgroundColor = [UIColor clearColor];
    }
    //: return _tableView;
    return _tableView;
}

//: - (UIView *)footView{
- (UIView *)footView{
    //: if(!_footView){
    if(!_footView){
        //: _footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width-30, 68)];
        _footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width-30, 68)];

        //: UIButton *btnClear = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *btnClear = [UIButton buttonWithType:UIButtonTypeCustom];
//        btnClear.backgroundColor = [UIColor whiteColor];
//        btnClear.layer.cornerRadius = 24;
        //: btnClear.frame = CGRectMake(0, 20, [[UIScreen mainScreen] bounds].size.width-30, 48);
        btnClear.frame = CGRectMake(0, 20, [[UIScreen mainScreen] bounds].size.width-30, 48);
        //: [btnClear setTitle:[NTESLanguageManager getTextWithKey:@"contact_list_activity_complete"] forState:UIControlStateNormal];
        [btnClear setTitle:[MaxInformation off:StringFromConstrainData(&str_textDateScanValue)] forState:UIControlStateNormal];
        //: [btnClear addTarget:self action:@selector(onDone) forControlEvents:UIControlEventTouchUpInside];
        [btnClear addTarget:self action:@selector(addBy) forControlEvents:UIControlEventTouchUpInside];
        //: [_footView addSubview:btnClear];
        [_footView addSubview:btnClear];
        //: btnClear.backgroundColor = [UIColor colorWithHexString:@"#2BBCFB"];
        btnClear.backgroundColor = [UIColor direction:StringFromConstrainData(&str_flueData)];
        //: btnClear.layer.cornerRadius = 10;
        btnClear.layer.cornerRadius = 10;
        //: btnClear.layer.shadowColor = [UIColor colorWithHexString:@"#009ADC"].CGColor;
        btnClear.layer.shadowColor = [UIColor direction:StringFromConstrainData(&str_encounterTitle)].CGColor;
        //: btnClear.layer.shadowOffset = CGSizeMake(0,3);
        btnClear.layer.shadowOffset = CGSizeMake(0,3);
        //: btnClear.layer.shadowOpacity = 1;
        btnClear.layer.shadowOpacity = 1;
        //: btnClear.layer.shadowRadius = 0;
        btnClear.layer.shadowRadius = 0;


    }
    //: return _footView;
    return _footView;
}

//: @end
@end

Byte *ConstrainDataToByte(ConstrainData *data) {
    if (data->leap) return data->chemicalOff;
    for (int i = 0; i < data->withSession; i++) {
        data->chemicalOff[i] ^= data->verdAntique;
    }
    data->chemicalOff[data->withSession] = 0;
    data->leap = true;
	if (data->withSession >= 2) {
		data->murderMember = data->chemicalOff[0];
		data->rubric = data->chemicalOff[1];
	}
    return data->chemicalOff;
}

NSString *StringFromConstrainData(ConstrainData *data) {
    return [NSString stringWithUTF8String:(char *)ConstrainDataToByte(data)];
}
