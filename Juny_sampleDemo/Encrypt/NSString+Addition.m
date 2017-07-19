
//  NSString+Addition.m
//  SWGJ
//
//  Created by mingxum on 14-6-23.
//  Copyright (c) 2014年 mingxum. All rights reserved.
//

#import "NSString+Addition.h"
#import "GTMBase64.h"
//#import "NSData+Addition.h"
//#import "NSString+Addition.h"
@implementation NSString (Addition)
+(BOOL)isEmpty:(NSString *) string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    if ([string isEqualToString:@"null"]) {
        return YES;
    }
    if ([string isEqualToString:@"(null)"]) {
        return YES;
    }
    if ([string isEqualToString:@""]) {
        return YES;
    }
    return NO;
}
+(BOOL)isFitHenanRegexWithString:(NSString *)sender
{
    NSString * regex = @"^(1)\\d{10}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:sender];
    return isMatch;
}
+(BOOL) APCheckIfAppInstalled2:(NSString *)urlSchemes
{
    return   [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlSchemes]];
}
+(NSString *)getExpendCodeFromIPhoneNumber:(NSString *)Anumber
{
//    NSMutableArray *LevelArr = [[NSMutableArray alloc]initWithObjects:@"0", @"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"j",@"k",@"l",@"m",@"n",@"p",@"q",@"r",@"t",@"u",@"v",@"w",@"x",@"y",nil];
//    char Arr[32] = {'0', '1', '2', '3', '4', '5', '6', '7', '8',
//        '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'j', 'k', 'l', 'm',
//        'n', 'p', 'q', 'r', 't', 'u', 'v', 'w', 'x', 'y'};
 /*   //-substringWithRange: //按照所给出的位置，长度，任意地从字符串中截取子串
//    NSString *string1 = @"This is a string";
//    NSString *string2 = [string1 substringWithRange:NSMakeRange(0, 4)];
  */
    NSString *num  = [NSString stringWithFormat:@"%@",Anumber];
    NSString *standerd = @"0123456789abcdefghjklmnpqrtuvwxy";
    //    NSLog(@"---%lld",[num longLongValue]);
    if ([NSString isEmpty:num]) {
        return @"";
    }
    else{
        long long   temp = [num  longLongValue];
        int   yushu = 0;
        NSMutableString *fina = [NSMutableString  stringWithCapacity:10];
        NSMutableString *transfor = [NSMutableString  stringWithCapacity:10];
        while (temp > 0) {
            yushu =temp%32;
            //            NSLog(@"temp---%lld,yushu---%d",temp,yushu);
            temp  = temp/32;
            NSString  *str = [[standerd substringWithRange:NSMakeRange(yushu, 1)] copy];
            [fina appendString:str];
            str = nil;
        }
        //        NSLog(@"----%@---%d",fina,[fina length]);
        for (int i=0; i<[fina length]; i++) {
            //            NSLog(@"-i---%d     ,[fina length]-i-1--%d",i,[fina length]-i-1);
            NSString *tmp =  [[fina substringWithRange:NSMakeRange(([fina length]-i-1), 1)] copy];
            [transfor appendString:tmp];
            tmp = nil;
        }
        
        return transfor;
    }
}
+(NSString *)MarkSomeSubstringFromAnPhoneNumber:(NSString *)phoneNumber
{
    NSMutableString *expendStr = [NSMutableString stringWithCapacity:0];
    for (int i=0; i<[phoneNumber length]; i++) {
        NSString *tmp =  [[phoneNumber substringWithRange:NSMakeRange(i, 1)] copy];
        
        if (i>2&&i<7) {
            [expendStr appendString:@"*"];
        }
        else{
            [expendStr appendString:tmp];
        }
    }
    return expendStr;
}
//获取本机安装的应用的版本号
+(NSString *)getMyVersion
{
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    
    NSString *appVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
    return appVersion;
}
//获取本机安装的应用的数据库的版本号
+(NSString *)getMYDataBaseVersin{
    NSDictionary *Dic = [[NSBundle mainBundle] infoDictionary];
    
    NSString *DBVersion = [Dic objectForKey:@"DATABASEVersion"];
    return DBVersion;
}
//获取当前时间，并用@"yyyy-MM-dd HH:mm:ss"表示
+(NSString *)getnowTimewithYMDHMS{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate  *nowdate  = [NSDate date];
    NSString *returnStr = [dateFormat  stringFromDate:nowdate];
    
    return  returnStr;
}
//获取一定时间之后的时间，并用@"yyyy-MM-dd HH:mm:ss"表示
+(NSString *)getafterDuringTimeWithYMDHMS:(NSString*)data  {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init] ;
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] ];
    [inputFormatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate* inputDate = [inputFormatter dateFromString:data];
    

    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *returnStr = [dateFormat  stringFromDate:inputDate];
    
    return  returnStr;
}
//获取当前时间，并用@"yyyy-MM-dd"表示
+(NSString *)getnowTimeWithYMd{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate  *nowdate  = [NSDate date];
    NSString *returnStr = [dateFormat  stringFromDate:nowdate];
    
    return  returnStr;
}
//获取给定字符串之后，并用@"yyyy-MM-dd"表示
+(NSString *)getAfterOneDayTimeWithYMd:(NSString *)atime{
    NSString *returnStr  = nil;
    if ([NSString isEmpty:atime]) {
        return returnStr;
    }
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate  *nowdate  = [NSDate dateWithTimeInterval:24*60*60 sinceDate:[dateFormat dateFromString:atime ]];
     returnStr  = [dateFormat  stringFromDate:nowdate];
    
    return  returnStr;
}
//获取当前时间，"yyyy年MM月dd日"
+(NSString *)getnowTimeWithZWYMd{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy年MM月dd日"];
    NSDate  *nowdate  = [NSDate date];
    NSString *returnStr = [dateFormat  stringFromDate:nowdate];
    
    return  returnStr;
}
//获取当前时间，并用@"yyyyMM"表示
+(NSString *)getnowTimeWithYM{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyyMM"];
    NSDate  *nowdate  = [NSDate date];
    NSString *returnStr = [dateFormat  stringFromDate:nowdate];
    
    return  returnStr;
}
//获取当前时间，并用@"dd"表示
+(NSString *)getnowTimeWithdd{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"HH"];
    NSDate  *nowdate  = [NSDate date];
    NSString *returnStr = [dateFormat  stringFromDate:nowdate];
    
    return  returnStr;
}
//去掉获取的token的尖括号
+(NSString*)deleleKuoHao:(NSString *)string{
    if ([NSString isEmpty:string]) {
        return nil;
    }
    else{
        NSString *copystr = [string copy];
        if ([copystr length]>2) {
            if ([copystr hasPrefix:@"<"]) {
                NSMutableString *expendStr = [NSMutableString stringWithCapacity:0];
                for (int i=1; i<([copystr length]-1); i++) {
                    NSString *tmp =  [[copystr substringWithRange:NSMakeRange(i, 1)] copy];
                    [expendStr appendString:tmp];
                  }
                return expendStr;
          }
       
        }
        else{
            return copystr;
        }
    }
    return nil;
}
//统一单位，专用于山西
+(NSString *) getShanXIFomatterFlow:(NSString *)flowStr{
    NSString *str = nil;
    CGFloat flow = [flowStr  floatValue];
    if (flow < 1024.0) {
        str = [NSString stringWithFormat:@"%.2fMB",flow];
    }
    else if (flow >=1024.0) {
     int   f1 = flow/1024.0;
     CGFloat  f2 = flow - f1*1024;
        if(f2>0){
        str = [NSString stringWithFormat:@"%dGB%.2fMB",f1,f2];
        }
        else{
           str = [NSString stringWithFormat:@"%dGB",f1];
        }
    }
    
    return str;
}
//统一单位，专用于山西
+(NSString *) getShanXIFomatterFlowInRecomandView:(NSString *)flowStr{
    NSString *str = nil;
    CGFloat flow = [flowStr  floatValue];
    if (flow < 1024.0) {
        str = [NSString stringWithFormat:@"%dMB",[flowStr intValue]];
    }
    else if (flow >=1024.0) {
        int   f1 = flow/1024.0;
        CGFloat  f2 = flow - f1*1024;
        if(f2>0){
            str = [NSString stringWithFormat:@"%dMB",[flowStr intValue]];
        }
        else{
            str = [NSString stringWithFormat:@"%dGB",f1];
        }
    }
    
    return str;
}
//用于河南流量包模块显示数据
+(NSString *)getHeNanLiuliangBaoString:(NSString*)str{
    NSString *retunStr = nil;
    int flow = [str  intValue];
    if (flow>=1024.0) {
        if ((flow%1024)>0) {
            return [NSString stringWithFormat:@"%@M",str];
        }
        else{
            int  h = flow/1024;
            return [NSString stringWithFormat:@"%dG",h ];
        }
    }
    else{
        return [NSString stringWithFormat:@"%@M",str];
    }
    return retunStr;
}
//判断是否展示签到模块
+(NSString *)wheatherDisplaySign:(NSString *)str{
    NSRange range=[str rangeOfString:@","];
    if(range.location!=NSNotFound){
        return  [NSString stringWithFormat:@"%@",[[str componentsSeparatedByString:@","]objectAtIndex:0] ];
    }else{
        return [NSString stringWithFormat:@"%@",str];
    }
}
//返回size
+(CGSize)getSizeWith:(NSString *)text andSize:(CGSize)size andfontsize:(CGFloat)fontsize{
    
    NSDictionary *attributesum = @{NSFontAttributeName: [UIFont systemFontOfSize:fontsize]};
    NSAttributedString *attrStrum = [[NSAttributedString alloc] initWithString: text  attributes:attributesum];
    CGRect rectum = [attrStrum boundingRectWithSize:CGSizeMake(size.width, size.height) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    
    return CGSizeMake(rectum.size.width, rectum.size.height);

}
+(BOOL)isUrlLink:(NSString *)str{
//    @"((http|ftp|https)://)(([a-zA-Z0-9\._-]+\.[a-zA-Z]{2,6})|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,4})*(/[a-zA-Z0-9\&%_\./-~-]*)?";
//    NSString * regex = @"^(1)\\d{10}$";
//    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
//    BOOL isMatch = [pred evaluateWithObject:sender];
//    return isMatch;
   
    NSString *check = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", check];
    BOOL isMatch = [pre evaluateWithObject:str ];
    return  isMatch;
    
}
+(NSString*)getTopDomainWithUrlStr:(NSString *)sender
{
//    NSString *urlString=@"<meta/><link/><title>1Q84 BOOK1</title></head><body>";
//    
//    //NSRegularExpression类里面调用表达的方法需要传递一个NSError的参数。下面定义一个
//    NSError *error;
//    
//    //http+:[^\\s]* 这个表达式是检测一个网址的。(?<=title\>).*(?=</title)截取html文章中的<title></title>中内文字的正则表达式
//    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(?<=title\\>).*(?=</title)" options:0 error:&error];
//    
//    if (regex != nil) {
//        NSTextCheckingResult *firstMatch=[regex firstMatchInString:urlString options:0 range:NSMakeRange(0, [urlString length])];
//        
//        if (firstMatch) {
//            NSRange resultRange = [firstMatch rangeAtIndex:0];
//            
//            //从urlString当中截取数据
//            NSString *result=[urlString substringWithRange:resultRange];
//            //输出结果
//            NSLog(@"->%@<-",result);
//        }    
//        
//    }
    NSError *error;
    NSString *retStr = nil;
    NSRegularExpression *regex = [NSRegularExpression   regularExpressionWithPattern:@"[\\w-]+\\.(com|net|org|gov|cc|biz|info|cn|co|tv|me|tel|asia|fm|edu|mil|name|mobi|int|arpa|biz|pro|coop|aero|museum)(\\.(cn|hk|tw|jp|uk))*" options:0 error:&error ];
    NSTextCheckingResult *firstMatch=[regex firstMatchInString:sender options:0 range:NSMakeRange(0,[sender length])];
    if (firstMatch) {
        NSRange resultRange = [firstMatch rangeAtIndex:0];
        //从urlString中截取数据
        retStr = [sender substringWithRange:resultRange];
        NSLog(@"result = %@",retStr);
        
    }
  
    return retStr;
    
}
+(NSString*)getDomainNameWithUrlStr:(NSString *)sender
{

    NSError *error;
    NSString *retStr = nil;
    NSRegularExpression *regex = [NSRegularExpression   regularExpressionWithPattern:@"[\\w-]+\\.(com|net|org|gov|cc|biz|info|cn|co|tv|me|tel|asia|fm|edu|mil|name|mobi|int|arpa|biz|pro|coop|aero|museum)(\\.(cn|hk|tw|jp|uk))*" options:0 error:&error ];
    NSTextCheckingResult *firstMatch=[regex firstMatchInString:sender options:0 range:NSMakeRange(0,[sender length])];
   
    if (firstMatch) {
        NSRange resultRange = [firstMatch rangeAtIndex:0];
         NSString *temp = [sender  substringToIndex:(resultRange.location +resultRange.length)];
          NSArray *arr = [temp componentsSeparatedByString:@"//"];
        retStr =[arr lastObject];
        //从urlString中截取数据
//        retStr [sender  substringWithRange:NSMakeRange(<#NSUInteger loc#>, <#NSUInteger len#>)];
//        retStr = [sender substringWithRange:resultRange];
        NSLog(@"result = %@",retStr);
        
    }
    
    return retStr;
    
}
//把流量数据数据化简
+(NSString*)getSimplifierFlowBag:(NSString *)FlowStr{
    NSInteger ZongLiuLiang = [FlowStr integerValue];
    if (ZongLiuLiang<1024) {
        return [NSString stringWithFormat:@"%ldM",(long)ZongLiuLiang];
    }
    else{
        if (ZongLiuLiang%1024==0) {
            return [NSString stringWithFormat:@"%ldGB",((long)ZongLiuLiang/1024)];
        }
        else{
            return [NSString stringWithFormat:@"%.2fGB",(ZongLiuLiang/1024.0)];
        }
    }
    return @"";
}
//md5 32位 加密 （小写）
+ (NSString *)md5secret32:(NSString *)str {
    
    const char *cStr = [str UTF8String];
    
    unsigned char result[32];
    
    CC_MD5( cStr, strlen(cStr), result );
    
//    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",result[0],result[1],result[2],result[3],result[4],result[5],result[6],result[7],result[8],result[9],result[10],result[11],result[12],result[13],result[14],result[15],result[16], result[17],result[18], result[19], result[20], result[21],result[22], result[23],result[24], result[25],result[26], result[27],result[28], result[29],result[30], result[31]];
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",result[0],result[1],result[2],result[3],result[4],result[5],result[6],result[7],result[8],result[9],result[10],result[11],result[12],result[13],result[14],result[15],result[16], result[17],result[18], result[19], result[20], result[21],result[22], result[23],result[24], result[25],result[26], result[27],result[28], result[29],result[30], result[31] ];
    
}



//md5 16位加密 （大写）

+(NSString *)md5secret16:(NSString *)str {
     const char *cStr = [str UTF8String];
     unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result );
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]];
}
//  DES加密


+(NSString *) encryptUseDES:(NSString *)plainText key:(NSString *)key
{
    NSString *ciphertext = nil;
    const char *textBytes = [plainText UTF8String];
    NSUInteger dataLength = [plainText length];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    Byte iv[] = {1,2,3,4,5,6,7,8};
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [key UTF8String], kCCKeySizeDES,
                                          iv,
                                          textBytes, dataLength,
                                          buffer, 1024,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        ciphertext = [[NSString alloc] initWithData:[GTMBase64 encodeData:data] encoding:NSUTF8StringEncoding];
        
    }
    return ciphertext;
}
//解密
+(NSString *) decryptUseDES:(NSString*)cipherText key:(NSString*)key
{
    NSData* cipherData = [GTMBase64 decodeString:cipherText];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesDecrypted = 0;
    Byte iv[] = {1,2,3,4,5,6,7,8};
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [key UTF8String],
                                          kCCKeySizeDES,
                                          iv,
                                          [cipherData bytes],
                                          [cipherData length],
                                          buffer,
                                          1024,
                                          &numBytesDecrypted);
    NSString* plainText = nil;
    if (cryptStatus == kCCSuccess) {
        NSData* data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        plainText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return plainText;
}
+ (NSString*)decodeBase64String:(NSString * )input {
    NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    data = [GTMBase64 decodeData:data];
    NSString *base64String = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return base64String;
}

//给定时间，变成字符串，并用@"yyyyMMddHHmmss"表示
+(NSString *)getTimeWithYMDHMS:(NSDate*)data  {
    
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyyMMddHHmmss"];
    
    NSString *returnStr = [dateFormat  stringFromDate:data];
    
    return  returnStr;
}
//给定时间，并用@"yyyyMMdd"表示
+(NSString *)getTimeWithYMd:(NSDate*)date{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyyMMdd"];
    NSString *returnStr = [dateFormat  stringFromDate:date];
    return  returnStr;
}
#pragma mark   ==============产生支付宝随机订单号==============


+(NSString *)generateTradeNO
{
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand(time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}
#pragma mark getshowContractstring
//统一单位，淘卡淘
+(NSString *) gettaokataoFomatterFlow:(NSString *)flowStr{
    NSString *str = nil;
    if ([self isEmpty:flowStr]) {
        return str;
    }
    
    if (flowStr.length>=2) {
        NSString *countStr = [flowStr substringToIndex:(flowStr.length-1)];
        NSString *unitStr = [flowStr substringFromIndex:(flowStr.length-1)];
        if ([@"M" isEqualToString:unitStr]) {
            CGFloat flow = [countStr  floatValue];
            if (flow < 1024.0) {
                str = [NSString stringWithFormat:@"%.0fM",flow];
            }
            else if (flow >=1024.0) {
                CGFloat   f1 = flow/1024.0;
                str = [NSString stringWithFormat:@"%.0fG",f1];
            }
        }else {
            str = [NSString stringWithFormat:@"%@",flowStr];
        }
    }
    
   
    
    return str;
}
#pragma mark //获取当前时间，并用@"yyyyMMddHHmmss"表示
+(NSString *)getTaoKaTaonowTimewithYMDHMS{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyyMMddHHmmss"];
    NSDate  *nowdate  = [NSDate date];
    NSString *returnStr = [dateFormat  stringFromDate:nowdate];
    
    return  returnStr;
}
#pragma mark //获取当前时间，并用@"yyMMddHHmm"表示
+(NSString *)getWechatTaoKaTaonowTimewithYMDHMS{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyMMddHHmm"];
    NSDate  *nowdate  = [NSDate date];
    NSString *returnStr = [dateFormat  stringFromDate:nowdate];
    
    return  returnStr;
}
+(NSString *)getTaoKaTaonowTimeYMDHMSWithtime:(NSNumber *)time{
    NSString *timestr = [NSString stringWithFormat:@"%lld",[time longLongValue]];
    
    NSDateFormatter* dateFormat1 = [[NSDateFormatter alloc] init];
    [dateFormat1 setDateFormat:@"yyyyMMddHHmmss"];
    NSDate  *nowdate1  = [dateFormat1 dateFromString:timestr];
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
//    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString *returnStr = [dateFormat  stringFromDate:nowdate1];
    
    return  returnStr;
}
+(NSString *)getTaoKaTaonowTimeYMDHMSWithMess:(NSNumber *)time{
    NSString *timestr = [NSString stringWithFormat:@"%lld",[time longLongValue]];
    
    NSDateFormatter* dateFormat1 = [[NSDateFormatter alloc] init];
    [dateFormat1 setDateFormat:@"yyyyMMddHHmmss"];
    NSDate  *nowdate1  = [dateFormat1 dateFromString:timestr];
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM-dd HH-mm"];
    NSString *returnStr = [dateFormat  stringFromDate:nowdate1];
    
    return  returnStr;
}

+(NSString *)getTaoKaTaonowTimewithD{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"D"];
    NSDate  *nowdate  = [NSDate date];
    NSString *returnStr = [dateFormat  stringFromDate:nowdate];
    
    return  returnStr;
}
#pragma mark 获取一定时间之后的时间，并用@"yyyyMMddHHmmss"表示
+(NSNumber *)getTaoKaTaoTimeAfterAtimeWithYMDHMS:(NSTimeInterval)time  {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init] ;
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] ];
    [inputFormatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate *data = [NSDate date];
    data = [data dateByAddingTimeInterval:time];
  
    NSString *returnStr = [inputFormatter  stringFromDate:data];
    NSNumber *num = [NSNumber numberWithLongLong:[returnStr longLongValue]];
    
    return  num;
}
#pragma mark 获取一个月之后的时间，并用@"yyyyMM"表示
+(NSString *)getTaoKaTaoTimeAfterAMonthWithYM:(NSString*)time  {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init] ;
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] ];
    [inputFormatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate *data = [inputFormatter dateFromString:time];
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init] ;
    [outputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] ];
    [outputFormatter setDateFormat:@"yyyyMM"];
    
   
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *comps = nil;
    
    comps = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit fromDate:data];
    
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    
    [adcomps setYear:comps.year];
    
    [adcomps setMonth:comps.month +1];
    
    NSDate *returnDate = [calendar dateFromComponents:adcomps];

    
    NSString *returnStr = [outputFormatter  stringFromDate:returnDate];
    
    
    return  returnStr;
}
#pragma mark 获取自1970的时间，用秒表示
+(long long int)getTimeSince1970ToTheTime:(NSNumber *)Thetime{
    NSDateFormatter *Formatter = [[NSDateFormatter alloc] init] ;
    [Formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] ];
    [Formatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate *mydate = [Formatter  dateFromString:[NSString stringWithFormat:@"%@",Thetime]];
    long long int Treval = (long long int)[mydate timeIntervalSince1970];
    return Treval;
}
#pragma mark 获取倒计时的时间
+(NSMutableArray*)getCountDownArrayWithTimeTraval:(long long int)timeTreval{
    if (timeTreval) {
        int hour = (int)timeTreval/(60*60);
        int minute = (int)(timeTreval-hour*(60*60))/60;
        int second = (int)timeTreval-hour*(60*60)-minute*60;
        NSMutableArray *array = [NSMutableArray arrayWithObjects:[NSString stringWithFormat:@"%02d",hour], [NSString stringWithFormat:@"%02d",minute],[NSString stringWithFormat:@"%02d",second],nil];
        return array;
        
    }
    return nil;
}

#pragma mark 淘口令
//#%淘卡淘口令%#长按复制这条信息，打开淘卡淘即可看到【｛活动标题｝】，APP下载：#downloadURL#￥$NAi43Y$￥
+(NSString *)gettaokataoPassword:(NSString *)string{
    if (!string) {
        return nil;
    }
    NSError *error;
    NSString *retStr = nil;
    NSRegularExpression *regex = [NSRegularExpression   regularExpressionWithPattern:@"(\\￥\\$)([A-Za-z0-9]{4,})(\\$\\￥)" options:0 error:&error ];
    NSTextCheckingResult *firstMatch=[regex firstMatchInString:string options:0 range:NSMakeRange(0,[string length])];
    if (firstMatch) {
        NSRange resultRange = [firstMatch rangeAtIndex:0];
        //从urlString中截取数据
        retStr = [string substringWithRange:resultRange];
        NSString *finalStr = [[retStr componentsSeparatedByString:@"$"]objectAtIndex:1];
        return finalStr;
//        NSLog(@"result = %@",retStr);
        
    }
    
    return retStr;
}
+(NSString *)gettaokataoTitle:(NSString *)string{
    if (!string) {
        return nil;
    }
    NSError *error;
    NSString *retStr = nil;
    NSRegularExpression *regex = [NSRegularExpression   regularExpressionWithPattern:@"(\\【\\{)(.{0,})(\\}\\】)" options:0 error:&error ];
    NSTextCheckingResult *firstMatch=[regex firstMatchInString:string options:0 range:NSMakeRange(0,[string length])];
    if (firstMatch) {
        NSRange resultRange = [firstMatch rangeAtIndex:0];
        //从urlString中截取数据
        retStr = [string substringWithRange:resultRange];
        NSRange ranged = NSMakeRange(2, [retStr length]-4);
        //        NSLog(@"result = %@",retStr);
       NSString    *returnStr = [retStr substringWithRange:ranged];
        return returnStr;
    }
    
    return retStr;
}
#pragma mark 头像名字
+(UIImage  *)getHeadImage{
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSNumber *userUUID = [NSNumber numberWithLongLong:([[MyKeyChainHelper getValueWithService:KEY_UUID]integerValue])];
    if ([userUUID intValue]==0) {
        userUUID = [NSNumber numberWithLongLong:11];
    }
    NSString *fileName = [NSString stringWithFormat:@"%@.jpg",userUUID];
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:fileName];
    success = [fileManager fileExistsAtPath:fullPath];
    if (success) {
        UIImage *headImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
        

        return headImage;
    }
    return nil;
}
#pragma mark 正则判断手机号码格式
+ (BOOL)validatePhone:(NSString *)phone
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:phone] == YES)
        || ([regextestcm evaluateWithObject:phone] == YES)
        || ([regextestct evaluateWithObject:phone] == YES)
        || ([regextestcu evaluateWithObject:phone] == YES))
    {
        if([regextestcm evaluateWithObject:phone] == YES) {
            NSLog(@"China Mobile");
        } else if([regextestct evaluateWithObject:phone] == YES) {
            NSLog(@"China Telecom");
        } else if ([regextestcu evaluateWithObject:phone] == YES) {
            NSLog(@"China Unicom");
        } else {
            NSLog(@"Unknow");
        }
        
        return YES;
    }
    else
    {
        return NO;
    }
}
#pragma mark weightSacle
+(CGFloat)weightsacle{
    if (isPhone6P) {
        return 414.0/320.0;
    }else if (isPhone6){
        return 375.0/320.0;
    }else{
        return 1.0;
    }
//    return 1.0;
}

//url加密中特殊字符处理处理
+ (NSString *)encodeToPercentEscapeString: (NSString *) input
{
    NSString*
    outputStr = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                             
                                                                             NULL, /* allocator */
                                                                             
                                                                             (__bridge CFStringRef)input,
                                                                             
                                                                             NULL, /* charactersToLeaveUnescaped */
                                                                             
                                                                             (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                             
                                                                             kCFStringEncodingUTF8);
    
    
    return outputStr;
}
#pragma mark 是否是本月
+(BOOL)isNowMouthFromNUmber:(NSString*)numberTimestring{
    if (![NSString isEmpty:numberTimestring]) {
        NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init] ;
        [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] ];
        [inputFormatter setDateFormat:@"yyyyMMdd"];
        NSDate *data1 = [inputFormatter dateFromString:numberTimestring];
        
        NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init] ;
        [outputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] ];
        [outputFormatter setDateFormat:@"yyyyMM"];
        NSString *intputstring = [outputFormatter stringFromDate:data1 ];
        NSString *nowTimeString = [outputFormatter stringFromDate:[NSDate date]];
        if ([intputstring isEqualToString:nowTimeString]) {
            return YES;
        }
        return NO;
        
    }
    return NO;
}
#pragma mark yyyy/MM/dd
+(NSString *)gettaokataoyyyyMMddWithTimeNumber:(NSNumber *)Timenumber{
    if (Timenumber&&[Timenumber longLongValue]>0) {
        NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init] ;
        [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] ];
        [inputFormatter setDateFormat:@"yyyyMMdd"];
        NSDate *data1 = [inputFormatter dateFromString:[NSString stringWithFormat:@"%@",Timenumber]];
        
        NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init] ;
        [outputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] ];
        [outputFormatter setDateFormat:@"yyyy/MM/dd"];
        NSString *outputstring = [outputFormatter stringFromDate:data1 ];
        return outputstring;
    }
    return @"";
}
#pragma mark getLocationCity
+(NSString *)getCity{
    NSString *LocationcityStr =  [NSString stringWithFormat:@"%@",[MXEncryptionKeyStore encrytionKeyStoreFindWith:LocationCity]];
    NSString *SelectedcityStr = [NSString stringWithFormat:@"%@",[MXEncryptionKeyStore encrytionKeyStoreFindWith:SelectedCity]];
    if (![NSString isEmpty:SelectedcityStr]) {
         return SelectedcityStr;
        
    }else{
            
        if (![NSString isEmpty:LocationcityStr]) {
            return LocationcityStr;

        }else{
            return nil;        //            [self leftBarButtonItemClick];
        }
    }

    return nil;
}
@end
