//
//  NSString+Addition.h
//  SWGJ
//
//  Created by mingxum on 14-6-23.
//  Copyright (c) 2014年 mingxum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@interface NSString (Addition)
//判断字符串是否为空
+(BOOL)isEmpty:(NSString *) string;
//河南的号码做正则校验
+(BOOL)isFitHenanRegexWithString:(NSString *)sender;
//判断是否安装过这个应用
+(BOOL) APCheckIfAppInstalled2:(NSString *)urlSchemes;
+(NSString *)getExpendCodeFromIPhoneNumber:(NSString *)Anumber;
//给定一个字符串，把字符串从第4位到第8位变成*，返回字符串
+(NSString *)MarkSomeSubstringFromAnPhoneNumber:(NSString *)phoneNumber;
//获取本机安装的应用的版本号
+(NSString *)getMyVersion;
//获取本机安装的应用的数据库的版本号
+(NSString *)getMYDataBaseVersin;
//获取一定时间之后的时间，并用@"yyyy-MM-dd HH:mm:ss"表示
+(NSString *)getafterDuringTimeWithYMDHMS:(NSString*)data;
//获取当前时间，并用@"yyyy-MM-dd HH:mm:ss"表示
+(NSString *)getnowTimewithYMDHMS;
//获取当前时间，并用@"yyyy-MM-dd"表示
//获取给定字符串之后，并用@"yyyy-MM-dd"表示
+(NSString *)getAfterOneDayTimeWithYMd:(NSString *)atime;
+(NSString *)getnowTimeWithYMd;
//获取当前时间，并用@"yyyyMM"表示
+(NSString *)getnowTimeWithYM;
//获取当前时间，并用@"dd"表示
+(NSString *)getnowTimeWithdd;
//去掉获取的token的尖括号
+(NSString*)deleleKuoHao:(NSString *)string;
//获取当前时间，"yyyy年MM月dd日"
+(NSString *)getnowTimeWithZWYMd;
//统一单位，专用于山西
+(NSString *) getShanXIFomatterFlow:(NSString *)flowStr;
//用于河南流量包模块显示数据
+(NSString *)getHeNanLiuliangBaoString:(NSString*)str;
+(NSString *) getShanXIFomatterFlowInRecomandView:(NSString *)flowStr;

//判断是否展示签到模块
+(NSString *)wheatherDisplaySign:(NSString *)str;
//返回size
+(CGSize)getSizeWith:(NSString *)text andSize:(CGSize)size andfontsize:(CGFloat)fontsize;
//判断是否是网址链接
+(BOOL)isUrlLink:(NSString *)str;
//获取顶级域名
+(NSString*)getTopDomainWithUrlStr:(NSString *)sender;
//获取域名
+(NSString*)getDomainNameWithUrlStr:(NSString *)sender;
//把流量数据数据化简
+(NSString*)getSimplifierFlowBag:(NSString *)FlowStr;
//md5 32位 加密 （小写）
+ (NSString *)md5secret32:(NSString *)str;
//md5 16位加密 （大写）
+(NSString *)md5secret16:(NSString *)str;
//      DES加密
+(NSString *) encryptUseDES:(NSString *)plainText key:(NSString *)key;
//解密
+(NSString *) decryptUseDES:(NSString*)cipherText key:(NSString*)key;
+ (NSString*)decodeBase64String:(NSString * )input;
//给定时间，并用@"yyyyMMdd"表示
+(NSString *)getTimeWithYMd:(NSDate*)date;
//给定时间，变成字符串，并用@"yyyyMMddHHmmss"表示
+(NSString *)getTimeWithYMDHMS:(NSDate*)data;
#pragma mark   ==============产生支付宝随机订单号==============
+(NSString *)generateTradeNO;
+(NSString *) gettaokataoFomatterFlow:(NSString *)flowStr;

#pragma mark //获取当前时间，并用@"yyyyMMddHHmmss"表示
+(NSString *)getTaoKaTaonowTimewithYMDHMS;
#pragma mark //获取当前时间，并用@"yyMMddHHmm"表示
+(NSString *)getWechatTaoKaTaonowTimewithYMDHMS;
// 把number型的时间，并用@"yyyy-MM-dd HH:mm:ss"表示
+(NSString *)getTaoKaTaonowTimeYMDHMSWithtime:(NSNumber *)time;
+(NSString *)getTaoKaTaonowTimeYMDHMSWithMess:(NSNumber *)time;
#pragma mark //获取当前时间，并用@"dd"表示
+(NSString *)getTaoKaTaonowTimewithD;
#pragma mark 获取一定时间之后的时间，并用@"yyyyMMddHHmmss"表示
+(NSNumber *)getTaoKaTaoTimeAfterAtimeWithYMDHMS:(NSTimeInterval)time;
#pragma mark 获取一个月之后的时间，并用@"yyyyMM"表示
+(NSString *)getTaoKaTaoTimeAfterAMonthWithYM:(NSString*)time;
#pragma mark 获取自1970的时间，用秒表示
+(long long int)getTimeSince1970ToTheTime:(NSNumber *)Thetime;
#pragma mark 获取倒计时的时间
+(NSMutableArray*)getCountDownArrayWithTimeTraval:(long long int)timeTreval;
#pragma mark 淘口令
+(NSString *)gettaokataoPassword:(NSString *)string;
+(NSString *)gettaokataoTitle:(NSString *)string;
#pragma mark 头像名字
+(UIImage  *)getHeadImage;
#pragma mark weightSacle
+(CGFloat)weightsacle;
//url加密中特殊字符处理处理
+ (NSString *)encodeToPercentEscapeString: (NSString *) input;
#pragma mark 是否是本月
/*brief 输入的字符串是本月YYYYmm
 @return 输出的参数，BOOL类型
 @param 输入的时间字符串
 */
+(BOOL)isNowMouthFromNUmber:(NSString*)numberTimestring;
#pragma mark yyyy/MM/dd
/*brief 输入的字符串是yyyyMMdd转化成yyyy/MM/dd类型的字符串
 @return 输出的参数，NSString类型yyyy/MM/dd
 @param 输入的时间字符串yyyyMMdd类型
 */
+(NSString *)gettaokataoyyyyMMddWithTimeNumber:(NSNumber *)Timenumber;
#pragma mark getLocationCity
/*brief 获取城市，如果用户选择过的话返回会用户选择的城市，若果用户没有选择过得话，在定位城市不为空的情况下，返回用户的的定位城市。否则返回空字符串
 @return 输出的参数，NSString类型城市信息

 */
+(NSString *)getCity;
@end
