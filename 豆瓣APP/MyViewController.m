//
//  MyViewController.m
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/6/28.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import "MyViewController.h"
#import "ActivityViewController.h"
#import "MovieViewController.h"


#import "LoginViewController.h"

#import "MyHeaderTableViewCell.h"

#import "MyTableViewCell.h"


@interface MyViewController ()<UITableViewDataSource,UITabBarDelegate>


@property(nonatomic,strong)NSArray *titleArray;

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation MyViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    
    
    self.titleArray = @[@"我的活动",@"我的电影",@"清除缓存"];
    
    [self.myTableView registerNib:[UINib nibWithNibName:@"MyHeaderTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:MyHeaderTableViewCell_Identify];
    
     [self.myTableView registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:MyTableViewCell_Identify];
    

    
    [self addRightNavigationItem];
    
}





//登录按钮
- (void)addRightNavigationItem{
    
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn setTitle:@"登录" forState:(UIControlStateNormal)];
    btn.frame = CGRectMake(0, 0, 40, 30);
    [btn setTitleColor:[UIColor colorWithRed:0.33 green:0.21 blue:0.15 alpha:1.00] forState:UIControlStateNormal];
    // 选中时字体颜色
    [btn setTitleColor:[UIColor colorWithRed:1.00 green:0.44 blue:0.81 alpha:1.00] forState:(UIControlStateHighlighted)];
    
    [btn addTarget:self action:@selector(rightBarItemClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
}

-(void)rightBarItemClicked:(UIButton *)btn{
    
    NSLog(@"rightBarItemClicked");
    //跳转到登录界面
    UIStoryboard *mainSb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    LoginViewController *loginVC = [mainSb instantiateViewControllerWithIdentifier:@"LoginViewController"];
    //模态样式
    loginVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;

    
    [self presentViewController:loginVC animated:YES completion:^{
        
        
        
    }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        
        return 139;
    }
    return 40;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.row == 0) {
        
        MyHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyHeaderTableViewCell_Identify];
   
        
        
        
        return cell;
        
    }else{
        
        MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyTableViewCell_Identify];
        //添加标题 -1上面透视图
        cell.contentLabel.text = self.titleArray[indexPath.row - 1];
        
        if (indexPath.row == 3) {
            
            cell.subContentLabel.text = [NSString stringWithFormat:@"%.1fM",[self getFilePath]];
            
        }
        
 
        
        return cell;
        
    }
    
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
  if(indexPath.row==3){
        
        [self removeCache];
        [tableView reloadData];

    }
}

#pragma mark --- 清除缓存
-(void)removeCache{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    
    NSString *path = [paths lastObject];
    
    
    NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:path];
    
    for (NSString *p in files) {
        
        NSError *error;
        
        NSString *Path = [path stringByAppendingPathComponent:p];
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:Path]) {
            
            [[NSFileManager defaultManager] removeItemAtPath:Path error:&error];
            
        }
        
    }
    
}





-(float)getFilePath{
    
    //文件管理
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //缓存路径
    
    NSArray *cachePaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES);
    
    NSString *cacheDir = [cachePaths objectAtIndex:0];
    
    NSArray *cacheFileList;
    
    NSEnumerator *cacheEnumerator;
    
    NSString *cacheFilePath;
    
    unsigned long long cacheFolderSize = 0;
    
    cacheFileList = [fileManager subpathsOfDirectoryAtPath:cacheDir error:nil];
    
    cacheEnumerator = [cacheFileList objectEnumerator];
    
    while (cacheFilePath = [cacheEnumerator nextObject]) {
        
        NSDictionary *cacheFileAttributes = [fileManager attributesOfItemAtPath:[cacheDir stringByAppendingPathComponent:cacheFilePath] error:nil];
        
        cacheFolderSize += [cacheFileAttributes fileSize];
        
    }
    
    //单位MB
    
    return cacheFolderSize/1024;
    
}


@end
