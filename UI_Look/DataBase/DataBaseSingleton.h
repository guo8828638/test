//
//  DataBaseSingleton.h
//  UI_Look
//
//  Created by dllo on 15/11/23.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "BrandModel.h"
#import "TalkModel.h"


@interface DataBaseSingleton : NSObject
+(instancetype)shareDataBase;
@property (nonatomic,retain)FMDatabase *db;
@property (nonatomic,retain)BrandModel *brandModel;
@property (nonatomic,retain)NSMutableArray *scArray;


//缓存
-(void)openDB;
-(void)createBrandTable;
-(void)insertCover_landscape:(NSString *)cover_landscape Title:(NSString *)title Summary:(NSString *)summary Pubdate:(NSString *)pubdate Type:(NSString *)type Author:(NSString *)author Link_share:(NSString *)link_share;
-(NSMutableArray *)selectData;
-(void)dropTableAndRecreate;
@property (nonatomic,retain)NSMutableArray *array;



//多用户
-(void)createLanuchFurtherUserTable;
-(void)insertLanuchName:(NSString *)name Password:(NSString *)password;
-(NSMutableDictionary *)selectLanuchData;
-(void)dropLanuchTableAndRecreate;
@property (nonatomic,retain)NSMutableDictionary *Lanuchdic;


//收藏
@property (nonatomic,retain)NSMutableArray *SCarray;
-(void)createSCtable;
-(void)insertTalkModel:(TalkModel *)talkModel;
-(NSMutableArray *)selectSC;
-(void)deleteTalkmodel:(TalkModel *)talkModel;
-(void)dropSCtable;




@end
