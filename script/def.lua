local const = require "const"
return const {
    ZERO_POINT      = 0,    -- 零点
    PING_TIMEOUT    = 300,
    MAX_HP          = 14,
    MAX_SEGMENT     = 12,
    BATTLE_CD       = 30,
    ROBOT_UID       = 1000, -- uid小于1000为机器人
    ROOM_MAX_PLAYER = 2,    -- 房间最大人数
    RANK_MAX        = 100,

    LoginType = {
        WX              = 1,
        NORMAL          = 2,
        WX_RECONNECT    = 3,
    },

    GmLevel = {
        NONE    = 0, -- 普通玩家
        NORMAL  = 1, -- 普通GM
        DEVELOP = 2, -- 开发者
    },

    ItemType = {
        SYS     = 1, -- 系统
        DRESS   = 2, -- 时装
        BOX     = 3, -- 宝箱
    },

    ItemDef = {
        COIN    = 1001, -- 金币
        MIAODOU = 2001, -- 喵豆
    },

    BattleMode = {
        RACE    = 1, -- 排位赛
        FRIEND  = 2, -- 好友对战
    },

    BattleStatus = {
        WAITING = 1,
        READY   = 2,
        PLAYING = 3,
    },

    ChessmanType = {
        MOUSE    = 1,
        FOOTBALL = 2,
        CAT      = 3,
        DOG      = 4,
        WOLF     = 5,
        TIGER    = 6,
        ELEPHANT = 7,
    },

    DefaultDress = {
        [7]  = 8001,
        [6]  = 8002,
        [5]  = 8003,
        [4]  = 8004,
        [3]  = 8005,
        [2]  = 8006,
        [1]  = 8007,
        [-1] = 8008,
    },

    Achieve = {
        SEGMENT         = "segment",
        BATTLE_RESULT   = "battle_result",
        JOIN_COUNT      = "join_count",
        JOIN_FRIEND     = "join_friend",
        EVALUATION      = "evaluation",
        KILL_TYPE       = "kill_type",
        FOOTBALL_KILL   = "football_kill",
    },

}
