-- 协议号规范
-- 0x0000 ~ 0x0fff 服务器给客户端发
-- 0x1000 ~ 0x4fff 与游戏服之间的rpc

local opcode = require "def.opcode_helper"
local REG = opcode.REG

----------------------------------------------------------------
-- S2C 服务器主动发给客户端的封包    
REG(0x0011, "User.s2c_msg")
REG(0x0013, "User.s2c_sync")
REG(0x0023, "Battle.s2c_update_room", SESSION)
REG(0x0025, "Battle.s2c_update_team", SESSION)
REG(0x0027, "Battle.s2c_sync")
REG(0x0029, "Battle.s2c_battle_ready", SESSION)
REG(0x002b, "Battle.s2c_battle_start", SESSION)
REG(0x002d, "Battle.s2c_battle_over", SESSION)
REG(0x002f, "Battle.s2c_match_ret", SESSION)
REG(0x0031, "Battle.s2c_sync_emoticon")
REG(0x0101, "Bag.s2c_sync_item", SESSION)
REG(0x0103, "Bag.s2c_remove_item", SESSION)
REG(0x0104, "Bag.s2c_notify_item")
REG(0x0111, "Achieve.s2c_sync", SESSION)
REG(0x0121, "Count.s2c_sync", SESSION)
REG(0x0131, "Login.s2c_kick", SESSION)
     
----------------------------------------------------------------
-- RPC 客户端请求的RPC封包，必须成对 ，服务端协议号加1

-- login
REG(0x1010, "Login.c2s_login")
REG(0x1011, "Login.s2c_login")
REG(0x1012, "Login.c2s_ping")
REG(0x1013, "Login.s2c_ping")
REG(0x1014, "Login.c2s_reconnect")
REG(0x1015, "Login.s2c_reconnect")

-- user
REG(0x1020, "User.c2s_data")
REG(0x1021, "User.s2c_data")
REG(0x1022, "User.c2s_change_dress")
REG(0x1023, "User.s2c_change_dress")

-- battle
REG(0x1030, "Battle.c2s_info")
REG(0x1031, "Battle.s2c_info")
REG(0x1032, "Battle.c2s_match")
REG(0x1033, "Battle.s2c_match", SESSION)
REG(0x1034, "Battle.c2s_create_team")
REG(0x1035, "Battle.s2c_create_team")
REG(0x1036, "Battle.c2s_create_room")
REG(0x1037, "Battle.s2c_create_room")
REG(0x1038, "Battle.c2s_join_team")
REG(0x1039, "Battle.s2c_join_team")
REG(0x103a, "Battle.c2s_join_room")
REG(0x103b, "Battle.s2c_join_room", SESSION)
REG(0x103c, "Battle.c2s_leave_room")
REG(0x103d, "Battle.s2c_leave_room", SESSION)
REG(0x103e, "Battle.c2s_leave_team")
REG(0x103f, "Battle.s2c_leave_team", SESSION)
REG(0x1040, "Battle.c2s_data")
REG(0x1041, "Battle.s2c_data", SESSION)
REG(0x1042, "Battle.c2s_room_ready")
REG(0x1043, "Battle.s2c_room_ready")
REG(0x1044, "Battle.c2s_start")
REG(0x1045, "Battle.s2c_start")
REG(0x1046, "Battle.c2s_cmd")
REG(0x1047, "Battle.s2c_cmd")
REG(0x1048, "Battle.c2s_giveup")
REG(0x1049, "Battle.s2c_giveup")
REG(0x104a, "Battle.c2s_over")
REG(0x104b, "Battle.s2c_over")
REG(0x104c, "Battle.c2s_robot_cmd")
REG(0x104d, "Battle.s2c_robot_cmd")
REG(0x104e, "Battle.c2s_double_reward")
REG(0x104f, "Battle.s2c_double_reward", SESSION)
REG(0x1051, "Battle.c2s_cancel_match")
REG(0x1052, "Battle.s2c_cancel_match", SESSION)
REG(0x1053, "Battle.c2s_revert_star")
REG(0x1054, "Battle.s2c_revert_star", SESSION)
REG(0x1055, "Battle.c2s_emoticon")
REG(0x1056, "Battle.s2c_emoticon")


REG(0x1100, "Bag.c2s_data")
REG(0x1101, "Bag.s2c_data")

REG(0x1200, "Gm.c2s_data")
REG(0x1201, "Gm.s2c_data")
REG(0x1202, "Gm.c2s_cmd")
REG(0x1203, "Gm.s2c_cmd")

REG(0x1300, "Race.c2s_data")
REG(0x1301, "Race.s2c_data")
REG(0x1302, "Race.c2s_reward")
REG(0x1303, "Race.s2c_reward", SESSION)

REG(0x1400, "Shop.c2s_buy")
REG(0x1401, "Shop.s2c_buy")

REG(0x1500, "Rank.c2s_data")
REG(0x1501, "Rank.s2c_data")

REG(0x1600, "Achieve.c2s_data")
REG(0x1601, "Achieve.s2c_data")
REG(0x1602, "Achieve.c2s_reward")
REG(0x1603, "Achieve.s2c_reward")

REG(0x1700, "Checkin.c2s_data")
REG(0x1701, "Checkin.s2c_data")
REG(0x1702, "Checkin.c2s_reward")
REG(0x1703, "Checkin.s2c_reward")

REG(0x1800, "Count.c2s_data")
REG(0x1801, "Count.s2c_data")

REG(0x1900, "Lottery.c2s_data")
REG(0x1901, "Lottery.s2c_data")

REG(0x1a00, "Invite.c2s_data")
REG(0x1a01, "Invite.s2c_data")
REG(0x1a02, "Invite.c2s_reward")
REG(0x1a03, "Invite.s2c_reward")

-- 离线操作
REG(0x9000, "User.op_add_coin") 
REG(0x9001, "User.op_add_miaodou") 
REG(0x9002, "User.op_update") 
REG(0x9010, "Bag.op_create_item") 
REG(0x9020, "Dress.op_change") 
REG(0x9030, "Race.op_add_star") 
REG(0x9031, "Race.op_season_reward") 
REG(0x9032, "Race.op_add_segment") 
REG(0x9033, "Race.op_season_begin") 
REG(0x9034, "Race.op_season_end") 
REG(0x9040, "Battle.op_gm_gameover") 
REG(0x9050, "Gm.op_gm_level") 
REG(0x9051, "Gm.op_reset") 
REG(0x9060, "Achieve.op_update") 
REG(0x9070, "Invite.op_add") 
REG(0x9071, "Invite.op_test") 

return opcode
