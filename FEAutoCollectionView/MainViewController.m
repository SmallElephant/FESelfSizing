//
//  ViewController.m
//  FEAutoCollectionView
//
//  Created by FlyElephant on 16/4/29.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

#import "MainViewController.h"
#import <objc/runtime.h>
#import "BookTablViewController.h"
#import "BookCollectionViewController.h"

static NSString * const CellIdentifier=@"CellIdentifier";
@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong,nonatomic) NSMutableArray *data;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setup];
    unsigned int count=0;
    Ivar *ivars = class_copyIvarList([UIAlertAction class], &count);
    for (int i = 0; i<count; i++) {
        Ivar ivar = ivars[i];
        NSLog(@"%s------%s", ivar_getName(ivar),ivar_getTypeEncoding(ivar));
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.data count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text=self.data[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row==0) {
        BookTablViewController *controller=[self.storyboard instantiateViewControllerWithIdentifier:@"BookTablViewController"];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row==1){
        BookCollectionViewController *controller=[self.storyboard instantiateViewControllerWithIdentifier:@"BookCollectionViewController"];
        [self.navigationController pushViewController:controller animated:YES];
    }else if(indexPath.row==2){
            NSString *title=NSLocalizedString(@"Objective-C", nil);
            NSString *tipContent=NSLocalizedString(@"FlyElephant", nil);
            UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:tipContent preferredStyle:UIAlertControllerStyleAlert];
            UIColor *color=[UIColor redColor];
            UIAlertAction *sureAction=[UIAlertAction actionWithTitle:NSLocalizedString(@"确定", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            }];
            [sureAction setValue:color forKey:@"titleTextColor"];
            UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:NSLocalizedString(@"取消", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
            }];
            [cancelAction setValue:color forKey:@"titleTextColor"];
            [alertController addAction:sureAction];
            [alertController addAction:cancelAction];
            [self presentViewController:alertController animated:YES completion:nil];
    }
}



-(void)setup{

    self.automaticallyAdjustsScrollViewInsets=NO;
    self.data=[[NSMutableArray alloc]init];
    [self.data addObject:@"UITableView"];
    [self.data addObject:@"UICollectionView"];
    [self.data addObject:@"UIAlertController设置字体颜色"];
}

@end
