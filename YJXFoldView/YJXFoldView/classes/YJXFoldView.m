//
//  YJXFoldView.m
//  YJXFoldView
//
//  Created by 尤建峡 on 2019/3/1.
//  Copyright © 2019 尤建峡. All rights reserved.
//

#import "YJXFoldView.h"

@interface YJXFoldView ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UIButton *foldButton;
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<YJXTableViewModel *> *dataArr;
@property (nonatomic, assign) BOOL isFolded;
@property (nonatomic, assign) CGRect originRect;

@end

static NSString * const ID = @"UITableViewCell";

@implementation YJXFoldView

#pragma mark - getter&&setter

- (NSMutableArray<YJXTableViewModel *> *)dataArr {
    if(!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (UIButton *)foldButton {
    if(!_foldButton) {
        UIButton *foldButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _foldButton = foldButton;
        _foldButton.backgroundColor = UIColor.redColor;
        [_foldButton addTarget:self action:@selector(foldButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_foldButton];
    }
    return _foldButton;
}

- (UITableView *)tableView {
    if(!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView = tableView;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self addSubview:_tableView];
    }
    return _tableView;
}

#pragma mark - 生命周期

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame] ) {
        _itemHeight = 44.0f;
        _contentHeight = 200.0f;
        _isFolded = YES;
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if(_isFolded) {
        _originRect = self.bounds;
        self.foldButton.frame = self.bounds;
        self.tableView.frame = CGRectZero;
    } else {
        self.tableView.frame = CGRectMake(CGRectGetMinX(self.foldButton.frame), _itemHeight, self.foldButton.frame.size.width, 200.0f);
        self.foldButton.frame = _originRect;
    }
    NSLog(@"%@",NSStringFromCGRect(self.tableView.frame));
    NSLog(@"%@",NSStringFromCGSize(self.tableView.contentSize));
}

#pragma mark - 监听折叠按钮的点击

- (void)foldButtonClick {
    _isFolded = !_isFolded;
    if(_isFolded) { /** 折叠起来的 */
        [self close];
    } else {
        [self open];
    }
}

- (void)close {
    CGRect frame = self.frame;
    frame.size.height -= self.contentHeight;
    self.frame = frame;
}

- (void)open {
    CGRect frame = self.frame;
    frame.size.height += self.contentHeight;
    self.frame = frame;
}

#pragma mark - 设置下拉列表的标题和图片数据

- (void)configurationWithTitles:(NSArray *)titles images:(NSArray *)images {
    for (NSInteger i = 0; i < titles.count; i ++) {
        YJXTableViewModel *model = [[YJXTableViewModel alloc] init];
        model.title = titles[i];
        model.image = images[i];
        [self.dataArr addObject:model];
        [self.tableView reloadData];
    }
}

#pragma mark - UITableViewDataSource&&UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    YJXTableViewModel *model = _dataArr[indexPath.row];
    cell.textLabel.text = model.title;
    cell.imageView.image = model.image;
    return cell;
}

@end

@implementation YJXTableViewModel


@end
