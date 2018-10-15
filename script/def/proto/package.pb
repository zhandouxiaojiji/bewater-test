
Å
count.protoCount"

c2s_data"î
s2c_data
err (Rerr9
counters (2.Count.s2c_data.CountersEntryRcounters;
CountersEntry
key (	Rkey
value (Rvalue:8"@
s2c_sync
err (Rerr
key (	Rkey
num (Rnumbproto3
§
lottery.protoLottery",
Item
sn (Rsn
count (Rcount"

c2s_open"H
s2c_open
err (Rerr*
	item_list (2.Lottery.ItemRitemListbproto3
©

race.protoRace":
Item
item_sn (RitemSn
item_num (RitemNum"

c2s_data"ñ
s2c_data
err (Rerr

has_reward (R	hasReward
segment (Rsegment
star (Rstar+
reward_list (2
.Race.ItemR
rewardList"

c2s_reward"

s2c_reward
err (Rerrbproto3
R

shop.protoShop"
c2s_buy
sn (Rsn"
s2c_buy
err (Rerrbproto3
û

user.protoUser"

c2s_data"˝
s2c_data
err (Rerr
nickname (	Rnickname
avatar (	Ravatar
level (Rlevel
exp (Rexp
coin (Rcoin
miaodou (Rmiaodou
redpack (Rredpack
segment	 (Rsegment
star
 (Rstar
uid (Ruid
acc (	Racc/
dress (2.User.s2c_data.DressEntryRdress8

DressEntry
key (Rkey
value (Rvalue:8"P
c2s_change_dress#
chessman_type (RchessmanType
item_id (RitemId"$
s2c_change_dress
err (Rerrbproto3
¢
gm.protoGm"

c2s_data"2
s2c_data
err (Rerr
level (Rlevel"
c2s_cmd
cmd (	Rcmd"-
s2c_cmd
err (Rerr
msg (	Rmsgbproto3
±
achieve.protoAchieve"/
Achieve
sn (Rsn
count (Rcount"

c2s_data"J
s2c_data
err (Rerr,
achieves (2.Achieve.AchieveRachieves"

c2s_reward
sn (Rsn"

s2c_reward
err (Rerr"H
s2c_sync
err (Rerr*
achieve (2.Achieve.AchieveRachievebproto3
´
checkin.protoCheckin"

c2s_data"O
s2c_data
err (Rerr
day (Rday
can_checkin (R
canCheckin"

c2s_reward"

s2c_reward
err (Rerrbproto3
π

rank.protoRank"ñ
Player
uid (Ruid
gender (Rgender
avatar (	Ravatar
nickname (	Rnickname
level (Rlevel
segment (Rsegment"

c2s_data"x
s2c_data
err (Rerr-
battle_list (2.Rank.PlayerR
battleList+

world_list (2.Rank.PlayerR	worldListbproto3
Ó
	bag.protoBag"¥
Item
item_id (RitemId
item_sn (RitemSn
item_num (RitemNum
create (Rcreate
expire (Rexpire
level (Rlevel
owner_id (RownerId"

c2s_data"D
s2c_data
err (Rerr&
	item_list (2	.Bag.ItemRitemList"@
s2c_sync_item
err (Rerr
item (2	.Bag.ItemRitem"<
s2c_remove_item
err (Rerr
item_id (RitemId"K
s2c_notify_item
err (Rerr&
	item_list (2	.Bag.ItemRitemListbproto3
¡
battle.protoBattle"Õ
Player
uid (Ruid
gender (Rgender
avatar (	Ravatar
nickname (	Rnickname
level (Rlevel
segment (Rsegment
idx (Ridx
status (Rstatus
hp	 (Rhp
acc
 (	Racc/
dress (2.Battle.Player.DressEntryRdress8

DressEntry
key (Rkey
value (Rvalue:8"]
Team
team_id (RteamId
mode (Rmode(
players (2.Battle.PlayerRplayers"]
Room
room_id (RroomId
mode (Rmode(
players (2.Battle.PlayerRplayers"]
Stat
join (Rjoin
win (Rwin
best (Rbest
	combo_win (RcomboWin"

c2s_info"ç
s2c_info
err (Rerr
team_id (RteamId
room_id (RroomId
	battle_id (RbattleId 
stat (2.Battle.StatRstat"
	c2s_match
mode (Rmode"
	s2c_match
err (Rerr"
c2s_cancel_match"$
s2c_cancel_match
err (Rerr"%
c2s_create_team
mode (Rmode"<
s2c_create_team
err (Rerr
team_id (RteamId"(
c2s_join_team
team_id (RteamId"!
s2c_join_team
err (Rerr"
c2s_leave_team""
s2c_leave_team
err (Rerr"%
c2s_create_room
mode (Rmode"<
s2c_create_room
err (Rerr
room_id (RroomId"(
c2s_join_room
room_id (RroomId"!
s2c_join_room
err (Rerr"
c2s_leave_room""
s2c_leave_room
err (Rerr"
c2s_room_ready""
s2c_room_ready
err (Rerr"

c2s_data"Æ
s2c_data
err (Rerr
tiles (Rtiles(
players (2.Battle.PlayerRplayers
round (Rround
side (Rside
time (Rtime
mode (Rmode"-
c2s_cmd
src (Rsrc
dst (Rdst"
s2c_cmd
err (Rerr"E
c2s_robot_cmd
uid (Ruid
src (Rsrc
dst (Rdst"!
s2c_robot_cmd
err (Rerr"

c2s_giveup"

s2c_giveup
err (Rerr"
c2s_double_reward"%
s2c_double_reward
err (Rerr"
c2s_revert_star"#
s2c_revert_star
err (Rerr"
c2s_emoticon
sn (Rsn" 
s2c_emoticon
err (Rerr"K
s2c_match_ret
err (Rerr(
players (2.Battle.PlayerRplayers"E
s2c_update_room
err (Rerr 
room (2.Battle.RoomRroom"E
s2c_update_team
err (Rerr 
team (2.Battle.TeamRteam"Ö
s2c_sync
err (Rerr
src (Rsrc
dst (Rdst
chessman_id (R
chessmanId
hp1 (Rhp1
hp2 (Rhp2"G
s2c_sync_emoticon
err (Rerr
uid (Ruid
sn (Rsn"8
s2c_battle_ready
err (Rerr
side (Rside"$
s2c_battle_start
err (Rerr"5
s2c_battle_over
err (Rerr
win (Rwinbproto3
å
invite.protoInvite"f
Player
uid (Ruid
gender (Rgender
avatar (	Ravatar
nickname (	Rnickname"

c2s_data"π
s2c_data
err (Rerr:
recieved (2.Invite.s2c_data.RecievedEntryRrecieved"
list (2.Invite.PlayerRlist;
RecievedEntry
key (Rkey
value (Rvalue:8"

c2s_reward
sn (Rsn"

s2c_reward
err (Rerrbproto3
†
login.protoLogin"π
	c2s_login
acc (	Racc

login_type (R	loginType
wx_data (	RwxData
token (	Rtoken
version (	Rversion
inviter (Rinviter
channel (	Rchannel"]
	s2c_login
err (Rerr
uid (Ruid
token (	Rtoken
openid (	Ropenid"

c2s_ping"=
s2c_ping
err (Rerr
server_time (R
serverTime"
s2c_kick
err (Rerrbproto3