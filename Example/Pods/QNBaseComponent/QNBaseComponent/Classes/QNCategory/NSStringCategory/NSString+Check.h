//
//  NSString+Check.h
//  Pods-QNBaseComponent_Example
//
//  Created by BJQingniuJJ on 2017/11/22.
//  ZJ:【字符串 校验】

#import <Foundation/Foundation.h>

@interface NSString (Check)

/**
 校验 是否是【合法】的Url

 @return BOOL
 */
- (BOOL)isValidateUrl;

/**
 校验  是否是【合法】的身份证号
 
 (中华人民共和国身份证规则：http://wenku.baidu.com/link?url=p_JbrFTwPTnc5rmPLoxQBaMypPV6tFLGW5hLGZYDks8pTJZNSNF9_VpAzeQVIKEtB6mhiZjkxbmFpW6khGd7b2Zo3gWQtxuwDKRXoY8DN2C)

 @return BOOL
 */
- (BOOL)isValidateIDNumber;

/**
 校验  是否是【合法】电话号码

 @return BOOL
 */
-(BOOL)checkPhoneNumInput;

/**
 校验  当前字符串有没有为空或者只有空格字符串

 @return BOOL
 */
- (BOOL)isBlankString;

/**
 校验  当前字符串有没有为空
 
 @return BOOL
 */
- (BOOL)isBlankReqString;

/**
 校验  当前字符串是否为中文

 @return BOOL
 */
- (BOOL)checkChineseCharInput;

/**
 校验  当前字符串是否为  1~15个中英文或数字

 @return BOOL
 */
- (BOOL)checkChineseEnglishOrNumber;

/**
 校验  字符是否是否是英文字母,不区分大小写

 @return BOOL
 */
- (BOOL)checkEnglishLetter;

/**
 校验  字符串是否全部为数字

 @return BOOL
 */
- (BOOL)isAllNum;

/**
 校验 字符串是否全部为数字或者小数点

 @return BOOL
 */
- (BOOL)isNumAndPoint;

/**
 第一个char是否是数字

 @return BOOL
 */
- (BOOL)firstCharIsInteger;

/**
 第一个char不是字母或者数字

 @return BOOL
 */
- (BOOL)firstCharIsNotLetterOrInteger;


/**
 *  md5加密
 *
 *  @return 返回加密后的string
 */

- (NSString *)convertToMD5;


- (NSString *)stringSecret;
/**
 *  @author Lynn
 *
 *  汉字的拼音
 *
 *  @return 拼音
 */
- (NSString *)pinyin;


/**
 *  @author Lynn
 *
 *  获取解析过的deviceToken
 *
 *  @return deviceToken
 */
+ (NSString *)getDeviceToken:(NSData *)deviceToken;

/**
 *  @author li_yong
 *
 *  获取设备IP地址
 *
 *  @return IPAddress
 */
+ (NSString *)getIPAddress;


/**
 *  @author liyong
 *
 *  json字符串解析
 *
 *  @return 解析结果(字典或者数组)
 */
- (id)jsonStrParse;

/**
 *  @author liyong
 *
 *  字典/数组转化为json字符串
 *
 *  @return json字符串
 */
+ (NSString *)jsonStringWithDictionary:(id)obj;

/**
 *  @author Lynn
 *
 *  文件格式
 *
 *  @param filename filename description
 *
 *  @return return value description
 */
+ (NSString*)GetContentType:(NSString*)filename;

/**
 *  @author Lynn
 *
 *  IM时间格式
 *
 *  @param secs secs description
 *
 *  @return return value description
 */
+ (NSString *)ConvertMessageTime:(long long)secs;

- (NSString *)USStringFormat;

/**
 *  @author liyong
 *
 *  格式化手机号码，去掉区号(针对大陆区号+86，去掉手机号码中的“-”、“()”等非数字符号)
 */
- (NSString *)formatePhoneNum;

@end
