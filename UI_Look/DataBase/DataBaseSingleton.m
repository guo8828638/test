//
//  DataBaseSingleton.m
//  UI_Look
//
//  Created by dllo on 15/11/23.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "DataBaseSingleton.h"
#import "TalkModel.h"

@implementation DataBaseSingleton
- (void)dealloc
{
    [_db release];
    [_scArray release];
    [BrandModel release];
    [super dealloc];
}
+(instancetype)shareDataBase
{

    static DataBaseSingleton *dataBase = nil;
    if (dataBase == nil) {
        
        dataBase = [[DataBaseSingleton alloc]init];
        [dataBase openDB];
        [dataBase createSCtable];
        [dataBase createBrandTable];
        [dataBase createLanuchFurtherUserTable];
    }
    
    return dataBase;


}
-(void)openDB
{


    //获取数据库文件的沙盒路径
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    
    NSString *fileName = [doc stringByAppendingPathComponent:@"Watch.sqlite"];
        
    self.db = [FMDatabase databaseWithPath:fileName];
    
    [self.db open];

}
-(void)createBrandTable
{

    if ([self.db open]) {
        
        NSLog(@"ok");
        
        
//        创建表
        
        BOOL result = [self.db executeUpdate:@"CREATE TABLE IF NOT EXISTS brand(id INTEGER PRIMARY KEY AUTOINCREMENT,cover_landscape TEXT NOT NULL,title TEXT NOT NULL,summary TEXT NOT NULL,pubdate TEXT NOT NULL,type TEXT NOT NULL,author TEXT NOT NULL,link_share TEXT NOT NULL)"];
        
        if (result) {
            NSLog(@"创表成功");
        }else{
            NSLog(@"创表失败");
        }

        
    }else
    {
    
        NSLog(@"打开失败");
    }
    

}
//插入数据

-(void)insertCover_landscape:(NSString *)cover_landscape Title:(NSString *)title Summary:(NSString *)summary Pubdate:(NSString *)pubdate Type:(NSString *)type Author:(NSString *)author Link_share:(NSString *)link_share
{

        NSString *sql = [NSString stringWithFormat:@"INSERT INTO brand (cover_landscape, title,summary,pubdate,type,author,link_share) VALUES ('%@', '%@','%@','%@','%@','%@','%@')",cover_landscape,title,summary,pubdate,type,author,link_share];
    
    BOOL result = [self.db executeUpdate:sql];
    if (result) {
        
        NSLog(@"插入成功");
        
    }else
    {
        NSLog(@"插入成功");
        
    }


}
//查询数据
-(NSMutableArray *)selectData
{

    
    //1.执行查询语句
    FMResultSet *resultSet = [self.db executeQuery:@"select * from brand"];
    self.array = [NSMutableArray array];

    while ([resultSet next]) {
        
        int idNum = [resultSet intForColumn:@"id"];
        
        NSString *cover_landscape = [resultSet objectForColumnName:@"cover_landscape"];
        
        NSString *title = [resultSet objectForColumnName:@"title"];
        
        NSString *summary = [resultSet objectForColumnName:@"summary"];
        
        NSString *pubdate = [resultSet objectForColumnName:@"pubdate"];
        
        NSString *type = [resultSet objectForColumnName:@"type"];
        
        NSString *author = [resultSet objectForColumnName:@"author"];
        
        NSString *link_share = [resultSet objectForColumnName:@"link_share"];
        
        BrandModel *model = [[BrandModel alloc]init];
        
        model.cover_landscape = cover_landscape;
        
        model.title = title;
        
        model.summary = summary;
        
        model.pubdate = pubdate;
        
        model.type = type;
        
        model.author = author;
        
        model.link_share = link_share;
        
        [self.array addObject:model];
        
    }

    return self.array;



}
-(void)dropTableAndRecreate
{

    [self.db executeUpdate:@"DROP TABLE IF EXISTS brand"];
    
    //4.创表
     BOOL result = [self.db executeUpdate:@"CREATE TABLE IF NOT EXISTS brand(id INTEGER PRIMARY KEY AUTOINCREMENT,cover_landscape TEXT NOT NULL,title TEXT NOT NULL,summary TEXT NOT NULL,pubdate TEXT NOT NULL,type TEXT NOT NULL,author TEXT NOT NULL,link_share TEXT NOT NULL)"];
    
    
    if (result) {
        NSLog(@"再次创表成功");
    }else{
        NSLog(@"再次创表失败");
    }
    

}

//多用户
//创建用户
-(void)createLanuchFurtherUserTable
{
    
    //    3.打开数据库
    
    if ([self.db open]) {
        
        NSLog(@"ok");
        
        
        //     4.创表
        
        BOOL result = [self.db executeUpdate:@"CREATE TABLE IF NOT EXISTS FurtherUser (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, password TEXT NOT NULL)"];
        
        if (result) {
            NSLog(@"创表成功");
        }else{
            NSLog(@"创表失败");
        }
        
    }
    
    
    
    
}

-(void)insertLanuchName:(NSString *)name Password:(NSString *)password{
    
    // 如果用的是stringWithFormat时，sql语句可以用‘%@’
    
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO FurtherUser (name, password) VALUES ('%@','%@')",name,password];
    
    BOOL result = [self.db executeUpdate:sql];
    if (result) {
        
        NSLog(@"插入成功");
        
    }else
    {
        NSLog(@"插入成功");
        
    }
    
    
}

-(NSMutableDictionary *)selectLanuchData
{
    
    
    
    //1.执行查询语句
    FMResultSet *resultSet = [self.db executeQuery:@"select * from FurtherUser"];
    
    self.Lanuchdic = [NSMutableDictionary dictionary];
    
    //2.遍历结果集合
    while ([resultSet next]) {
        
        int idNum = [resultSet intForColumn:@"id"];
        NSString *name = [resultSet objectForColumnName:@"name"];
        NSString *password = [resultSet objectForColumnName:@"password"];
        NSLog(@"id=%i ,name=%@, password=%@",idNum,name,password);
        
        [self.Lanuchdic setValue:password forKey:name];
        
        
    }
    
    
    return self.Lanuchdic;
    
    
}


-(void)dropLanuchTableAndRecreate
{
    
    
    [self.db executeUpdate:@"DROP TABLE IF EXISTS FurtherUser"];
    
    //4.创表
    BOOL result=[self.db executeUpdate:@"CREATE TABLE IF NOT EXISTS FurtherUser (id integer PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, password TEXT NOT NULL)"];
    
    if (result) {
        NSLog(@"再次创表成功");
    }else{
        NSLog(@"再次创表失败");
    }
    
    
}




//收藏

-(void)createSCtable
{

    if ([self.db open]) {
        
        NSLog(@"ok");


    
        BOOL result = [self.db executeUpdate:@"CREATE TABLE IF NOT EXISTS SCtable (id integer PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL,cover_thumb TEXT NOT NULL,summary TEXT NOT NULL,link_share TEXT NOT NULL)"];
        
        
        if (result) {
            NSLog(@"创表成功");
        }
        else{
            NSLog(@"创表失败");
        }

    }
    else
    {
    
    
        NSLog(@"数据库没有打开");
    
    }


}

-(void)insertTalkModel:(TalkModel *)talkModel
{


    NSString *sql = [NSString stringWithFormat:@"INSERT INTO SCtable (title,cover_thumb,summary,link_share) VALUES ('%@','%@','%@','%@')",talkModel.title,talkModel.cover_thumb,talkModel.summary,talkModel.link_share];
    
    BOOL result = [self.db executeUpdate:sql];
    if (result) {
        
        NSLog(@"插入成功");
        
    }else
    {
        NSLog(@"插入成功");
        
    }



}


-(NSMutableArray *)selectSC
{
    
    
    //1.执行查询语句
     NSString *sql = [NSString stringWithFormat:@"select * from SCtable"];
    
    FMResultSet *resultSet = [self.db executeQuery:sql];
    
    self.SCarray = [NSMutableArray array];
    
    //2.遍历结果集合
    while ([resultSet next]) {
        
        int idNum = [resultSet intForColumn:@"id"];
        
        NSString *title = [resultSet objectForColumnName:@"title"];
        
        NSString *cover_thumb = [resultSet objectForColumnName:@"cover_thumb"];
        
        NSString *summary = [resultSet objectForColumnName:@"summary"];
        
        NSString *link_share = [resultSet objectForColumnName:@"link_share"];
        
        TalkModel *model = [[TalkModel alloc]init];
        
        model.title = title;
        
        model.cover_thumb = cover_thumb;
        
        model.summary = summary;
        
        model.link_share = link_share;
        
        [self.SCarray addObject:model];
        
        
    }
    
    
    return self.SCarray;
    
    
}


-(void)deleteTalkmodel:(TalkModel *)talkModel{
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM SCtable WHERE title = '%@' AND cover_thumb = '%@'AND summary = '%@' AND link_share = '%@'",talkModel.title,talkModel.cover_thumb,talkModel.summary,talkModel.link_share];
    BOOL result = [self.db executeUpdate:sql];
    if (result) {
        NSLog(@"删除成功");
    }
    else{
        NSLog(@"删除失败");
    }
}
-(void)dropSCtable
{
    
    [self.db executeUpdate:@"DROP TABLE IF EXISTS SCtable"];
    //     4.创表
    
    BOOL result = [self.db executeUpdate:@"title TEXT NOT NULL,cover_thumb TEXT NOT NULL,summary TEXT NOT NULL,link_share TEXT NOT NULL);"];
    
    if (result) {
        NSLog(@"创表成功");
    }else{
        NSLog(@"创表失败");
    }
    
    
}

#if 0

-(void)insertData
{
    
    
    [self insertData:0 useTransaction:NO];
    NSDate *date1 = [NSDate date];
    [self insertData:500 useTransaction:NO];
    NSDate *date2 = [NSDate date];
    NSTimeInterval a = [date2 timeIntervalSince1970] - [date1 timeIntervalSince1970];
    NSLog(@"不使用事务插入500条数据用时%.3f秒",a);
    [self insertData:1000 useTransaction:YES];
    NSDate *date3 = [NSDate date];
    NSTimeInterval b = [date3 timeIntervalSince1970] - [date2 timeIntervalSince1970];
    NSLog(@"使用事务插入500条数据用时%.3f秒",b);
    


}

- (void)insertData:(int)fromIndex useTransaction:(BOOL)useTransaction
{
    if (useTransaction) {
        [self.db beginTransaction];
        BOOL isRollBack = NO;
        @try {
            for (int i = fromIndex; i<500+fromIndex; i++) {
                NSString *nId = [NSString stringWithFormat:@"%d",i];
                NSString *strName = [[NSString alloc] initWithFormat:@"student_%d",i];
                //                NSString *sqls = @"INSERT INTO Student (id,title) VALUES (?,?)";
                //                BOOL a = [self.db executeUpdate:sqls,nId,strName];
                //                if (!a) {
                //                    NSLog(@"插入失败1");
                //                }
                NSString *sql = [NSString stringWithFormat:@"INSERT INTO student (title, detail) VALUES ('%@', '%@')",nId,strName];
                
                BOOL result = [self.db executeUpdate:sql];
                
                if (result) {
                    
                    NSLog(@"插入成功");
                    
                }else
                {
                    NSLog(@"插入成功");
                    
                }
                
            }
        }
        @catch (NSException *exception) {
            isRollBack = YES;
            [self.db rollback];
        }
        @finally {
            if (!isRollBack) {
                [self.db commit];
            }
        }
    }else{
        for (int i = fromIndex; i<500+fromIndex; i++) {
            NSString *nId = [NSString stringWithFormat:@"%d",i];
            NSString *strName = [[NSString alloc] initWithFormat:@"student_%d",i];
            NSString *sql = [NSString stringWithFormat:@"INSERT INTO student (title, detail) VALUES ('%@', '%@')",nId,strName];
            BOOL a = [self.db executeUpdate:sql,nId,strName];
            if (!a) {
                NSLog(@"插入失败2");
            }
            else
            {
                NSLog(@"插入成功2");
            }
        }
    }
}


#endif


@end
