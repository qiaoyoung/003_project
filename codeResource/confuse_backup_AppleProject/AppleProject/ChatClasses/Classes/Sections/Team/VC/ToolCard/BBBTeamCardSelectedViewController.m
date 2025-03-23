//
//  BBBTeamCardSelectedViewController.m
// AppleProjectKit
//
//  Created by Netease on 2019/7/16.
//  Copyright © 2019 NetEase. All rights reserved.
//

#import "BBBTeamCardSelectedViewController.h"
#import "CCCGlobalMacro.h"
#import "ZMONTeamCartSetTableViewCell.h"
@interface BBBTeamCardSelectedViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray <id <NIMKitSelectCardData>> *datas;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) NSInteger selectedIndex;

@property (nonatomic, assign) NSInteger oriSelectedIndex;

@property (nonatomic, strong) UIView *footView;

@end

@implementation BBBTeamCardSelectedViewController

+ (instancetype)instanceWithTitle:(NSString *)title
                            items:(NSMutableArray <id <NIMKitSelectCardData>> *)items
                           result:(NIMSelectedCompletion)result {
    BBBTeamCardSelectedViewController *vc = [[BBBTeamCardSelectedViewController alloc] initWithItems:items];
    vc.titleString = title ?: @"";
    vc.resultHandle = result;
    return vc;
}

- (instancetype)initWithItems:(NSMutableArray <id <NIMKitSelectCardData>> *)items {
    if (self = [super init]) {
        _datas = items;
        _selectedIndex = -1;
        __weak typeof(self) weakSelf = self;
        [items enumerateObjectsUsingBlock:^(id<NIMKitSelectCardData>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.selected) {
                weakSelf.selectedIndex = idx;
            }
        }];
        _oriSelectedIndex = _selectedIndex;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
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
    labtitle.text = _titleString ?: @"";
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
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = self.footView;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
//    _tableView.frame = self.view.bounds;
}

#pragma mark - Action
- (void)onDone{
    if (_oriSelectedIndex != _selectedIndex) {
        id <NIMKitSelectCardData> bodyData = _datas[_selectedIndex];
        if (_resultHandle) {
            _resultHandle(bodyData);
        }
    }
    [self.navigationController popViewControllerAnimated:NO];
}

#pragma mark - Delegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cornerRadius = 8.f;// 圆角弧度半径
    // 设置cell的背景色为透明，如果不设置这个的话，则原来的背景色不会被覆盖
    cell.backgroundColor = UIColor.clearColor;

    // 创建一个shapeLayer
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    CAShapeLayer *backgroundLayer = [[CAShapeLayer alloc] init]; //显示选中
    // 创建一个可变的图像Path句柄，该路径用于保存绘图信息
    CGMutablePathRef pathRef = CGPathCreateMutable();
    // 获取cell的size
    // 第一个参数,是整个 cell 的 bounds, 第二个参数是距左右两端的距离,第三个参数是距上下两端的距离
    CGRect bounds = CGRectInset(cell.bounds, 0, 0);

    // CGRectGetMinY：返回对象顶点坐标
    // CGRectGetMaxY：返回对象底点坐标
    // CGRectGetMinX：返回对象左边缘坐标
    // CGRectGetMaxX：返回对象右边缘坐标
    // CGRectGetMidX: 返回对象中心点的X坐标
    // CGRectGetMidY: 返回对象中心点的Y坐标

    NSInteger row = indexPath.row;
    NSInteger lastRow =[tableView numberOfRowsInSection:indexPath.section] - 1;

    //第一行
   if(row == 0)
    {
        // 初始起点为cell的左下角坐标
        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
        // 起始坐标为左下角，设为p，（CGRectGetMinX(bounds), CGRectGetMinY(bounds)）为左上角的点，设为p1(x1,y1)，(CGRectGetMidX(bounds), CGRectGetMinY(bounds))为顶部中点的点，设为p2(x2,y2)。然后连接p1和p2为一条直线l1，连接初始点p到p1成一条直线l，则在两条直线相交处绘制弧度为r的圆角。
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);

        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
        // 终点坐标为右下角坐标点，把绘图信息都放到路径中去,根据这些路径就构成了一块区域了
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
    }
    //最后一行
    else if (row == lastRow)
    {
        // 初始起点为cell的左上角坐标
        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), cornerRadius);
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
        // 添加一条直线，终点坐标为右下角坐标点并放到路径中去
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds));
        
        cell.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
        cell.layer.shadowOffset = CGSizeMake(0,3);
        cell.layer.shadowOpacity = 1;
        cell.layer.shadowRadius = 0;
    }else
    {
        //添加cell的rectangle信息到path中（不包括圆角）
        CGPathAddRect(pathRef, nil, bounds);
    }

    // 把已经绘制好的可变图像路径赋值给图层，然后图层根据这图像path进行图像渲染render
    layer.path = pathRef;
    backgroundLayer.path = pathRef;
    // 注意：但凡通过Quartz2D中带有creat/copy/retain方法创建出来的值都必须要释放
    CFRelease(pathRef);
    // 按照shape layer的path填充颜色，类似于渲染render
    // layer.fillColor = [UIColor colorWithWhite:1.f alpha:0.8f].CGColor;
    layer.fillColor = [UIColor whiteColor].CGColor;
    // view大小与cell一致
    UIView *roundView = [[UIView alloc] initWithFrame:bounds];
    // 添加自定义圆角后的图层到roundView中
    [roundView.layer insertSublayer:layer atIndex:0];
    roundView.backgroundColor = UIColor.clearColor;
    // cell的背景view
    cell.backgroundView = roundView;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datas.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 56.0f;
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    id <NIMKitSelectCardData> bodyData = _datas[indexPath.row];
    
//    ZMONTeamCartSetTableViewCell *cell = [ZMONTeamCartSetTableViewCell cellWithTableView:tableView];
    NSString *identifier = [NSString stringWithFormat:@"ZMONTeamCartSet%ld",(long)indexPath.row];
    ZMONTeamCartSetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell = [[ZMONTeamCartSetTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
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
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    _selectedIndex = indexPath.row;
    [_datas enumerateObjectsUsingBlock:^(id<NIMKitSelectCardData>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        BOOL selected = (idx == indexPath.row);
        [obj setSelected:selected];
    }];
    [self.tableView reloadData];
    
//    if (_oriSelectedIndex != _selectedIndex) {
//        id <NIMKitSelectCardData> bodyData = _datas[_selectedIndex];
//        if (_resultHandle) {
//            _resultHandle(bodyData);
//        }
//    }
//    [self.navigationController popViewControllerAnimated:NO];
}

#pragma mark - Getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(15, SCREEN_TOP_HEIGHT, SCREEN_WIDTH-30, SCREEN_HEIGHT-SCREEN_TOP_HEIGHT) style:UITableViewStylePlain];
        _tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
//        _tableView.scrollEnabled = NO;
//        _tableView.layer.cornerRadius = 12;
        _tableView.delegate   = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
    }
    return _tableView;
}

- (UIView *)footView{
    if(!_footView){
        _footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-30, 68)];
                
        UIButton *btnClear = [UIButton buttonWithType:UIButtonTypeCustom];
//        btnClear.backgroundColor = [UIColor whiteColor];
//        btnClear.layer.cornerRadius = 24;
        btnClear.frame = CGRectMake(0, 20, SCREEN_WIDTH-30, 48);
        [btnClear setTitle:LangKey(@"contact_list_activity_complete") forState:UIControlStateNormal];
        [btnClear addTarget:self action:@selector(onDone) forControlEvents:UIControlEventTouchUpInside];
        [_footView addSubview:btnClear];
        btnClear.backgroundColor = ThemeColor;
        btnClear.layer.cornerRadius = 10;
        btnClear.layer.shadowColor = DeepBtnColor.CGColor;
        btnClear.layer.shadowOffset = CGSizeMake(0,3);
        btnClear.layer.shadowOpacity = 1;
        btnClear.layer.shadowRadius = 0;
        

    }
    return _footView;
}

@end
