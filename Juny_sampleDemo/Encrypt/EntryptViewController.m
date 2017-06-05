//
//  EntryptViewController.m
//  Juny_sampleDemo
//
//  Created by JH on 2017/6/2.
//  Copyright © 2017年 Juny. All rights reserved.
//{\n\n}  O0pKPQ==

#import "EntryptViewController.h"

@interface EntryptViewController ()

@end

@implementation EntryptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    NSString *stringIn = @"{\n\n}";
//    NSString *stringOut = [self entryptString:stringIn];
//    NSLog(@"%@",stringOut);
    [self testSortDic];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 200, 414, 300)];
    label.textColor = [UIColor blackColor];
    label.numberOfLines = 0;
    label.text = @"布莱恩blan";
    [self.view addSubview:label];
    
    label.font = [UIFont systemFontOfSize:30];
    label.shadowColor = [UIColor redColor];
    label.shadowOffset = CGSizeMake(0, -1);
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)entryptString:(NSString *)string{
    NSString *outPut = @"";
    if (string)
    {
        NSUInteger size = string.length;
        int m ;
        char chars[size];
        NSMutableString *mutableString = [[NSMutableString alloc]init];
        for (int i=0; i<size; i++) {
            m =((int)[string substringWithRange:NSMakeRange(i, 1)])^64;
            char n = (char)m;
            chars[i] = n;
           
//            mutableString appendString:
        }
        NSString *string = [NSString stringWithCharacters:chars length:size];
        NSString *base64String = [[string dataUsingEncoding:NSUTF8StringEncoding ]base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        outPut = [base64String copy];
        
    }
    return outPut;
}
#pragma mark --------------------测试字典的升序排列和字符串拼接-------------------------
- (void)testSortDic{
    NSDictionary *params = @{
                             @"name":@"LinH",
                             @"hometown":@"Dongying",
                             @"userID":@"330909199301271234",
                             @"phone":@"18814868888"
                             };
  
   NSString *string =  [self getStringWithDic:params];
    NSLog(@"%@",string);
   
}
/**
 字典的升序排列以及字符串的拼接

 @param params 待排序的字典
 @return 拼接好的字符串
 */
- (NSString *)getStringWithDic:(NSMutableDictionary*)params{
    //排序key
    NSArray *keyArray = [params allKeys];//获取待排序的key
    NSArray *sortArray = [keyArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2 ];
    }];//获取排序后的key
    //排序后的以key=value拼接的数组
    NSMutableArray *valueArray = [NSMutableArray array];
    for(NSString *sortSring in sortArray){
        NSString *signSring = [NSString stringWithFormat:@"%@=%@",sortSring,[params objectForKey:sortSring]];
        [valueArray addObject:signSring];
    }
    
    // 就是用“,”把每个排序后拼接的数组，用字符串拼接起来
    NSString *string = [valueArray componentsJoinedByString:@"&"];
    return string;
}
@end
