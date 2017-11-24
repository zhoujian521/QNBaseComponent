//
//  WMGetCusHelper.m
//  ChannelSoftWeMarketing
//
//  Created by BJQingniuJJ on 2017/8/20.
//  Copyright © 2017年 channelsoftios. All rights reserved.
//

#import "WMGetCusHelper.h"
//#import "WMLoginModel.h"

//JJ:001 - 001 未抢【获客】                （客户数：X人）
//JJ:001 - 002 已抢【获客】                （获客：X人 可抢：Z人）
//JJ:002 - 001 未联系完成【待联系】          （获客：X人 未联系：X人）
//JJ:003 - 001 已联系（无可抢客户） 【去维客】 （获客：X人）
//JJ:004 - 001 【已结束】                  （快照）

@implementation WMGetCusHelper

////1.线索包进行中 2.线索包已结束
//+ (KTaskGutCusType )getTaskGetCusTypeWithTaskModel:(WMTaskModel *)taskModel{
//    // 此处必然是 分配/抢单客户 购买线索
//    switch ([taskModel.taskType integerValue]) {
//        case 1: { // 分配线索
//            if ([taskModel.taskStatus integerValue] == 2) { //已结束
//                if ([taskModel.noDialCusSum integerValue] > 0) { // 已(抢/分配) =》未联系完
//                    return TaskHasEndedContactNone;
//                }
//                if ([taskModel.userCusSum integerValue] > 0) { // 已(抢/分配) =》联系完 =》结束
//                    return TaskHasEndedContacted;
//                }
//                // 没有分配【理论看不到】  未抢=结束
//                return TaskHasEndedNotRob;
//            }
//            
//            // 未结束
//            if ([taskModel.noDialCusSum integerValue] > 0) { //尚有未联系客户 =》 立即联系
//                return TaskFastContactCus;
//            }
//            // 分配客户已联系完成 =》去维客
//            return TaskMaintainCus;
//        }
//            break;
//        case 2: { // 抢单线索
//            // 1.线索包进行中 2.线索包已结束
//            if ([taskModel.taskStatus integerValue] == 2) { //已结束
//                if ([taskModel.noDialCusSum integerValue] > 0) { // 已(抢/分配) =》未联系完
//                    return TaskHasEndedContactNone;
//                }
//                if ([taskModel.userCusSum integerValue] > 0) { // 已(抢/分配) =》联系完 =》结束
//                    return TaskHasEndedContacted;
//                }
//                // 没有分配【理论看不到】  未抢=结束
//                return TaskHasEndedNotRob;
//            }
//            
//            //    customerRemain = 7;
//            //    customerTotal = 20;
//            //    endTime = 1507107300000;
//            //    isNew = 2;
//            //    noDialCusSum = 0;
//            //    startTime = 1504515300000;
//            //    taskId = 54;
//            //    taskName = "\U62a2\U5355\U7ebf\U7d22\U65b0\U7684-\U5c0f\U5f20";
//            //    taskStatus = 1;
//            //    taskType = 2;
//            //    userCusSum = 2;
//            
//            // 未结束
//            if ([taskModel.noDialCusSum integerValue] > 0) { //尚有未联系客户 =》 立即联系
//                return TaskFastContactCus;
//            }
//            // 没有有未联系客户
//            if ([taskModel.customerRemain integerValue] > 0) {
//                if ([taskModel.userCusSum integerValue] > 0) {
//                    return TaskRobedGutCus; // 已联系完 =》【立即获客】
//                }
//                return TaskNotRobGutCus; // 未抢 =》【立即获客】
//                
//            } else {
//                if ([taskModel.userCusSum integerValue] > 0) {
//                    return TaskMaintainCus; //已联系完 =》【去维客】
//                }
//                // 未抢 没有剩余客户数
//                return TaskNotRobZeroGutCus;
//            }
//        }
//             break;
//        case 3: { // 购买线索
//            
////            customerRemain = 20;
////            customerTotal = 37;
////            endTime = 1514205562000;
////            isNew = 2;
////            noDialCusSum = 0;
////            startTime = 1506343258000;
////            taskGutCusType = 0;
////            taskId = 4402;
////            taskName = "\U7ebf\U7d22\U5305\U8d2d\U4e70092501";
////            taskStatus = 1;
////            taskType = 3;
////            userCusSum = 1;
//            
//            // 1.线索包进行中 2.线索包已结束
//            if ([taskModel.taskStatus integerValue] == 2) { //已结束
//                if ([taskModel.noDialCusSum integerValue] > 0) { // 已(抢/分配) =》未联系完
//                    return TaskHasEndedContactNone;
//                }
//                if ([taskModel.userCusSum integerValue] > 0) { // 已(抢/分配) =》联系完 =》结束
//                    return TaskHasEndedContacted;
//                }
//                // 没有分配【理论看不到】  未抢=结束
//                return TaskHasEndedNotRob;
//            }
//            
//            // 未结束
//            if ([taskModel.noDialCusSum integerValue] > 0) { //尚有未联系客户 =》 立即联系
//                return TaskFastContactCus;
//            }
//            // 没有有未联系客户
//            if ([taskModel.customerRemain integerValue] > 0) {
//                if ([taskModel.userCusSum integerValue] > 0) {
//                    return TaskRobedGutCus; // 已联系完 =》【立即获客】
//                }
//                return TaskNotRobGutCus; // 未抢 =》【立即获客】
//                
//            } else {
//                if ([taskModel.userCusSum integerValue] > 0) {
//                    return TaskMaintainCus; //已联系完 =》【去维客】
//                }
//                // 未抢 没有剩余客户数
//                return TaskNotRobZeroGutCus;
//            }
//            
//        }
//            break;
//            
//        default:
//            break;
//    }
//    return TaskHasEndedNotRob;
//}



@end



/**
 0.0
 抢单线索/分配线索
 1.0 抢单线索
 1.1.0 未抢 =》【立即获客】（客户数：X人）    JJ:001 - 001 未抢【获客】
 1.2.0 已抢
 1.2.1 未联系 =》【立即联系】（获客：X人   未联系：X人）  JJ:002 - 001 未联系完成【待联系】
 1.2.2 已联系
 1.2.2.0 未联系完 =》【立即联系】（获客：X人   未联系：Z人）JJ:002 - 001 未联系完成【待联系】
 1.2.2.1 已经联系完成
 1.2.2.1.0 没有可抢名单 =》【去维客】（获客：X人） JJ:003 - 001 已联系（无可抢客户） 【去维客】
 1.2.2.1.1 有可抢名单 =》【立即获客】（获客：X人 可抢：Z人）
 1.3.0 已结束 =》【已结束】 JJ:004 - 001 【已结束】
 1:（客户数：X人）2:（获客：X人 未联系：X人）3:（获客：X人）4:（获客：X人 可抢：Z人）
 
 
 2.0 分配线索
 2.1.0 未联系 =》【立即联系】（获客：X人   未联系：X人） JJ:002 - 001 未联系完成【待联系】
 
 2.2.0 已联系
 2.2.1未联系完 =》【立即联系】（获客：X人   未联系：Z人） JJ:002 - 001 未联系完成【待联系】
 2.2.2 已经联系完成  =》【去维客】（获客：X人） JJ:003 - 001 已联系 【去维客】
 
 2.3.0 已结束 =》【已结束】 JJ:004 - 001 【已结束】
 1:（客户数：X人）2:（获客：X人 未联系：X人）3:（获客：X人）4:（获客：X人 可抢：Z人）
 */

