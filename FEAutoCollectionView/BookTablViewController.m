//
//  BookTablViewController.m
//  FEAutoCollectionView
//
//  Created by FlyElephant on 16/5/3.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

#import "BookTablViewController.h"
#import "BookTableViewCell.h"

static  NSString * const CellIdentifier=@"UITableViewCellIdentifier";

@interface  BookTablViewController()

@property (strong,nonatomic) NSMutableArray *data;

@end

@implementation BookTablViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self setup];
}


#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.data count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BookTableViewCell *cell=[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
<<<<<<< HEAD
=======
    if (cell==nil) {
        cell=[[BookTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
>>>>>>> master
    [cell setupModel:self.data[indexPath.row]];
//    cell.accessoryType=UITableViewCellAccessoryNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

<<<<<<< HEAD
//-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
//    return YES;
//}
//
//-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
//    return YES;
//}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}

//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//{
////    return UITableViewCellEditingStyleInsert;
//    return UITableViewCellEditingStyleDelete;
//}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.data removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }else if (editingStyle==UITableViewCellEditingStyleInsert){
        NSInteger insertRow=indexPath.row+1;
        BookModel *model=[BookModel new];
        model.imgName=@"Book";
        model.bookName=@"UITableViewCell";
        model.bookDescription=[NSString stringWithFormat:@"插入成功:%ld",insertRow];
        [self.data insertObject:model atIndex:insertRow];
        [tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:insertRow inSection:indexPath.section]] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}
=======
>>>>>>> master

#pragma mark - setup

-(void)setup{
<<<<<<< HEAD
    //    [self.tableView setEditing:YES animated:YES];
    self.tableView.estimatedRowHeight=120.0f;
    self.tableView.rowHeight=UITableViewAutomaticDimension;
    self.data=[NSMutableArray array];
    [self.tableView registerClass:[BookTableViewCell class] forCellReuseIdentifier:CellIdentifier];

    for (NSInteger i=0; i<30; i++) {
        BookModel *model=[BookModel new];
        model.imgName=@"Book";
        model.bookName=@"UITableViewCell";
        NSInteger mode=i%3;
        if (mode==0) {
            model.bookDescription=@"魏则西，男，二十一岁，生前就读于西安电子科技大学，计算机专业学生，因身患滑膜肉瘤去世。魏则西曾经的梦想是每天玩命学习，每天取得巨大的进步，大四之后去美国好好学学计算机，那会是他人生最大的幸福。";
        }else if (mode==1){
            model.bookDescription=@"滑膜肉瘤是一种恶性肿瘤，目前尚无有效治疗手段。魏则西是家中独子，父母倾尽全力为他治病。辗转北京、上海、天津、广州各大肿瘤医院，得到的都是坏消息。魏则西在百度搜索疾病信息，第一条结果是某武警医院(武警北京总队第二医院)的所谓「生物免疫疗法」。魏则西一家人在北京见到了这家武警医院的李姓主任，李主任言：这个技术不是他们的，是斯坦福研发出来的，他们是合作，有效率达到百分之八九十。看着魏则西的各种报告单，李主任对魏则西父母说：保二十年没问题。正所谓典型的套路:「病很重，能治好，得花钱」。";
        }else if(mode==2){
=======

    self.tableView.estimatedRowHeight=120.0f;
    self.tableView.rowHeight=UITableViewAutomaticDimension;
    self.data=[NSMutableArray array];
    
    for (NSInteger i=0; i<3; i++) {
        BookModel *model=[BookModel new];
        model.imgName=@"Book";
        model.bookName=@"UITableViewCell";
        if (i==0) {
            model.bookDescription=@"魏则西，男，二十一岁，生前就读于西安电子科技大学，计算机专业学生，因身患滑膜肉瘤去世。魏则西曾经的梦想是每天玩命学习，每天取得巨大的进步，大四之后去美国好好学学计算机，那会是他人生最大的幸福。";
        }else if (i==1){
            model.bookDescription=@"滑膜肉瘤是一种恶性肿瘤，目前尚无有效治疗手段。魏则西是家中独子，父母倾尽全力为他治病。辗转北京、上海、天津、广州各大肿瘤医院，得到的都是坏消息。魏则西在百度搜索疾病信息，第一条结果是某武警医院(武警北京总队第二医院)的所谓「生物免疫疗法」。魏则西一家人在北京见到了这家武警医院的李姓主任，李主任言：这个技术不是他们的，是斯坦福研发出来的，他们是合作，有效率达到百分之八九十。看着魏则西的各种报告单，李主任对魏则西父母说：保二十年没问题。正所谓典型的套路:「病很重，能治好，得花钱」。";
        }else if(i==2){
>>>>>>> master
            model.bookDescription=@"魏则西一家人求医心切，但也会有所顾虑，这不会是骗人的吧？不过一看这的确是一家三甲医院，魏则西还专门查了一下这个医生，这个李主任还上过中央电视台，不止一次，中央电视台十套节目。会是假的吗？你看，百度、三甲医院、中央台，还是斯坦福的技术，这些应该没有问题了吧。";
        }
        [self.data addObject:model];
    }
}

@end
