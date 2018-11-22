local Errcode = require "def.errcode_helper"
local REG = Errcode.REG

REG("NOT_IN_BATTLE",        0x1000, "不处于战斗中")
REG("ALREADY_IN_ROOM",      0x1001, "已处于房间中")
REG("NOT_IN_ROOM",          0x1002, "不处于房间中")
REG("ROOM_NOT_EXIST",       0x1003, "房间不存在")
REG("ROOM_FULL",            0x1004, "房间已满")
REG("BATTLE_NOT_EXIST",     0x1005, "战斗不存在")
REG("ALREADY_IN_BATTLE",    0x1006, "已经处于战斗中")
REG("BATTLE_CMD_ERROR",     0x1007, "战斗命令出错")
REG("BATTLE_CANNOT_MOVE",   0x1008, "不可移动")
REG("BATTLE_CANNOT_ATTACK", 0x1009, "不可攻击")
REG("BATTLE_CANNOT_USE",    0x100a, "这不是你的棋子")
REG("BATTLE_NOT_YOUR_TURN", 0x100b, "这不是你的回合")
REG("BATTLE_IS_OVER",       0x100c, "战斗已结束")
REG("NOT_ROOM_OWNER",       0x100d, "不是房主")
REG("FRIEND_NOT_IN_ROOM",   0x100e, "好友不在房间")
REG("ALREADY_IN_MATCHING",  0x100f, "正在匹配")
REG("NOT_IN_MATCHING",      0x1010, "不处于匹配中")

REG("ITEM_NOT_EXIST",       0x1100, "物品不存在")
REG("ITEM_NOT_ENOUGH",      0x1101, "物品不足")
REG("MIAODOU_NOT_ENOUGH",   0x1102, "喵豆不足")
REG("COIN_NOT_ENOUGH",      0x1103, "金币不足")

REG("INVITE_NOT_ENOUGH",    0x1200, "邀请人数不够")

REG("REPEAT_BUY_DRESS",     0x1300, "已拥有该皮肤")
REG("REPEAT_BUY_SUIT",      0x1301, "已拥有该套装")
return Errcode
