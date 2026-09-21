MOD_MANAGER:AddMod(function(Api)
--金锭子弹未实现
--猪灵专属能力卡未实现



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--抉择池
Api:SetChoicePool("Steve", {
 --新增抉择



--原版基础的-----------------------------
        "Lizardberg_event_1",   --手工
        "Lizardberg_event_3",   --马保国举重
        "Lump_event_1",         --川建国卖东西
        "Lump_event_4",         --注射消毒水
        "reading",              --两个帖子出现在你面前，你看哪个？
        "test",                 --如果你是南通，你会是0，还是1？
        "rabbit_hole",          --一个黑人光头突然出现在你面前：
        "only_fans",            --你被推送了一个福利姬，长腿细腰完全长在了你的XP上，并且非常接地气（宅女，爱打游戏）你会如何做？
        "the_dress",            --这条裙子是什么颜色的？
        "brokenscreen",             --你不小心把手机摔在了地上。屏幕上出现了很多裂纹还是还能用。你会怎么做？
        "description",              --你收到了来自<color=#7fdbb6>威廉伯爵</color>的私信
        "wyr_curry",                --你会吃大便味的咖喱还是咖喱味的大便？
        "debate_slap",              --你被牛头人了，怎么办？
        "waifu",                    --你的朋友已经和你吹了很久他的新女友了。他们终于结婚了！他邀请你去他家吃晚饭。你走进门，发现他的老婆是一个全息投影的葱娘！你的反应是：
        "player_awards_interruption",   --你最近在玩一个新游戏，但是游戏不合理的数值和折磨人的玩法让你越玩越生气，你会？
        "russian_agent",            --你的钢门比较松弛，但你的痔疮弥补了这部分。你会切除痔疮吗？
        "fearful_disclose",         --你最害怕展示哪些信息给网友？
        "change_underwear",         --多久换一次内裤
        "clean_toilet",             --你家马桶多久刷一次
        "goto_god",                 --你最爱的游戏制作大师来玩键盘侠了！作为资深键盘侠你可以给他一个限制，你会？
        "weiniang",                 --喜欢伪娘是gay吗
        "what_tonight",             --今天晚上要做什么
        "breaking",                 --上次分手是谁甩的谁？
        "meeting_ex",               --约会中，偶遇前任男
        "self_feature",               --你对自己身上什么特点最满意？
        })
        local limited_character = {
        "Steve",
        }
--固定波次选择
    Api:RegisterWaveSpecialChoices("Ch_LiuLang", 8, 8, limited_character)
    Api:RegisterWaveSpecialChoices("RW_ChuJi", 3, 3, limited_character)
    Api:RegisterWaveSpecialChoices("RW_ErJi", 13, 13, limited_character)
    Api:RegisterWaveSpecialChoices("RW_SanJi", 23, 23, limited_character)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--定义全局变量
--子弹
local TAG_missile_zhizhuyan = "<size=300%><sprite name=mod_missile_zhizhuyan></size>"  --蜘蛛眼
local TAG_missile_huluobo = "<size=300%><sprite name=mod_missile_huluobo></size>"      --萝卜
local TAG_missile_tnt = "<size=300%><sprite name=mod_missile_tnt></size>"              --TNT
local TAG_missile_niurou = "<size=300%><sprite name=mod_missile_niurou></size>"        --牛肉
local TAG_missile_juanxincai = "<size=300%><sprite name=mod_missile_juanxincai></size>"--卷心菜
local TAG_missile_zhu = "<size=300%><sprite name=mod_missile_zhu></size>"--猪
--属性
local TAG_shuxing_baoshidu = "<size=200%><sprite name=mod_shuxing_baoshidu></size>"
--Relic
local TAG_relic_lieyan = "<size=200%><sprite name=mod_relic_lieyan></size>"            --烈焰粉
local TAG_relic_chushirenwu = "<size=200%><sprite name=mod_relic_chushirenwu></size>"  --初始任务
local TAG_relic_didaxiajie = "<size=200%><sprite name=mod_relic_didaxiajie></size>"    --抵达下界
local TAG_relic_zhenzhu = "<size=200%><sprite name=mod_relic_zhenzhu></size>"          --末影珍珠
local TAG_relic_undead = "<size=200%><sprite name=mod_relic_undead></size>"            --不死图腾
local TAG_relic_mingling = "<size=200%><sprite name=mod_relic_mingling></size>"        --命令方块 
local TAG_relic_dahuoshi = "<size=200%><sprite name=mod_relic_dahuoshi></size>"        --打火石
local TAG_relic_xjhj_d = "<size=200%><sprite name=mod_relic_xjhj_d></size>"            --下界合金锭
local TAG_relic_heiyaoshi = "<size=200%><sprite name=mod_relic_heiyaoshi></size>"      --黑曜石
local TAG_relic_xjhj_sp = "<size=200%><sprite name=mod_relic_xjhj_sp></size>"          --下界合金碎片
local TAG_relic_zuanshi = "<size=200%><sprite name=mod_relic_zuanshi></size>"          --钻石
local TAG_relic_mugun = "<size=200%><sprite name=mod_relic_mugun></size>"              --木棍
local TAG_relic_csm = "<size=200%><sprite name=mod_relic_csm></size>"                  --传送门
local TAG_relic_jinding = "<size=200%><sprite name=mod_relic_jinding></size>"          --金锭
local TAG_relic_end_eye = "<size=200%><sprite name=mod_relic_end_eye></size>"          --末影之眼
local TAG_relic_longdan = "<size=200%><sprite name=mod_relic_longdan></size>"          --龙蛋
--perk
local TAG_perk_mianbao = "<size=200%><sprite name=mod_perk_mianbao></size>"            --面包
local TAG_perk_shengwu = "<size=200%><sprite name=mod_perk_shengwu></size>"            --生物
local TAG_perk_hongshi = "<size=200%><sprite name=mod_perk_hongshi></size>"            --道具
local TAG_perk_shiwu = "<size=200%><sprite name=mod_perk_shiwu></size>"                --食物
local TAG_perk_wuqi = "<size=200%><sprite name=mod_perk_wuqi></size>"                  --武器
local TAG_perk_gongju = "<size=200%><sprite name=mod_perk_gongju></size>"              --工具
local TAG_perk_fajiao = "<size=200%><sprite name=mod_perk_fajiao></size>"              --发酵蛛眼
local TAG_perk_zhuluan = "<size=200%><sprite name=mod_perk_zhuluan></size>"            --蛛卵
local TAG_perk_zhuwang = "<size=200%><sprite name=mod_perk_zhuwang></size>"            --蛛网
local TAG_perk_ji = "<size=200%><sprite name=mod_perk_ji></size>"

--表情包
local TAG_tieba_xiao = "<size=200%><sprite name=tieba_xiao></size>"                    --贴吧：笑
local TAG_landou_daxiao = "<size=550%><sprite name=landou_daxiao></size>"              --大笑（蓝豆）     
local TAG_landou_jingli = "<size=400%><sprite name=landou_jingli></size>"              --敬礼（蓝豆）
local TAG_landou_xu = "<size=400%><sprite name=landou_xu></size>"                      --嘘（蓝豆）
local TAG_tieba_shengqi = "<size=200%><sprite name=tieba_shengqi></size>"              --贴吧：生气
local TAG_tieba_zhencheng = "<size=200%><sprite name=tieba_zhencheng></size>"          --贴吧：真诚
--梗图
local TAG_geng_jinzi = "<size=1500%><sprite name=geng_jinzi></size>"                   --金紫
local TAG_geng_chuanshanjia = "<size=900%><sprite name=geng_chuanshanjia></size>"      --鸡汤来喽
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --新抉择
    --初始任务
    Api:RegisterChoice({
        id = "RW_ChuJi",
        display_name = "十字路口\n".."（任务抉择）",
        image = DCEI.Texture("RW_ChuJi"),
        description = "\n你的意识诞生于一片空白，周围的泥土上印着一行白色文字：“正在创建世界”（注意：任务线一旦确定不可更改）",
        options = {
            {
                flavor = "前往下界！",
                description = "获得" .. TAG_relic_dahuoshi,
                aftermath_narrative = "\n记得带上金鞋,打火石，灵魂疾行......",
                aftermath_description = "<color=#47b05d>".."获得</color>" .. TAG_relic_dahuoshi,
                -- modify_attributes = {
                --     health_maximum = 200,
                -- },
                gain_relics = {
                    Relic_DaHuoShi = 1,
                },
            },
            {
                flavor = "前往末地!",
                description = "获得" .. TAG_relic_zhenzhu,
                aftermath_narrative = "\n你很勇吼，记得别带水桶",
                aftermath_description = "<color=#47b05d>".."获得</color>" .. TAG_relic_zhenzhu,
                -- modify_attributes = {
                --     health_maximum = -100,
                -- },
                gain_relics = {
                    Relic_ZhenZhu = 1,
                },
            },
            {
                flavor = "还是回家吧...",
                description = "获得" ..TAG_relic_mingling,
                aftermath_narrative = "\n还是家里安逸，我要养一辈子老口牙",
                aftermath_description = "<color=#47b05d>".."获得</color>" .. TAG_relic_mingling,
                gain_relics = {
                    Relic_MingLing = 1,
                },
            }
        }
    })
    --二次抉择
    Api:RegisterChoice({
        id = "RW_ErJi",
        display_name = "接下来干点什么？",
        image = DCEI.Texture("RW_ErJi"),
        description = "回家翻翻Alex留下的东西还是挖点黑曜石？实在不行下个珍妮mod玩玩吧"..TAG_tieba_xiao,
        options = {
            {
                flavor = "开采黑曜石",
                description = "获得" .. TAG_relic_heiyaoshi,
                aftermath_narrative = "下矿几分钟后，挖到了足够搭建传送门的黑曜石",
                aftermath_description = "<color=#47b05d>".."获得</color>" .. TAG_relic_heiyaoshi,
                -- modify_attributes = {
                --     health_maximum = 200,
                -- },
                requirement = {
                    relic = "Relic_DaHuoShi",
                },
                gain_relics = {
                    Relic_HeiYaoShi = 5,
                },
            },
            {
                flavor = "翻箱倒柜",
                requirement = {
                    relic = "Relic_ZhenZhu",
                },
                description = "获得" .. TAG_relic_lieyan,
                aftermath_narrative = "在Alex家里翻了一下，找到一些她去下界旅游时带回来的东西",
                aftermath_description = "<color=#47b05d>".."获得</color>" .. TAG_relic_lieyan,
                -- modify_attributes = {
                --     health_maximum = -100,
                -- },
                gain_relics = {
                    Relic_LieYanFen = 1,
                },
            },
            {
                flavor = "挖点矿",
                description = "获得" ..TAG_relic_zuanshi,
                aftermath_narrative = "挖到两颗亮晶晶的钻石，不过现在没什么用",
                aftermath_description = "<color=#47b05d>".."获得2颗</color>" .. TAG_relic_zuanshi,
                gain_relics = {
                    Relic_ZuanShi = 2,
                },
            }
        }
    })
    --终局
    Api:RegisterChoice({
        id = "RW_SanJi",
        display_name = "终局",
        image = DCEI.Texture("RW_SanJi"),
        description = "历经跋山涉水，千难万险之后，迎接你的是？",
        options = {
            {
                flavor = "迎战下界军团！",
                description = "获得" .. TAG_relic_xjhj_sp,
                aftermath_narrative = "经过一番血战（骷髅有血吗？），你战胜了下界军团，拿到了他们的宝藏",
                aftermath_description = "<color=#47b05d>".."获得</color>" .. TAG_relic_xjhj_sp,
                -- modify_attributes = {
                --     health_maximum = -100,
                -- },
                requirement = {
                    relic = "Relic_CSM",
                },
                gain_relics = {
                    Relic_XJHJ_SuiPian = 1,
                },
            },
            {
                flavor = "迎战末影龙！",
                description = "获得" .. TAG_relic_longdan,
                aftermath_narrative = "末影龙挑战指南：\n".."第一步：用弓箭射掉水晶，防止末影龙回血\n".."第二步：把床放在末影龙头前\n".."第三步：睡觉",
                aftermath_description = "<color=#47b05d>".."获得</color>" .. TAG_relic_longdan,
                -- modify_attributes = {
                --     health_maximum = 200,
                -- },
                requirement = {
                    relic = "Relic_YanJing",
                },
                gain_relics = {
                    Relic_LongDan = 1,
                },
            },
            {
                flavor = "什么千难万险？家里蹲挺舒服的"..TAG_tieba_xiao,
                description = "获得" ..TAG_relic_zuanshi,
                aftermath_narrative = "每日任务：\n  吃饭：5/3\n  上厕所：1/3\n  和异性说话：0/1\n  起飞：15/4",
                aftermath_description = "<color=#47b05d>".."获得2颗</color>" .. TAG_relic_zuanshi,
                gain_relics = {
                    Relic_ZuanShi = 2,
                },
            }
        }
    })
    --流浪商人
    Api:RegisterChoice({
        id = "Ch_LiuLang",
        display_name = "流浪的栓绳",
        image = DCEI.Texture("Ch_LiuLang"),
        description = "你在沙漠中徒步时遇到了一个流浪商人，他声称自己要去末地拿点好东西，不过现在他身上也有货物卖，你决定：",
        options = {
            {
                flavor = "说自己要去下界请求他的帮助",
                description = "获得" .. TAG_relic_jinding,
                aftermath_narrative = "他被你的无畏（nao）精神打动了，决定给你点硬通货"..TAG_landou_jingli,
                aftermath_description = "<color=#47b05d>".."获得</color>" .. TAG_relic_jinding,
                -- modify_attributes = {
                --     health_maximum = 200,
                -- },
                gain_relics = {
                    Relic_JinDing = 1,
                },
            },
            {
                flavor = "在他这儿买点东西",
                description = "获得" .. TAG_perk_mianbao,
                aftermath_narrative = "你花7个绿宝石买了一个面包"..TAG_landou_daxiao,
                aftermath_description = "<color=#47b05d>".."获得</color>" .. TAG_perk_mianbao,
                -- modify_attributes = {
                --     health_maximum = -100,
                -- },
                gain_relics = {
                    Relic_MianBao = 1,
                },
            },
            {
                flavor = "我只看到了栓绳，哪来的商人？",
                description = "获得3" ..Api.GameMechanicTags.TAG.vulnerable.."\n和300"..Api.GameMechanicTags.TAG.health.."\n与3%"..Api.GameMechanicTags.TAG.crit,
                aftermath_narrative = "栓绳没抢到，还被羊驼喷了。但同时战斗技巧也提高了，变得更皮糙肉厚"..TAG_landou_xu,
                aftermath_description = "获得3" ..Api.GameMechanicTags.TAG.vulnerable.."和300"..Api.GameMechanicTags.TAG.health.."\n与3%"..Api.GameMechanicTags.TAG.crit,
                modify_attributes = {
                    health_maximum = 300,
                    vulnerable = 3,
                    crit_chance = 0.03,
                },
            }
        }
    })
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--自定义属性
--鸡计数器
local ji_quest_max = 100
Api:RegisterAttribute({
    id = "JS_ji",
    display_name = "孵化进度",
    description = "孵化进度达到100时随机孵化一枚蛋",
    icon = DCEI.Texture("ji"),
    display_type = Api.DisplayType.Integer,
    is_neutral = true, -- if true, font color will always be white
    flavor_text = "马上要破壳喽，会是什么呢？",
    display_requirements = {
        is_hero = true, -- only show for hero
        perk = "Perk_Power_Ji", -- only show if has this perk
        default_value = 0,
        max = ji_quest_max -- for visual only, you need to keep current value <= max
    },
    })
local baoshidu_max = 200
----------------------------------------------------------------------------------------------
--饱食度
Api:RegisterAttribute({
        id = "JS_BaoShi",
        display_name = "饱食度",
        description = "你的"..TAG_perk_shiwu.."会自动填充"..TAG_shuxing_baoshidu.."。"..TAG_shuxing_baoshidu.."满后可以在战斗结束时转化为等量最大生命值。".."<color=red>".."但"..TAG_shuxing_baoshidu.."不会在每回合战斗结束时保存</color>",
        icon = DCEI.Texture("baoshidu"),
        display_type = Api.DisplayType.Integer,
        is_neutral = true, -- if true, font color will always be white
        flavor_text = "民以食为天，没了就饿死",
        display_requirements = {
            is_hero = true, -- only show for hero -- only show if has this perk
            perk = "Perk_Power_Zhu",
            default_value = 0,
            max = baoshidu_max -- for visual only, you need to keep current value <= max
        },
        })
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--新抗压神器
--初始任务
Api:RegisterRelic("Relic_RenWu", {
        id = "Relic_RenWu",
        display_name = "下界还是末地",
        description = "前往下界？还是前往末地？\n".."任务：\n获得末影珍珠（前往末地）或 获得打火石（前往下界）",
        rarity = "legendary",
        icon = DCEI.Texture("Relic_RenWu"),  
        flavor_text = "左边的末地传送门泛着幽紫的微光，听说门后是浮空的岛屿，还有那条盘踞千年的末影龙。\n右边的下界传送门燃着炽烈的橙红，那边是滚烫的岩浆海，还有成群结队的烈焰人在嘶吼。",
        }, function (combat_unit)
        local name = "Relic_RenWu"
        combat_unit:RegisterOnCombatStartCallback(name, function(level,target)
            if combat_unit:HasRelic("Relic_DaHuoShi") then
                       combat_unit:ApplyRelic("renwu_qwxj")
                       combat_unit:RemoveRelic("Relic_RenWu")
                else if combat_unit:HasRelic("Relic_ZhenZhu") then  
                               combat_unit:ApplyRelic("Relic_RenWu_QWMD")
                               combat_unit:RemoveRelic("Relic_RenWu")
                     else if combat_unit:HasRelic("Relic_MingLing") then  
                                 combat_unit:RemoveRelic("Relic_RenWu")
                            end
                     end
            end                              
        end)
        end, false)          
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
--下界线
--前往下界
Api:RegisterRelic("Relic_RenWu_QWXJ", {
        id = "Relic_RenWu_QWXJ",
        display_name = "前往下界",
        description = "<color=red>".."任务</color>".."：建造下界传送门\n".."<color=#47b05d>".."奖励</color>".."："..TAG_relic_csm,
        rarity = "legendary",
        icon = DCEI.Texture("Relic_RenWu_QWXJ"),  
        flavor_text = "想去下界？先拿到黑曜石再说吧",
        },function (combat_unit)
        local name = "Relic_RenWu_QWXJ"
        combat_unit:RegisterOnCombatStartCallback(name, function(level,target)
            if combat_unit:HasRelic("Relic_CSM") then
                    combat_unit:ApplyRelic("Relic_RenWu_DDXJ")
                    combat_unit:RemoveRelic("Relic_RenWu_QWXJ")
            end
        end)
        end, false)

--抵达下界
Api:RegisterRelic("Relic_RenWu_DDXJ", {
        id = "Relic_RenWu_DDXJ",
        display_name = "抵达下界",
        description = "<color=red>".."任务</color>".."：击败下界军团\n".."<color=#47b05d>".."奖励</color>".."："..TAG_relic_xjhj_sp,
        rarity = "legendary",
        icon = DCEI.Texture("Relic_RenWu_DDXJ"),  
        flavor_text = "终于到了,让我看看哪个猪人家里有多余残骸",
        },function (combat_unit)
        local name = "Relic_RenWu_DDXJ"
        combat_unit:RegisterOnCombatStartCallback(name, function(level,target)
            if combat_unit:HasRelic("Relic_XJHJ_Ding") then
                    combat_unit:RemoveRelic("Relic_RenWu_DDXJ")
            end
        end)
        end, false)

--打火石
Api:RegisterRelic("Relic_DaHuoShi", {
        id = "Relic_DaHuoShi",
        display_name = "Steve的打火石",
        description ="获得".."<color=#47b05d>".."2</color>"..Api.GameMechanicTags.TAG.attack..
        "<color=#47b05d>".."20</color>"..Api.GameMechanicTags.TAG.energy_regen,
        icon = DCEI.Texture("Relic_DaHuoShi"),
        rarity = "rare",
        flavor_text = "Steve祖上传下来的打火石，他留给Steve的",
        modify_attributes = {
            attack = 2,               --力量
            energy_per_second = 20,   --能量恢复
        },
        })

--黑曜石
Api:RegisterRelic("Relic_HeiYaoShi", {
        id = "Relic_HeiYaoShi",
        display_name = "黑曜石",
        description ="获得".."<color=#47b05d>".."2</color>"..Api.GameMechanicTags.TAG.armor,
        icon = DCEI.Texture("Relic_HeiYaoShi"),
        rarity = "epic",
        flavor_text = "纯度10000%主世界原产黑曜石，硬度堪比基岩，拿来搭传送门最好不过了",
        modify_attributes = {
            block = 2,                  --护甲
        },
        })

--下界合金碎片
Api:RegisterRelic("Relic_XJHJ_SuiPian", {
        id = "Relic_XJHJ_SuiPian",
        display_name = "下界合金碎片",
        description ="获得".."<color=#47b05d>".."5</color>"..Api.GameMechanicTags.TAG.armor
        .."<color=#47b05d>".."5</color>"..Api.GameMechanicTags.TAG.thorns,
        icon = DCEI.Texture("Relic_XJHJ_SuiPian"),
        rarity = "epic",
        flavor_text = "下界合金锭的前身,CP：@金锭",
        modify_attributes = {
            retaliate = 5,     
            block = 5,      --护甲
        },
        })

--金锭
Api:RegisterRelic("Relic_JinDing", {
        id = "Relic_JinDing",
        display_name = "金锭",
        description ="获得".."<color=#47b05d>".."12</color>"..Api.GameMechanicTags.TAG.income,
        icon = DCEI.Texture("Relic_JinDing"),
        rarity = "epic",
        flavor_text = "做装备秒坏，延展性极好，猪人爱不释手，其作用在现实世界更是重量级",
        modify_attributes = {
            income = 12,                  --护甲
        },
        }, function(combat_unit)
        end,true)

--下界合金锭
Api:RegisterRelic("Relic_XJHJ_Ding", {
        id = "Relic_XJHJ_Ding",
        display_name = "下界合金锭",
        description ="每暴击一次便释放一个大招,但大招伤害减少".."<color=red>".."60%</color>"
        .."\n获得".."<color=#47b05d>".."20</color>"..Api.GameMechanicTags.TAG.income.."<color=#47b05d>".."8</color>"..Api.GameMechanicTags.TAG.thorns.."<color=#47b05d>".."10</color>"..Api.GameMechanicTags.TAG.armor,
        icon = DCEI.Texture("Relic_XJHJ_Ding"),
        rarity = "legendary",
        flavor_text = "下界合金，一种稀有程度极高的合金，用下界生物的远古残骸的精华烧炼成的碎片和金锭混合后获得。真希望再找到两块，我的合金胸甲就快造好了”——探险家笔记•起源冒险",
        modify_attributes = {
            income = 20,
            retaliate = 8,     
            block = 10,                   --收入
            ultimate_damage = -0.6
        },
        },function(combat_unit)
        local name = "Relic_XJHJ_Ding"
        combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, caster, target)
        if combat_unit.Attack:IsAttackCritical(caster) then
            combat_unit.Attack:NewUltimateAttack(target, true)
            combat_unit.run_instance:ModifySavedPerkDataAttributes("health_maximum", 20)
            combat_unit.run_instance:ModifySavedPerkDataAttributes("block", 3)
        end
        end)
        end,false)

--下界传送门         --随机数方法在这里
Api:RegisterRelic("Relic_CSM", {
        id = "Relic_CSM",
        display_name = "下界传送门",
        description ="战斗开始时从下界随机召唤1~3只僵尸猪人协助你作战，获得".."<color=#47b05d>".."5</color>"..Api.GameMechanicTags.TAG.armor.."<color=#47b05d>".."3</color>"..Api.GameMechanicTags.TAG.attack..
        "<color=#47b05d>".."25</color>"..Api.GameMechanicTags.TAG.energy_regen,
        icon = DCEI.Texture("Relic_CSM"),
        rarity = "combo",
        flavor_text = "传送门,每个故事都少不了它，下界合金套，烈焰粉，还有主世界的恶魂与猪人都归功于它",
        modify_attributes = {
            block = 5,
            attack = 3,               
            energy_per_second = 25,                  
        } 
        },function(combat_unit)
        local name = "Relic_CSM"
        combat_unit:RegisterOnCombatStartCallback(name, function (level, target)
            local randoms = math.random(1,3)
            level = randoms
            for i=1,level do   --level是重复执行的次数
                combat_unit.Attack:AddEmojiToDeck("Missile_JSZR", 1)
                combat_unit:PlayAwardEmojiAnimation("Missile_JSZR", 1)
            end
        end)
        end,false)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--末地线
--前往末地
Api:RegisterRelic("Relic_RenWu_QWMD", {
        id = "Relic_RenWu_QWMD",
        display_name = "前往末地",
        description = "<color=red>".."任务</color>".."：合成末影之眼\n".."<color=#47b05d>".."奖励</color>".."："..TAG_relic_end_eye,
        rarity = "legendary",
        icon = DCEI.Texture("Relic_RenWu_QWMD"),  
        flavor_text = "想去末地？先拿到烈焰粉再说吧",
        },function (combat_unit)
        local name = "Relic_RenWu_QWMD"
        combat_unit:RegisterOnCombatStartCallback(name, function(level,target)
            if combat_unit:HasRelic("Relic_YanJing") then
                    combat_unit:ApplyRelic("Relic_RenWu_DDMD")
                    combat_unit:RemoveRelic("Relic_RenWu_QWMD")
            end
        end)
        end, false)

--抵达末地
Api:RegisterRelic("Relic_RenWu_DDMD", {
        id = "Relic_RenWu_DDMD",
        display_name = "抵达末地",
        description = "<color=red>".."任务</color>".."：迎战末影龙\n".."<color=#47b05d>".."奖励</color>".."："..TAG_relic_longdan,
        rarity = "legendary",
        icon = DCEI.Texture("Relic_RenWu_DDMD"),  
        flavor_text = "想去末地？先拿到烈焰粉再说吧",
        },function (combat_unit)
        local name = "Relic_RenWu_DDMD"
        combat_unit:RegisterOnCombatStartCallback(name, function(level,target)
            if combat_unit:HasRelic("Relic_LongDan") then
                    combat_unit:RemoveRelic("Relic_RenWu_DDMD")
            end
        end)
        end, false)

-- 烈焰粉
Api:RegisterRelic("Relic_LieYanFen", {
        id = "Relic_LieYanFen",
        display_name = "ALEX的烈焰粉",
        description ="获得".."<color=#47b05d>".."3</color>"..Api.GameMechanicTags.TAG.attack,
        icon = DCEI.Texture("Relic_LieYanFen"),
        rarity = "rare",
        flavor_text = "烈焰人的“精华”",
        modify_attributes = {
            attack = 3,    --力量
        },
        })

--末影珍珠
Api:RegisterRelic("Relic_ZhenZhu", {
        id = "Relic_ZhenZhu",
        display_name = "末影珍珠",
        description ="获得".."<color=#47b05d>".."8%</color>"..Api.GameMechanicTags.TAG.dodge_chance,
        icon = DCEI.Texture("Relic_ZhenZhu"),
        rarity = "rare",
        flavor_text = "打龙前一颗一颗刷，打完龙一箱一箱扔",
        modify_attributes = {
            dodge_chance = 0.08,    --闪避
        },
        })

--末影之眼
Api:RegisterRelic("Relic_YanJing", {
        id = "Relic_YanJing",
        display_name = "末影之眼",
        description ="获得"..TAG_relic_end_eye.."和"
        .."<color=#47b05d>".."10%</color>"..Api.GameMechanicTags.TAG.dodge_chance
        .."<color=#47b05d>".."5</color>"..Api.GameMechanicTags.TAG.attack
        .."<color=#47b05d>".."5%</color>"..Api.GameMechanicTags.TAG.crit,
        icon = DCEI.Texture("Relic_YanJing"),
        rarity = "combo",
        flavor_text = "孤将指引你的方向，保护你不收侵扰，前往终末之地",
        modify_attributes = {
            dodge_chance = 0.1,    --闪避
            attack = 5,
            crit_chance = 0.05,
        },
        }, function(combat_unit)
        local name = "Relic_YanJing"
        combat_unit:RegisterOnCombatStartCallback(name, function(level,target)
            if combat_unit.run_instance.wave == 13 then
                --添加子弹--战斗结束后不保留
                combat_unit.Attack:AddEmojiToDeck("endeye", 1)
                --播放添加子弹的动画
                combat_unit:PlayAwardEmojiAnimation("endeye", 1)
                --获取弹夹里子弹数量--临时添加的子弹也算在里面
                local deck_size = #combat_unit.Attack:GetEmojiDeck()
                --战斗结束后永久添加子弹(deck_size差不多就是弹夹里最后一个子弹的位置,之前超过这个数会卡死,要用这个的话得注意下顺序
                combat_unit.run_instance:ModifySavedPerkDataEmojis("endeye", deck_size)
            end    
        end)
        end)

--龙蛋
Api:RegisterRelic("Relic_LongDan", {   
        id = "Relic_LongDan",
        display_name = "龙蛋",
        description ="获得".."<color=#47b05d>".."10%</color>"..Api.GameMechanicTags.TAG.dodge_chance.."在你受到伤害时，有25%恢复等量生命值",
        icon = DCEI.Texture("Relic_LongDan"),
        rarity = "legendary",
        flavor_text = "打龙前一颗一颗刷，打完龙一箱一箱扔",
        modify_attributes = {
            dodge_chance = 0.1,    --闪避
        },
        },function(combat_unit)
        local name = "Relic_LongDan"
        combat_unit:RegisterOnDamageTakenCallback(name, function(level,damage_amount,caster)
        local randoms = math.random(0,1)
        if randoms  < 0.25 then
            combat_unit:ModifyAttribute("health", damage_amount, false)
        end
        end)
        end)







----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--普通遗物
--命令方块
Api:RegisterRelic("Relic_MingLing", {
        id = "Relic_MingLing",
        display_name = "万能命令方块",
        description = "<color=#FFD700>".."1.</color>".."战斗结束后".."提高".."<color=#47b05d>".."1</color>".."点"..Api.GameMechanicTags.TAG.health..Api.GameMechanicTags.TAG.energy_regen
        ..Api.GameMechanicTags.TAG.attack..Api.GameMechanicTags.TAG.thorns..Api.GameMechanicTags.TAG.health_regen..Api.GameMechanicTags.TAG.ultimate_damage..Api.GameMechanicTags.TAG.income
        .."<color=#FFD700>".."\n2.</color>".."增加".."<color=#47b05d>".."1%</color>"..Api.GameMechanicTags.TAG.attack_speed..Api.GameMechanicTags.TAG.crit..Api.GameMechanicTags.TAG.thorn_block
        ..Api.GameMechanicTags.TAG.luck,
        flavor_text = "我说白了，这不是开挂吗？！",
        icon = DCEI.Texture("Relic_MingLing"),
        rarity = "legendary",
        }, function(combat_unit)
        local name = "Relic_MingLing"
        combat_unit:RegisterOnCombatEndCallback(name, function (level, target)
            for i = 1, level do
                combat_unit.run_instance:ModifySavedPerkDataAttributes("health_maximum", 1)
                combat_unit.run_instance:ModifySavedPerkDataAttributes("energy_per_second", 1)
                combat_unit.run_instance:ModifySavedPerkDataAttributes("attack", 1)
                combat_unit.run_instance:ModifySavedPerkDataAttributes("attack_speed", 0.01)
                combat_unit.run_instance:ModifySavedPerkDataAttributes("ultimate_damage", 0.01)
                combat_unit.run_instance:ModifySavedPerkDataAttributes("crit_chance", 0.01)
                combat_unit.run_instance:ModifySavedPerkDataAttributes("retaliate", 1)
                combat_unit.run_instance:ModifySavedPerkDataAttributes("health_per_second", 1)
                combat_unit.run_instance:ModifySavedPerkDataAttributes("thorn_block", 0.01)
                combat_unit.run_instance:ModifySavedPerkDataAttributes("luck", 0.01)
                combat_unit.run_instance:ModifySavedPerkDataAttributes("block", 1)
                combat_unit.run_instance:ModifySavedPerkDataAttributes("income", 1)
            end
        end)
        end)

-- 不死图腾
Api:RegisterRelic("Relic_BuSiTuTeng", {
        id = "Relic_BuSiTuTeng",
        display_name = "不死图腾",
        flavor_text = "感谢唤魔者开源",
        description = "当你生命值小于".."<color=red>".."500</color>".."时".."立刻获得".."<color=#47b05d>".."500</color>"
        ..Api.GameMechanicTags.TAG.health.."<color=#47b05d>".."200</color>"..Api.GameMechanicTags.TAG.health_regen.."和".."<color=#47b05d>".."300</color>"..Api.GameMechanicTags.TAG.energy_regen
        .."持续".."<color=red>".."</color>".."5秒",
        icon = DCEI.Texture("Relic_BuSiTuTeng"),
        rarity = "legendary",
        behavior = {
            description = "不死图腾",
            buff_bar_icon = DCEI.Texture("Relic_BuSiTuTeng"),
            is_positive = true,
            modify_attributes = {
                health_maximum = 500,
                health_per_second = 200,
                energy_per_second = 300,
            },
            duration = 5,
        },
        }, function(combat_unit)
        local name = "Relic_BuSiTuTeng"
        local jishu = 0
        combat_unit.Attack:RegisterOnMissileHitCallback(name, function(level,attack_data,caster,target)
            if jishu == 0 then
			    if combat_unit:GetCurrentHealth() < 500 then
                    for i = 1, level do
                        Api.PerkBehaviorSystem:ApplyPerkBehaviorToSelf(target,name)
                        jishu = jishu + 1
                    end
		        end
            end
        end)
        end)
--钻石
Api:RegisterRelic("Relic_ZuanShi", {
        id = "Relic_ZuanShi",
        display_name = "钻石",
        description ="暂时没什么用，可以拿来做钻石剑",
        icon = DCEI.Texture("Relic_ZuanShi"),
        rarity = "epic",
        flavor_text = "哇，有钻石啊",
        }, function(combat_unit)
        end,true)
--木棍
Api:RegisterRelic("Relic_MuGun", {
        id = "Relic_MuGun",
        display_name = "木棍",
        description ="暂时没什么用，可以拿来做钻石剑",
        icon = DCEI.Texture("Relic_MuGun"),
        rarity = "common",
        flavor_text = "普通的不能再普通的木棍，还有个亲戚，好像叫什么电棍",
        }, function(combat_unit)
        end,true)

--钻石剑
Api:RegisterRelic("Relic_ZuanShiJian", {
        id = "Relic_ZuanShiJian",
        display_name = "钻石剑",
        description ="战斗开始时获得一把钻石剑",
        icon = DCEI.Texture("zsj"),
        rarity = "legendary",
        flavor_text = "曾经原版最强的王者，MC最著名的标志物之一，可以排到夯",

        }, function(combat_unit)
        local name = "Relic_ZuanShiJian"
        combat_unit:RegisterOnCombatStartCallback(name, function(level,target)
                for i = 1, level do
                --添加子弹--战斗结束后不保留
                combat_unit.Attack:AddEmojiToDeck("zsj", 1)
                --播放添加子弹的动画
                combat_unit:PlayAwardEmojiAnimation("zsj", 1)
                end
        end)
        end,false)

--面包
Api:RegisterRelic("Relic_MianBao", {
    id = "Relic_MianBao",
    display_name = "面包",
    description ="获得".."<color=#47b05d>".."1</color>"..TAG_perk_mianbao,
    icon = DCEI.Texture("mianbao"),
    rarity = "common",
    flavor_text = "经济实惠，好吃不贵，既能防身，又能回蓝",
    modify_attributes = {
        income = 0,                  --护甲
    },
    behavior = {
        description = "能量恢复",
        buff_bar_icon = DCEI.Texture("mianbao"),
        modify_attributes = {
            health_per_second = 0,
              },
        is_positive = true,
        duration = 999,
        },
    }, function(combat_unit)
    local name = "Relic_MianBao"
    combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, criminal, victim)
        if attack_data.missile_id == "mianbao" then
            for i = 1, level do
                Api.PerkBehaviorSystem:ApplyPerkBehaviorToSelf(criminal, name)
            end
        end
    end)
    combat_unit:RegisterOnCombatStartCallback(name, function(level,target)
        if combat_unit.run_instance.wave == 8 then
            --添加子弹--战斗结束后不保留
            combat_unit.Attack:AddEmojiToDeck("mianbao", 1)
            --播放添加子弹的动画
            combat_unit:PlayAwardEmojiAnimation("mianbao", 1)
            --获取弹夹里子弹数量--临时添加的子弹也算在里面
            local deck_size = #combat_unit.Attack:GetEmojiDeck()
            --战斗结束后永久添加子弹(deck_size差不多就是弹夹里最后一个子弹的位置,之前超过这个数会卡死,要用这个的话得注意下顺序
            combat_unit.run_instance:ModifySavedPerkDataEmojis("mianbao", deck_size)
        end    
    end)
    end)

--AI代码生成测试
-- 饥饿的蜘蛛
Api:RegisterRelic("jidezhizhu", {
    id = "jidezhizhu",
    display_name = "饥饿的蜘蛛",
    description = "当" .. TAG_missile_zhizhuyan .. "命中敌人时，添加一个" .. TAG_perk_mianbao .. "到弹匣中",
    flavor_text = "这只蜘蛛似乎对小麦情有独钟，也许它想做个面包？",
    icon = DCEI.Texture("jidezhizhu"), -- 请确保您的资源文件夹中有名为 jidezhizhu 的图片
    rarity = "rare", -- 稀有度设为稀有
    }, function(combat_unit)
    local name = "jidezhizhu"
    -- 注册命中回调函数
    combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, caster, target)
        -- 检查命中的子弹ID是否为"zhizhuyan"
        if attack_data.missile_id == "Missile_ZhuYan" then
            -- 循环处理等级（虽然这个遗物通常只有1级，但为了兼容性保留循环）
            for i = 1, level do
                -- 向弹匣中添加一个"mianbao"子弹
                combat_unit.Attack:AddEmojiToDeck("mianbao", 1)
                -- 播放获得子弹的动画
                combat_unit:PlayAwardEmojiAnimation("mianbao", 1)
            end
        end
    end)
    end, false)



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--新能力
--母体链接
Api:RegisterPerk("Perk_MuTi", {
        id = "Perk_MuTi",
        display_name = "母体链接",
        description = "蜘蛛眼命中敌人时有".."<color=#47b05d>".."25%</color>".."几率发射一个蛛网", 
        flavor_text = "节肢动物，小子",
        icon = DCEI.Texture("Perk_MuTi"),
        perk_type = "perk",
        rarity = "rare",
        behavior = {
            description = "黏住了(降低攻击速度)",
            buff_bar_icon = DCEI.Texture("Perk_MuTi"),
            modify_attributes = {
                attack_speed = -0.01,
                  },
            duration = 999,
            },
        }, function(combat_unit)
            local name = "Perk_MuTi"
            combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, criminal, victim)
                local random = math.random(0,1)
                if random <= 0.25 then   
                if attack_data.missile_id == "Missile_ZhuYan" then
                    for i = 1, level do
                        combat_unit.Attack:NewMissileAttack(victim, "zhuwang")
                        Api.PerkBehaviorSystem:ApplyPerkBehaviorToSelf(victim, name)
                    end
                end
            end
            end)
        end)

--孕育蛛卵
Api:RegisterPerk("Perk_ZhuLuan", {
        id = "Perk_ZhuLuan",
        display_name = "孕育蛛卵",
        description = "弹匣中每有一个蜘蛛眼，战斗开始时便获得".."<color=#47b05d>".."10</color>"..Api.GameMechanicTags.TAG.health_regen, 
        flavor_text = "你什么时候知道自己是时候搬家了？\n".."蛛卵破裂的那一刻...",
        icon = DCEI.Texture("Perk_ZhuLuan"),
        perk_type = "perk",
        rarity = "epic",
        }, function(combat_unit)
            local name = "Perk_ZhuLuan"
            combat_unit:RegisterOnCombatStartCallback(name, function (level, target)
                local emoji_deck = combat_unit.Attack:GetEmojiDeck()
                for k, v in pairs(emoji_deck) do
                    if v.emoji_id == "Missile_ZhuYan" then
                        combat_unit:ModifyAttribute("health_per_second", 10, false)
                    end
                end
            end)
        end)
        
--女巫赐福
Api:RegisterPerk("Perk_NuWu", {
        id = "Perk_NuWu",
        display_name = "女巫赐福",
        description = "蜘蛛眼每命中一次，则战斗结束后给予双倍的"..Api.GameMechanicTags.TAG.health,
        flavor_text = "哼哼~哼哼蛤·哼！",
        icon = DCEI.Texture("Perk_NuWu"),
        perk_type = "perk",
        rarity = "epic",
        }, function (combat_unit)
        local name = "Perk_NuWu"
        combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, caster, target)
            if attack_data.missile_id == "Missile_ZhuYan" then
                for i = 1,level do
                     combat_unit.run_instance:ModifySavedPerkDataAttributes("health_maximum", 2)
                end
            end
        end)
        end)

--发酵蛛眼
Api:RegisterPerk("Perk_FaJiao", {
        id = "Perk_FaJiao",
        display_name = "发酵蛛眼",
        description = "蜘蛛眼命中敌人时还会降低敌人1"..Api.GameMechanicTags.TAG.health_regen, 
        flavor_text = "这东西...真的能吃吗？！",
        icon = DCEI.Texture("fajiaozhuyan"),
        perk_type = "perk",
        rarity = "legendary",
        behavior = {
            description = "生命吸取",
            buff_bar_icon = DCEI.Texture("fajiaozhuyan"),
            modify_attributes = {
                health_per_second = -1,
                  },
            duration = 999,
            },
        }, function(combat_unit)
            local name = "Perk_FaJiao"
            combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, criminal, victim)
                if attack_data.missile_id == "Missile_ZhuYan" then
                    for i = 1, level do
                        Api.PerkBehaviorSystem:ApplyPerkBehaviorToSelf(victim, name)
                    end
                end
            end)
        end)

--急迫Ⅰ    
Api:RegisterPerk("Perk_JiPo1", {
        id = "Perk_JiPo1",
        display_name = "急迫Ⅰ",
        description = "获得".."<color=#47b05d>".."10%</color>"..Api.GameMechanicTags.TAG.attack_speed.."并且在战斗结束后".."获得".."<color=#47b05d>".."1</color>"..Api.GameMechanicTags.TAG.armor,     --护甲
        flavor_text = "安全第一",
        icon = DCEI.Texture("Perk_JiPo"),
        perk_type = "perk",
        rarity = "rare",
        modify_attributes = {
            attack_speed = 0.1,
        },
        }, function(combat_unit)
            local name = "Perk_JiPo1"
            combat_unit:RegisterOnCombatEndCallback(name, function (level, target)
                combat_unit.run_instance:ModifySavedPerkDataAttributes("block", 1*level)
            end)
        end)

--急迫Ⅱ
Api:RegisterPerk("Perk_JiPo2", {
        id = "Perk_JiPo2",
        display_name = "急迫Ⅱ",
        description = "获得".."<color=#47b05d>".."15%</color>"..Api.GameMechanicTags.TAG.attack_speed.."并且在战斗结束后".."获得".."<color=#47b05d>".."3</color>"..Api.GameMechanicTags.TAG.income,     --收入
        flavor_text = "经济第一",
        icon = DCEI.Texture("Perk_JiPo"),
        perk_type = "perk",
        rarity = "epic",
        modify_attributes = {
            attack_speed = 0.15,
        },
        }, function(combat_unit)
            local name = "Perk_JiPo2"
            combat_unit:RegisterOnCombatEndCallback(name, function (level, target)
                combat_unit.run_instance:ModifySavedPerkDataAttributes("income", 3*level)
            end)
        end)

--急迫Ⅲ
Api:RegisterPerk("Perk_JiPo3", {
        id = "Perk_JiPo3",
        display_name = "急迫Ⅲ ",
        description = "获得".."<color=#47b05d>".."25%</color>"
        ..Api.GameMechanicTags.TAG.attack_speed.."并且在战斗结束后"
        .."获得".."<color=#47b05d>".."5%</color>"..Api.GameMechanicTags.TAG.luck,     --幸运
        flavor_text = "我听见了【强运】的回响！",
        icon = DCEI.Texture("Perk_JiPo"),
        perk_type = "perk",
        rarity = "legendary",
        modify_attributes = {
            attack_speed = 0.25,
        },
        }, function(combat_unit)
            local name = "Perk_JiPo3"
            combat_unit:RegisterOnCombatEndCallback(name, function (level, target)
                combat_unit.run_instance:ModifySavedPerkDataAttributes("luck", 0.05*level)
            end)
        end)
    
--黑龙口水
Api:RegisterPerk("Perk_KoShui", {
        id = "Perk_KoShui",
        display_name = "黑龙口水",
        description = "战斗开始时龙息还会对敌人".."造成".."<color=#47b05d>".."1000%</color>"..Api.GameMechanicTags.TAG.attack.."伤害", 
        flavor_text = "紫色洗澡水罢了",
        icon = DCEI.Texture("longshou"),
        perk_type = "perk",
        rarity = "epic",
        }, function(combat_unit)
            local name = "Perk_KoShui"
            combat_unit:RegisterOnCombatStartCallback(name, function (level, target)
                local emoji_deck = combat_unit.Attack:GetEmojiDeck()
                for k, v in pairs(emoji_deck) do
                    if v.emoji_id == "Missile_LongXi" then
                       damage_1 = combat_unit:GetBoundedAttribute("attack")*10
                       target:Damage(damage_1,target, {})
                    end
                end
            end)
        end)

--河豚
Api:RegisterPerk("Perk_HeTun", {
        id = "Perk_HeTun",
        display_name = "河豚",
        description = "战斗开始时对自身".."造成".."<color=red>".."250</color>".."伤害获得".."<color=#47b05d>".."40</color>"..Api.GameMechanicTags.TAG.health_regen, 
        flavor_text = "据其味，真是消得一死",
        icon = DCEI.Texture("Perk_HeTun"),
        perk_type = "perk",
        rarity = "rare",
        }, function(combat_unit)
            local name = "Perk_HeTun"
            combat_unit:RegisterOnCombatStartCallback(name, function (level, target)
                for i = 1,level do
                    combat_unit:ModifyAttribute("health_per_second", 40, false)
                    combat_unit:Damage(250, target,{})
                end
            end)
        end)

--幸运方块
Api:RegisterPerk("Perk_XingYun", {
        id = "Perk_XingYun",
        display_name = "幸运方块",
        description = "战斗结束后随机获得属性加成，属性为:\n"
        .."获得".."<color=#47b05d>".."5</color>"..Api.GameMechanicTags.TAG.armor..","      --护甲
        .."获得".."<color=#47b05d>".."10%</color>"..Api.GameMechanicTags.TAG.dodge_chance..","--闪避
        .."减少".."<color=red>".."200</color>"..Api.GameMechanicTags.TAG.current_health..","--生命值
        .."获得".."<color=#47b05d>".."20</color>"..Api.GameMechanicTags.TAG.health_regen..","   --hp恢复
        .."获得".."<color=#47b05d>".."8</color>"..Api.GameMechanicTags.TAG.thorns,     --反伤
        flavor_text = "风险对撞，高风险，高回报",
        icon = DCEI.Texture("Perk_XingYun"),
        perk_type = "perk",
        rarity = "legendary",
        }, function(combat_unit)
            local name = "Perk_XingYun"
            combat_unit:RegisterOnCombatEndCallback(name, function (level, target)
                for i = 1, level do
                    local attribute_random = math.random(1, 5)
                    if attribute_random <= 1 then
                        combat_unit.run_instance:ModifySavedPerkDataAttributes("block", 5)
                    elseif attribute_random == 2 then
                        combat_unit.run_instance:ModifySavedPerkDataAttributes("health_maximum", -200)
                    elseif attribute_random == 3 then
                        combat_unit.run_instance:ModifySavedPerkDataAttributes("health_per_second", 20)
                    elseif attribute_random == 4 then
                        combat_unit.run_instance:ModifySavedPerkDataAttributes("dodge_chance", 0.1)
                    else 
                        combat_unit.run_instance:ModifySavedPerkDataAttributes("retaliate", 8)
                    end    
                end

            end)
        end)

--荆棘
Api:RegisterPerk("Perk_JingJi", {
        id = "Perk_JingJi",
        display_name = "荆棘",
        description = "获得".."<color=#47b05d>".."5</color>"..Api.GameMechanicTags.TAG.thorns, 
        flavor_text = "你打我噻",
        icon = DCEI.Texture("fumoshu"),
        perk_type = "perk",
        rarity = "common",
        flavor_text = "从仙人掌那进的货",
        modify_attributes = {
            retaliate = 5,
        }
        })

--汉堡
Api:RegisterPerk("Perk_HanBao", {
            id = "Perk_HanBao",
            display_name = "汉堡包",
            description = "获得"..TAG_perk_mianbao..TAG_missile_juanxincai..TAG_missile_niurou.."\n造成1伤害，命中时获得".."<color=#47b05d>".."5</color>"..Api.GameMechanicTags.TAG.energy_regen,
            icon = DCEI.Texture("hanbao"),
            perk_type = "missile",
            rarity = "legendary",
            flavor_text = "老八秘制小憨堡，既好吃，又管饱儿，奥利给，干了嗷兄弟们",
            attacks = {
            juanxincai = 1,
            niurou = 1,
            mianbao = 1,
            },
            }) 
--农夫帽
Api:RegisterPerk("Perk_NongFu", {
        id = "Perk_NongFu",
        display_name = "农夫帽",
        description = "你的"..TAG_perk_shiwu.."额外造成".."<color=#47b05d>".."10%</color>".."的"..Api.GameMechanicTags.TAG.energy_regen.."伤害 "
        .."同时再给予".."<color=#47b05d>".."1</color>"..Api.GameMechanicTags.TAG.energy_regen, 
        flavor_text = "节肢动物，小子",
        icon = DCEI.Texture("Perk_NongFu"),
        perk_type = "perk",
        rarity = "rare",
        behavior = {
            description = "缓慢回蓝",
            buff_bar_icon = DCEI.Texture("Perk_NongFu"),
            modify_attributes = {
                energy_per_second = 1,
                  },
            duration = 999,
            is_positive = true,
            },
        }, function(combat_unit)
            local name = "Perk_NongFu"
            combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, criminal, victim)
            if  attack_data.missile_id == "Missile_ZhuYan" or attack_data.missile_id == "mianbao" or
                attack_data.missile_id == "niurou" or attack_data.missile_id == "juanxincai" or 
                attack_data.missile_id == "luobo" or attack_data.missile_id == "tudou" or
                attack_data.missile_id == "furou" then
                         damage = combat_unit:GetBoundedAttribute("energy_per_second")*0.1
                         victim:Damage(damage,victim, {})
                         Api.PerkBehaviorSystem:ApplyPerkBehaviorToSelf(criminal, name)   
            end
            end)
        end)
--牧羊杖
Api:RegisterPerk("Perk_MuYang", {
            id = "Perk_MuYang",
            display_name = "牧羊杖",
            description = "你的"..TAG_perk_shengwu.."命中时消耗一点饱食度造成额外".."<color=#47b05d>".."50%</color>".."伤害和".."<color=#47b05d>".."1</color>".."点回血", 
            flavor_text = "其实流浪商人很久以前靠牧羊为生，直到一场天灾，把他的羊全变成了熟羊排",
            icon = DCEI.Texture("Perk_MuYang"),
            perk_type = "perk",
            rarity = "rare",
            behavior = {
                description = "畜牧业",
                buff_bar_icon = DCEI.Texture("Perk_MuYang"),
                modify_attributes = {
                    health_per_second = 1,
                      },
                duration = 999,
                is_positive = true,
                },
            }, function(combat_unit)
                local name = "Perk_MuYang"
                combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, criminal, victim)
                if  attack_data.missile_id == "zhu" or attack_data.missile_id == "Missile_JSZR" or
                    attack_data.missile_id == "haigui" or attack_data.missile_id == "haitun" or 
                    attack_data.missile_id == "diaoling" or attack_data.missile_id == "tudou" or
                    attack_data.missile_id == "zhu" then
                        if attack_data.missile_id == "zhu" then
                            for i = 1, level do
                            combat_unit:ModifyAttribute("JS_BaoShi", -1, false)
                            damage = 5
                            victim:Damage(damage,victim, {})
                            Api.PerkBehaviorSystem:ApplyPerkBehaviorToSelf(criminal, name)
                            end  
                        elseif attack_data.missile_id == "Missile_JSZR" then
                            for i = 1, level do
                                combat_unit:ModifyAttribute("JS_BaoShi", -1, false)
                                damage = 30
                                victim:Damage(damage,victim, {})
                                Api.PerkBehaviorSystem:ApplyPerkBehaviorToSelf(criminal, name)
                            end   
                        elseif  attack_data.missile_id == "haigui" then 
                            for i = 1, level do
                                combat_unit:ModifyAttribute("JS_BaoShi", -1, false)
                                damage = 15
                                victim:Damage(damage,victim, {})
                                Api.PerkBehaviorSystem:ApplyPerkBehaviorToSelf(criminal, name)
                            end 
                        elseif  attack_data.missile_id == "haitun" then  
                            for i = 1, level do
                                combat_unit:ModifyAttribute("JS_BaoShi", -1, false)
                                damage = 20
                                victim:Damage(damage,victim, {})
                                Api.PerkBehaviorSystem:ApplyPerkBehaviorToSelf(criminal, name)
                            end
                        elseif  attack_data.missile_id == "diaoling" then  
                            for i = 1, level do
                                combat_unit:ModifyAttribute("JS_BaoShi", -1, false)
                                damage = 60
                                victim:Damage(damage,victim, {})
                                Api.PerkBehaviorSystem:ApplyPerkBehaviorToSelf(criminal, name)
                            end
                        end    

                end
                end)
            end)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--弹药补充包
--蜘蛛眼补充包
Api:RegisterPerk("Perk_Power_ZhuYan", {
        id = "Perk_Power_ZhuYan",
        display_name = "蛛眼乱炖",
        description = "获得"..TAG_missile_zhizhuyan.."\n".."命中时造成".."<color=#47b05d>".."60%</color>"..Api.GameMechanicTags.TAG.health_regen.."伤害,同时提供".."<color=#47b05d>".."1</color>"..Api.GameMechanicTags.TAG.health_regen,
        icon = DCEI.Texture("Missile_ZhuYan"),
        perk_type = "missile",
        rarity = "common",
        attacks = {
            Missile_ZhuYan = 1,
            },
        behavior = {
            description = "生命恢复",
            buff_bar_icon = DCEI.Texture("Missile_ZhuYan"),
            modify_attributes = {
                health_per_second = 0,
                  },
            duration = 999,
            is_positive = true,
            },
            }, function(combat_unit)
            local name = "Perk_Power_ZhuYan"
            combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, criminal, victim)
                if attack_data.missile_id == "Missile_ZhuYan" then
                        Api.PerkBehaviorSystem:ApplyPerkBehaviorToSelf(criminal, name)
                end
            end)
            end)
--龙息补充包
Api:RegisterPerk("Perk_Power_LongXi", {
        id = "Perk_Power_LongXi",
        display_name = "瓶装龙息",
        description = "获得一瓶龙息",
        icon = DCEI.Texture("long_xi"),
        perk_type = "missile",
        rarity = "legendary",
        flavor_text = "流浪商人拿手灌的",
        attacks = {
            Missile_LongXi = 1,
            },
        })
--TNT补充包
Api:RegisterPerk("Perk_Power_TNT", {
        id = "Perk_Power_TNT",
        display_name = "捆装炸药",
        description = "获得"..TAG_missile_tnt.."\n造成".."<color=#47b05d>".."120%</color>".."力量伤害",
        icon = DCEI.Texture("Missile_TNT"),
        perk_type = "missile",
        rarity = "epic",
        flavor_text = "可以开始做天基炮了",
        attacks = {
            Missile_TNT = 1,
        },
        }) 
--面包补充包
Api:RegisterPerk("Perk_Power_MianBao", {
        id = "Perk_Power_MianBao",
        display_name = "全麦面包",
        description = "获得"..TAG_perk_mianbao.."\n".."造成1伤害，命中时获得".."<color=#47b05d>".."5</color>"..Api.GameMechanicTags.TAG.energy_regen,
        icon = DCEI.Texture("mianbao"),
        perk_type = "perk",
        rarity = "common",
        flavor_text = "经济实惠，好吃不贵，既能防身，又能回蓝", 
        attacks = {
            mianbao = 1,
            }, 
        behavior = {
        description = "能量恢复",
        buff_bar_icon = DCEI.Texture("mianbao"),
        modify_attributes = {
            health_per_second = 0,
              },
        duration = 999,
        is_positive = true,
        },
        }, function(combat_unit)
        local name = "Perk_Power_MianBao"
        combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, criminal, victim)
            if attack_data.missile_id == "mianbao" then
                for i = 1, level do
                    Api.PerkBehaviorSystem:ApplyPerkBehaviorToSelf(criminal, name)
                end
            end
        end)
        end)
--鸡补充包
Api:RegisterPerk("Perk_Power_Ji", {
        id = "Perk_Power_Ji",
        display_name = "下蛋公鸡",
        description = "获得"..TAG_perk_ji.."\n".."不造成伤害，但是会孵蛋",
        icon = DCEI.Texture("ji"),
        perk_type = "missile",
        rarity = "epic",
        flavor_text = "下蛋公鸡，公鸡中的战斗鸡，欧耶", 
        attacks = {
            ji = 1,
            }, 
        behavior = {
        description = "能量恢复",
        buff_bar_icon = DCEI.Texture("ji"),
        modify_attributes = {

              },
        duration = 999,
        is_positive = true,
        },
        -------------------------------------以下为具体功能实现
        },function (combat_unit)
        local name = "Perk_Power_Ji"
        combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, caster, target)
        local old_jishu = caster:GetBoundedAttribute("JS_ji")
        local new_jishu = 0
        if  attack_data.missile_id == "Missile_ZhuYan" or attack_data.missile_id == "mianbao" or
            attack_data.missile_id == "niurou" or attack_data.missile_id == "juanxincai" or 
            attack_data.missile_id == "luobo" or attack_data.missile_id == "tudou" or
            attack_data.missile_id == "furou" then
                new_jishu = old_jishu + 1 
                caster:ModifyAttribute("JS_ji", new_jishu - old_jishu) 
                caster.run_instance:SetSavedPerkDataAttributes("JS_ji", new_jishu)     
        end

        if  old_jishu == ji_quest_max then 
            caster:ModifyAttribute("JS_ji",0 - old_jishu)
            local randoms = math.random(1,3)
            local deck_size = #combat_unit.Attack:GetEmojiDeck()
            if randoms == 1 then 
            combat_unit.Attack:AddEmojiToDeck("zhu", 1)
            combat_unit:PlayAwardEmojiAnimation("zhu", 1)
            combat_unit.run_instance:ModifySavedPerkDataEmojis("zhu", deck_size)
            elseif randoms == 2 then 
                combat_unit.Attack:AddEmojiToDeck("diaoling", 1)
                combat_unit:PlayAwardEmojiAnimation("diaoling", 1)
                local deck_size = #combat_unit.Attack:GetEmojiDeck()
                combat_unit.run_instance:ModifySavedPerkDataEmojis("diaoling", deck_size)
            elseif randoms == 3 then
                combat_unit.Attack:AddEmojiToDeck("haitun", 1)
                combat_unit:PlayAwardEmojiAnimation("haitun", 1)
                local deck_size = #combat_unit.Attack:GetEmojiDeck()
                combat_unit.run_instance:ModifySavedPerkDataEmojis("haitun", deck_size) 
            end   
        end     
        end)
        end)
--猪补充包
Api:RegisterPerk("Perk_Power_Zhu", {
        id = "Perk_Power_Zhu",
        display_name = "小猪乔治",
        description = "获得"..TAG_missile_zhu.."\n在你的"..TAG_shuxing_baoshidu.."满后在战斗结束时永久获得等量"..Api.GameMechanicTags.TAG.health.."。".."<color=#47b05d>".."在战斗结束后保留你的饱食度</color>",
        icon = DCEI.Texture("zhu"),
        perk_type = "missile",
        rarity = "epic",
        flavor_text = "你知道吗，猪曾经被训练来玩电子游戏".."\n".." {====="..TAG_perk_shengwu.."=====}",
        attacks = {
            zhu = 1,
            }, 
        behavior = {
        description = "能量恢复",
        buff_bar_icon = DCEI.Texture("zhu"),
        modify_attributes = {
            health_per_second = 0,
              },
        duration = 999,
        is_positive = true,
        },
        -------------------------------------以下为具体功能实现
        },function (combat_unit)
        local name = "Perk_Power_Zhu"
        combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, caster, target)
        local old_jishu = caster:GetBoundedAttribute("JS_BaoShi")
        local new_jishu = 0
        if  attack_data.missile_id == "Missile_ZhuYan" or attack_data.missile_id == "mianbao" or
            attack_data.missile_id == "niurou" or attack_data.missile_id == "juanxincai" or 
            attack_data.missile_id == "luobo" or attack_data.missile_id == "tudou" or
            attack_data.missile_id == "furou" then
                new_jishu = old_jishu + 1 
                caster:ModifyAttribute("JS_BaoShi", new_jishu - old_jishu) 
                caster.run_instance:SetSavedPerkDataAttributes("JS_BaoShi", new_jishu)     
        end

        if  old_jishu >= baoshidu_max then 
            caster:ModifyAttribute("JS_BaoShi",0 - old_jishu)
            for i=1,level do
                combat_unit.run_instance:ModifySavedPerkDataAttributes("health_maximum", 200)
            end    
        end
        
        if attack_data.missile_id == "zhu" then
            local randoms = math.random(1,2)
            if randoms == 1 then
                for i = 1, level do
                     combat_unit.Attack:NewMissileAttack(target, "luobo")
                end     
            elseif randoms == 2 then
                for i = 1, level do
                     combat_unit.Attack:NewMissileAttack(target, "Missile_TNT")
                end     
            end 
        end   
        end)
        end)    
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--新子弹
--蜘蛛眼
Api:RegisterMissile("Missile_ZhuYan", {
        id = "Missile_ZhuYan",
        display_name = "蜘蛛眼",
        tip = "命中时给造成60%"..Api.GameMechanicTags.TAG.health_regen.."伤害,同时提供".."<color=#47b05d>".."1</color>"..Api.GameMechanicTags.TAG.health_regen,
        flavor_text = "蛛蛛副产品，垃圾，炼金材料，弹药".."\n".." {========"..TAG_relic_zuanshi..TAG_perk_shiwu.."========}",
        icon = DCEI.Texture("Missile_ZhuYan"),
        missile = DCEI.SimpleUnit("COMBAT Missile Zhi_Zhu"),
        sounds = {
            DCEI.Sound("zhizhu")
        },
        damage = function(attack_data, caster)
           return 0.6 * caster:GetBoundedAttribute("health_per_second")
        end
        },
        function (combat_unit)
        local name = "Missile_ZhuYan"
        combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, caster, target)
            if attack_data.missile_id == "Missile_ZhuYan" then
               combat_unit:ModifyAttribute("health_per_second", 1, false)
               combat_unit:ModifyAttribute("JS_BaoShi", 1, false)
            end
        end)
        end)

--龙息
Api:RegisterMissile("Missile_LongXi", {
		id = "Missile_LongXi",
		display_name = "龙息",
        tip = "不会从弹夹发射，每秒对对手造成等同于25%" .. Api.GameMechanicTags.TAG.ultimate_damage.."的伤害",
        flavor_text = "其实是流浪商人拿手灌的".."\n".." {========="..TAG_relic_zuanshi.."=========}",
		icon = DCEI.Texture("Missile_LongXi"),
		missile = DCEI.SimpleUnit("COMBAT Missile Long Xi"),
		--sounds = {
		--	DCEI.Sound("q")
		--},
	    damage = function(attack_data, caster)
           b=0
           c=0
           b=b+100+1 * caster:GetBoundedAttribute("attack")
           c=c+1 * caster:GetBoundedAttribute("ultimate_damage")
           a=b * c
        return a           
        end
	    })

--TNT
Api:RegisterMissile("Missile_TNT", {
        id = "Missile_TNT",
        display_name = "TNT",
        tip = "造成".."<color=#47b05d>".."120%</color>"..Api.GameMechanicTags.TAG.attack.."伤害",
        flavor_text = "TNT能够解决许多问题，但不是所有".."\n".." {========="..TAG_perk_hongshi.."=========}",
        icon = DCEI.Texture("Missile_TNT"),
        missile = DCEI.SimpleUnit("COMBAT Missile Tnts"),
        sounds = {
            DCEI.Sound("tnt")
        },
        damage = function(attack_data, caster)
            return 1.2 * caster:GetBoundedAttribute("attack")
        end
        })
    
--僵尸猪人
Api:RegisterMissile("Missile_JSZR", {
        id = "Missile_JSZR",
        display_name = "僵尸猪人",
        tip = "造成60点固定伤害",
        flavor_text = "哼哼，哼哼哼？哼哼哼，哼！".."\n".." {========="..TAG_perk_shengwu.."=========}",
        icon = DCEI.Texture("Missile_JSZR"),
        missile = DCEI.SimpleUnit("COMBAT Missile Jiang_Zhuren"),
        sounds = {
            DCEI.Sound("jiangshi")
        },
        damage = function(attack_data, caster)
            return 60
            end
        })

--面包
Api:RegisterMissile("mianbao", {
        id = "mianbao",
        display_name = "面包",
        tip = "造成1伤害，命中时获得".."<color=#47b05d>".."5</color>"..Api.GameMechanicTags.TAG.energy_regen,
        flavor_text = "来自法国的面包，既能恢复能量，还能攻击".."\n".." {========="..TAG_perk_shiwu.."=========}",
        icon = DCEI.Texture("mianbao"),
        missile = DCEI.SimpleUnit("COMBAT Missile Mian_Bao"),
        sounds = {
            DCEI.Sound("chidongxi")
        },
        damage = function(attack_data, caster)
            return 1
         end
        },function (combat_unit)
        local name = "mianbao"
        combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, caster, target)
            if attack_data.missile_id == "mianbao" then
               combat_unit:ModifyAttribute("energy_per_second", 5, false)
               combat_unit:ModifyAttribute("JS_BaoShi", 1, false)
            end
        end)
        end)
--牛肉
Api:RegisterMissile("niurou", {
            id = "niurou",
            display_name = "牛肉饼",
            tip = "造成1伤害，命中时获得".."<color=#47b05d>".."5</color>"..Api.GameMechanicTags.TAG.energy_regen,
            flavor_text = "新鲜的不能再新鲜了，仿佛还在跳动！".."\n".." {========="..TAG_perk_shiwu.."=========}",
            icon = DCEI.Texture("niurou"),
            missile = DCEI.SimpleUnit("COMBAT Missile Niurou"),
            sounds = {
                DCEI.Sound("chidongxi")
            },
            damage = function(attack_data, caster)
                return 1
             end
            },function (combat_unit)
            local name = "niurou"
            combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, caster, target)
                if attack_data.missile_id == "niurou" then
                   combat_unit:ModifyAttribute("energy_per_second", 5, false)
                   combat_unit:ModifyAttribute("JS_BaoShi", 1, false)
                end
            end)
            end)
--卷心菜
Api:RegisterMissile("juanxincai", {
                id = "juanxincai",
                display_name = "卷心菜",
                tip = "造成1伤害，命中时获得".."<color=#47b05d>".."5</color>"..Api.GameMechanicTags.TAG.energy_regen,
                flavor_text = "卷心菜投手用卷心菜砸僵尸干得很好，它以此赚钱，毕竟，它擅长这个。只是首先他不明白僵尸们是怎么爬上屋顶的。".."\n".." {========="..TAG_perk_shiwu.."=========}",
                icon = DCEI.Texture("juanxincai"),
                missile = DCEI.SimpleUnit("COMBAT Missile Juanxincai"),
                sounds = {
                    DCEI.Sound("chidongxi")
                },
                damage = function(attack_data, caster)
                    return 1
                 end
                },function (combat_unit)
                local name = "juanxincai"
                combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, caster, target)
                    if attack_data.missile_id == "juanxincai" then
                       combat_unit:ModifyAttribute("energy_per_second", 5, false)
                       combat_unit:ModifyAttribute("JS_BaoShi", 1, false)
                    end
                end)
                end)

--钻石剑
Api:RegisterMissile("zsj", {
        id = "zsj",
        display_name = "钻石剑",
        tip = "造成你所有属性之和的伤害".."\n".." {========="..TAG_perk_wuqi.."=========}",
        flavor_text = "吃我一记跳劈",
        icon = DCEI.Texture("zsj"),
        missile = DCEI.SimpleUnit("COMBAT Missile Zuan_Shijian"),
        sounds = {
            DCEI.Sound("jiangshi")
        },
        damage = function(attack_data, caster)
            local amount = 0
            amount = caster:GetBoundedAttribute("attack") + caster:GetBoundedAttribute("income")
             + caster:GetBoundedAttribute("health_per_second") + caster:GetBoundedAttribute("energy_per_second")
             + caster:GetBoundedAttribute("block")
             + caster:GetBoundedAttribute("retaliate")
            return amount
            end
        })

--蛛网
Api:RegisterMissile("zhuwang", {
        id = "zhuwang",
        display_name = "蛛网",
        tip = "造成30%"..Api.GameMechanicTags.TAG.health_regen.."伤害",
        flavor_text = "好黏啊，有剑就好了".."\n".." {========="..TAG_perk_hongshi.."=========}",
        icon = DCEI.Texture("zhuwang"),
        missile = DCEI.SimpleUnit("COMBAT Missile Zhu_Wang"),
        sounds = {
            DCEI.Sound("jiangshi")
        },
        damage = function(attack_data, caster)
            return 0.3 * caster:GetBoundedAttribute("health_per_second")
         end
        })

--末影之眼
Api:RegisterMissile("endeye", {
        id = "endeye",
        display_name = "末影之眼",
        tip = "造成300倍"..Api.GameMechanicTags.TAG.dodge_chance.."的伤害，每三次命中在本场对战中获得1%闪避",
        flavor_text = "孤将指引你的方向，保护你不收侵扰，前往终末之地".."\n".." {========="..TAG_perk_hongshi.."=========}",
        icon = DCEI.Texture("endeye"),
        missile = DCEI.SimpleUnit("COMBAT Missile End_Eye"),
        sounds = {
            DCEI.Sound("jiangshi")
        },
        damage = function(attack_data, caster)
            return 300 * caster:GetBoundedAttribute("dodge_chance")
            end
        },function (combat_unit)
        local name = "endeye"
        local jishu = 1
        combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, caster, target)
            if attack_data.missile_id == "endeye" then
                if jishu == 3 then
                    for i = 1,level do
                        combat_unit:ModifyAttribute("dodge_chance", 0.01, false)
                        jishu = 1
                    end
                else jishu = jishu + 1
                end    
            end
            end)
            end)
--鸡
Api:RegisterMissile("ji", {
		id = "ji",
		display_name = "鸡",
        tip = "不造成伤害,你的"..TAG_perk_shiwu.."每命中敌人100次，随机孵化一枚蛋（不可叠加）",
        flavor_text = "咯咯咯咯，还想要金蛋，咯咯咯".."\n".." {========="..TAG_perk_shengwu.."=========}",
		icon = DCEI.Texture("ji"),
		missile = DCEI.SimpleUnit("COMBAT Missile Ji"),
		--sounds = {
		--	DCEI.Sound("q")
		--},
	    damage = function(attack_data, caster)
            return 0         
        end
	    })
--猪
Api:RegisterMissile("zhu", {
        id = "zhu",
        display_name = "猪",
        tip = "造成10点伤害，命中敌人时随机发射一个"..TAG_missile_tnt
        .."或"..TAG_missile_huluobo,
        flavor_text = "“我表哥会大爆炸”，乔治一边啃着胡萝卜一边说着".."\n".." {========="..TAG_perk_shengwu.."=========}",
        icon = DCEI.Texture("zhu"),
        missile = DCEI.SimpleUnit("COMBAT Missile Zhu"),
        sounds = {
            DCEI.Sound("jiangshi")
        },
        damage = function(attack_data, caster)
            return 10
        end     
        },function (combat_unit)
        local name = "zhu"
        combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, caster, target)
        
            end)
        end)
--海龟
Api:RegisterMissile("haigui", {
    id = "haigui",
    display_name = "海龟",
    tip = "造成30点伤害，命中敌人时获得".."<color=#47b05d>".."1</color>"..Api.GameMechanicTags.TAG.armor.."减少".."<color=red>".."5</color>"..Api.GameMechanicTags.TAG.energy_regen.."与".."<color=red>".."1</color>"..Api.GameMechanicTags.TAG.attack,
    flavor_text = "“我表哥会大爆炸”，乔治一边啃着胡萝卜一边说着".."\n".." {========="..TAG_perk_shengwu.."=========}",
    icon = DCEI.Texture("haigui"),
    missile = DCEI.SimpleUnit("COMBAT Missile Hai_Gui"),
    sounds = {
        DCEI.Sound("jiangshi")
    },
    damage = function(attack_data, caster)
        return 30
    end     
    },function (combat_unit)
    local name = "haigui"
    combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, caster, target)
        if attack_data.missile_id == "haigui" then
            combat_unit:ModifyAttribute("block", 1, false)
            combat_unit:ModifyAttribute("energy_per_second", -5, false)
            combat_unit:ModifyAttribute("attack", -1, false)
        end   
        end)
    end)
--海豚
Api:RegisterMissile("haitun", {
        id = "haitun",
        display_name = "海豚",
        tip = "造成40点伤害，命中敌人时会窃取敌人".."<color=#47b05d>".."1%</color>"..Api.GameMechanicTags.TAG.luck,
        flavor_text = "幸运小偷".."\n".." {========="..TAG_perk_shengwu.."=========}",
        icon = DCEI.Texture("haitun"),
        missile = DCEI.SimpleUnit("COMBAT Missile Hai_Tun"),
        sounds = {
            DCEI.Sound("jiangshi")
        }, 
        damage = function(attack_data, caster)
            return 40
        end  
        },function (combat_unit)
            local name = "haitun"
            combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, caster, target)
                local target = combat_unit:GetMainOpponent()
                if attack_data.missile_id == "haitun" then
                    target:ModifyAttribute("luck",-0.01,false)
                    combat_unit:ModifyAttribute("luck",0.01,false)
                end   
                end)
            end)
--凋零骷髅
Api:RegisterMissile("diaoling", {
    id = "diaoling",
    display_name = "凋零骷髅",
    tip = "造成120点固定伤害",
    flavor_text = "力大砖飞".."\n".." {========="..TAG_perk_shengwu.."=========}",
    icon = DCEI.Texture("diaoling"),
    missile = DCEI.SimpleUnit("COMBAT Missile Diao_Ling"),
    sounds = {
        DCEI.Sound("diaoling")
    }, 
    damage = function(attack_data, caster)
        return 120
    end  
    })
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Boss
--僵尸
Api:RegisterBoss({
    id = "my_boss_zombie",
    display_name = "僵尸",
    unit = DCEI.Unit("COMBAT Unit Boss Zombie"),
    icon = DCEI.Texture("boss_zombie_small"),
    icon_high_resolution = DCEI.Texture("boss_zombie_big"),
    cosmetic_data = {
        ultimate_id = "BosUnlFu",
    },
    attributes = {
        health_maximum = 3500,
        attack = 35,
        energy_maximum = 2000,
        energy_per_second = 200,
    },
    perks = {
        boss_furou = 2,
        shinaozhe = 1,
        boss_tudou = 2,
        boss_luobo = 2,
        boss_tieding = 2,
    },
    lines = {
        battle_start = {
            {
                "你有多的帽子吗？",
                "太阳晒得我脑子痒",
            }
        },
        on_start = {
            {
                "哦呜啊~",
                "腐肉吃不吃",
            }
        },
        on_ultimate = {
            {
                "跳劈！",
                "吃我一击吧",
            }
        },
        on_win = {
            {
                "铁套都没有",
                "拿什么赢我？",
            }
        },
        on_lose = {
            {
                "走了，去南方",
                "等会找人弄你",
            }
        },
    }
})
--苦力怕
Api:RegisterBoss({
    id = "my_boss_kulipa",
    display_name = "苦力怕",
    unit = DCEI.Unit("COMBAT Unit Boss Kulipa"),
    icon = DCEI.Texture("boss_kulipa_small"),
    icon_high_resolution = DCEI.Texture("boss_kulipa_big"),
    cosmetic_data = {
        ultimate_id = "BosUnlKu",
    },
    attributes = {
        health_maximum = 4500,
        attack = 30,
        energy_maximum = 1000,
        energy_per_second = 200,
        ultimate_damage = 0.4,
    },
    perks = {
        boss_changpian = 1,
        huoyaohexin = 1,
        Perk_Power_TNT = 6,
        emergency_dodge = 5
    },
    lines = {
        battle_start = {
            {
                "嘶嘶嘶~ 蹦！",
            }
        },
        on_start = {
            {
                "没猫我吊你啊",
                "来来来，敢不敢贴脸打我",
            }
        },
        on_ultimate = {
            {
                "四个尖儿，炸弹",
                "老家中东的，跟你开玩笑呢",
            }
        },
        on_win = {
            {
                "有点菜了说实话",
                "不如小白一根",
            }
        },
        on_lose = {
            {
                "奶奶滴，跟我玩阴的是吧",
                TAG_geng_chuanshanjia,
            }
        },
    }
})
--猪灵
Api:RegisterBoss({
    id = "my_boss_zhuling",
    display_name = "猪灵",
    unit = DCEI.Unit("COMBAT Unit Boss Zhuling"),
    icon = DCEI.Texture("boss_zhuling_small"),
    icon_high_resolution = DCEI.Texture("boss_zhuling_big"),
    cosmetic_data = {
        ultimate_id = "BosUnlJin",
    },
    attributes = {
        health_maximum = 3500,
        attack = 35,
        energy_maximum = 2000,
        energy_per_second = 200,
    },
    perks = {
        taojin = 1,
        boss_tieding = 1,
        boss_tudou = 2,
        boss_luobo = 2,
        boss_tieding = 2,
        boss_shazi = 1,
    },
    lines = {
        battle_start = {
            {
                "哼哼哼~",
                "哈哈，百分之百伪黄金",
            }
        },
        on_start = {
            {
                TAG_geng_jinzi,
            }
        },
        on_ultimate = {
            {
                "偷我金子什么意思"..TAG_tieba_shengqi,
                "金粒也别想顺走！",
            }
        },
        on_win = {
            {
                "金子，下界合金都是我的",
                "哈哈哈哈",
            }
        },
        on_lose = {
            {
                "投夅瀭①柈",
                "唫ふ给沵，芐鎅匼唫能芣能畱芐"..TAG_tieba_zhencheng,
            }
        },
    }
})
--烈焰人
Api:RegisterBoss({
    id = "my_boss_lieyanren",
    display_name = "烈焰人",
    unit = DCEI.Unit("COMBAT Unit Boss Lieyanren"),
    icon = DCEI.Texture("boss_lieyanren_small"),
    icon_high_resolution = DCEI.Texture("boss_lieyanren_big"),
    cosmetic_data = {
        ultimate_id = "BosUnlLie",
    },
    attributes = {
        health_maximum = 3500,
        attack = 35,
        energy_maximum = 2000,
        energy_per_second = 200,
    },
    perks = {
        boss_furou = 2,
        shinaozhe = 1,
        boss_tudou = 2,
        boss_luobo = 2,
        boss_tieding = 2,
    },
    lines = {
        battle_start = {
            {
                "你有多的帽子吗？",
                "太阳晒得我脑子痒",
            }
        },
        on_start = {
            {
                "哦呜啊~",
                "腐肉吃不吃",
            }
        },
        on_ultimate = {
            {
                "跳劈！",
                "吃我一击吧",
            }
        },
        on_win = {
            {
                "铁套都没有",
                "拿什么赢我？",
            }
        },
        on_lose = {
            {
                "走了，去南方",
                "等会找人弄你",
            }
        },
    }
})
--末影人
Api:RegisterBoss({
    id = "my_boss_moyingren",
    display_name = "末影人",
    unit = DCEI.Unit("COMBAT Unit Boss Moyingren"),
    icon = DCEI.Texture("boss_moyingren_small"),
    icon_high_resolution = DCEI.Texture("boss_moyingren_big"),
    cosmetic_data = {
        ultimate_id = "BosUnlZhenZhu",
    },
    attributes = {
        health_maximum = 3500,
        attack = 35,
        energy_maximum = 2000,
        energy_per_second = 200,
    },
    perks = {
        boss_furou = 2,
        shinaozhe = 1,
        boss_tudou = 2,
        boss_luobo = 2,
        boss_tieding = 2,
    },
    lines = {
        battle_start = {
            {
                "你有多的帽子吗？",
                "太阳晒得我脑子痒",
            }
        },
        on_start = {
            {
                "哦呜啊~",
                "腐肉吃不吃",
            }
        },
        on_ultimate = {
            {
                "跳劈！",
                "吃我一击吧",
            }
        },
        on_win = {
            {
                "铁套都没有",
                "拿什么赢我？",
            }
        },
        on_lose = {
            {
                "走了，去南方",
                "等会找人弄你",
            }
        },
    }
})
--末影龙
Api:RegisterBoss({
    id = "my_boss_moyinglong",
    display_name = "末影龙",
    unit = DCEI.Unit("COMBAT Unit Boss Moyinglong"),
    icon = DCEI.Texture("boss_moyinglong_small"),
    icon_high_resolution = DCEI.Texture("boss_moyinglong_big"),
    cosmetic_data = {
        ultimate_id = "BosUnlLongXi",
    },
    attributes = {
        health_maximum = 300000,
        attack = 35,
        energy_maximum = 2000,
        energy_per_second = 200,
    },
    perks = {
        boss_furou = 2,
        shinaozhe = 1,
        boss_tudou = 2,
        boss_luobo = 2,
        boss_tieding = 2,
    },
    lines = {
        battle_start = {
            {
                "你有多的帽子吗？",
                "太阳晒得我脑子痒",
            }
        },
        on_start = {
            {
                "哦呜啊~",
                "腐肉吃不吃",
            }
        },
        on_ultimate = {
            {
                "跳劈！",
                "吃我一击吧",
            }
        },
        on_win = {
            {
                "铁套都没有",
                "拿什么赢我？",
            }
        },
        on_lose = {
            {
                "走了，去南方",
                "等会找人弄你",
            }
        },
    }
})

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
--Boss子弹
--僵尸
--胡萝卜
Api:RegisterPerk("boss_luobo", {
    id = "boss_luobo",
    display_name = "胡萝卜",
    description = "获得一个萝卜",
    icon = DCEI.Texture("luobo"),
    perk_type = "perk",
    rarity = "common",
    flavor_text = "临走时僵尸妈妈塞进背包的胡萝卜".."\n".." {========="..TAG_perk_shiwu.."=========}", 
    attacks = {
        luobo = 1,
        }, 
    behavior = {
    description = "能量恢复",
    buff_bar_icon = DCEI.Texture("luobo"),
    modify_attributes = {
        health_per_second = 0,
          },
    duration = 999,
    is_positive = true,
    },
    }, function(combat_unit)
    local name = "boss_luobo"
    combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, criminal, victim)
        if attack_data.missile_id == "luobo" then
            for i = 1, level do
                Api.PerkBehaviorSystem:ApplyPerkBehaviorToSelf(criminal, name)
                combat_unit:ModifyAttribute("JS_BaoShi", 1, false)
            end
        end
    end)
    end)
----------------------------------------------------
Api:RegisterMissile("luobo", {
    id = "luobo",
    display_name = "胡萝卜",
    tip = "造成1伤害，命中时获得".."<color=#47b05d>".."5</color>"..Api.GameMechanicTags.TAG.energy_regen,
    flavor_text = "临走时僵尸妈妈塞进背包的土豆",
    icon = DCEI.Texture("luobo"),
    missile = DCEI.SimpleUnit("COMBAT Missile LuoBo"),
    sounds = {
        DCEI.Sound("chidongxi")
    },
    damage = function(attack_data, caster)
        return 1
     end
    },function (combat_unit)
    local name = "luobo"
    combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, caster, target)
        if attack_data.missile_id == "luobo" then
           combat_unit:ModifyAttribute("energy_per_second", 5, false)
        end
    end)
    end)
--马铃薯
Api:RegisterPerk("boss_tudou", {
    id = "boss_tudou",
    display_name = "马铃薯",
    description = "获得一个土豆",
    icon = DCEI.Texture("tudou"),
    perk_type = "perk",
    rarity = "common",
    flavor_text = "临走时僵尸妈妈塞进背包的土豆".."\n".." {========="..TAG_perk_shiwu.."=========}", 
    attacks = {
        tudou = 1,
        }, 
    behavior = {
    description = "能量恢复",
    buff_bar_icon = DCEI.Texture("tudou"),
    modify_attributes = {
        health_per_second = 0,
          },
    duration = 999,
    is_positive = true,
    },
    }, function(combat_unit)
    local name = "boss_tudou"
    combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, criminal, victim)
        if attack_data.missile_id == "tudou" then
            for i = 1, level do
                Api.PerkBehaviorSystem:ApplyPerkBehaviorToSelf(criminal, name)
                combat_unit:ModifyAttribute("JS_BaoShi", 1, false)
            end
        end
    end)
    end)
----------------------------------------------------
Api:RegisterMissile("tudou", {
    id = "tudou",
    display_name = "马铃薯",
    tip = "造成1伤害，命中时获得".."<color=#47b05d>".."5</color>"..Api.GameMechanicTags.TAG.energy_regen,
    flavor_text = "临走时僵尸妈妈塞进背包的土豆",
    icon = DCEI.Texture("tudou"),
    missile = DCEI.SimpleUnit("COMBAT Missile TuDou"),
    sounds = {
        DCEI.Sound("chidongxi")
    },
    damage = function(attack_data, caster)
        return 1
     end
    },function (combat_unit)
    local name = "tudou"
    combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, caster, target)
        if attack_data.missile_id == "tudou" then
           combat_unit:ModifyAttribute("energy_per_second", 5, false)
        end
    end)
    end)
--腐肉
Api:RegisterPerk("boss_furou", {
    id = "boss_furou",
    display_name = "腐肉",
    description = "获得一个腐肉",
    icon = DCEI.Texture("furou"),
    perk_type = "perk",
    rarity = "common",
    flavor_text = "辣条无需多言".."\n".." {========="..TAG_perk_shiwu.."=========}", 
    attacks = {
        furou = 1,
        }, 
    behavior = {
    description = "能量降低",
    buff_bar_icon = DCEI.Texture("furou"),
    modify_attributes = {
        energy_per_second = -5,
          },
    duration = 5,
    is_positive = false,
    },
    }, function(combat_unit)
    local name = "boss_furou"
    combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, criminal, victim)
        if attack_data.missile_id == "furou" then
            for i = 1, level do
                Api.PerkBehaviorSystem:ApplyPerkBehaviorToSelf(victim, name)
                combat_unit:ModifyAttribute("JS_BaoShi", 1, false)
            end
        end
    end)
    end)
----------------------------------------------------
Api:RegisterMissile("furou", {
    id = "furou",
    display_name = "腐肉",
    tip = "造成3%"..Api.GameMechanicTags.TAG.max_energy.."的伤害，同时降低对手5"..Api.GameMechanicTags.TAG.energy_regen.."持续5秒",
    flavor_text = "辣条吃不吃",
    icon = DCEI.Texture("furou"),
    missile = DCEI.SimpleUnit("COMBAT Missile FuRou"),
    sounds = {
        DCEI.Sound("chidongxi")
    },
    damage = function(attack_data, caster)
        return 0.03*caster:GetBoundedAttribute("energy_maximum")
     end
    },function (combat_unit)
    local name = "furou"
    combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, caster, target)
        if attack_data.missile_id == "furou" then
           combat_unit:ModifyAttribute("energy_per_second", 0, false)
        end
    end)
    end)
--铁锭
Api:RegisterPerk("boss_tieding", {
    id = "boss_tieding",
    display_name = "一个铁锭",
    description = "获得一个铁锭",
    icon = DCEI.Texture("tieding"),
    perk_type = "perk",
    rarity = "common",
    flavor_text = "僵尸生前就带在身上的，不知道他以前是干什么的".."\n".." {========="..TAG_relic_zuanshi.."=========}", 
    attacks = {
        tieding = 1,
        }, 
    behavior = {
    description = "叠甲",
    buff_bar_icon = DCEI.Texture("tieding"),
    modify_attributes = {
        health_per_second = 0,
          },
    duration = 999,
    is_positive = true,
    },
    }, function(combat_unit)
    local name = "boss_tieding"
    combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, criminal, victim)
        if attack_data.missile_id == "tieding" then
            for i = 1, level do
             Api.PerkBehaviorSystem:ApplyPerkBehaviorToSelf(criminal, name)
            end
        end
    end)
    end)
----------------------------------------------------
Api:RegisterMissile("tieding", {
    id = "tieding",
    display_name = "铁锭",
    tip = "造成双倍等同于"..Api.GameMechanicTags.TAG.armor.."的伤害".."每10次命中获得1"..Api.GameMechanicTags.TAG.armor,
    flavor_text = "不知道从哪里捡来的铁锭，好像已经保存在僵尸身上很久了",
    icon = DCEI.Texture("tieding"),
    missile = DCEI.SimpleUnit("COMBAT Missile TieDing"),
    sounds = {
        DCEI.Sound("chidongxi")
    },
    damage = function(attack_data, caster)
        return 2*caster:GetBoundedAttribute("block")
     end
    },function (combat_unit)
    local name = "tieding"
    local jishu = 0
    combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, caster, target)
        if attack_data.missile_id == "tieding" then
            if jishu == 10 then
                 for i = 1, level do
                     combat_unit:ModifyAttribute("block", 1, false)
                     jishu = 0
                 end
            else jishu = jishu + 1 
            end
        end
    end)
    end)
--唱片
Api:RegisterPerk("boss_changpian", {
    id = "boss_changpian",
    display_name = "一个铁锭",
    description = "获得一个铁锭",
    icon = DCEI.Texture("changpian"),
    perk_type = "perk",
    rarity = "epic",
    flavor_text = "僵尸生前就带在身上的，不知道他以前是干什么的".."\n".." {========="..TAG_relic_zuanshi.."=========}", 
    attacks = {
        changpian = 1,
        }, 
    })
----------------------------------------------------
Api:RegisterMissile("changpian", {
    id = "changpian",
    display_name = "铁锭",
    tip = "造成50%的"..Api.GameMechanicTags.TAG.energy_regen.."命中时发射两个音符",
    flavor_text = "罕见的唱片，在骷髅和苦力怕内讧时更易掉落",
    icon = DCEI.Texture("changpian"),
    missile = DCEI.SimpleUnit("COMBAT Missile ChangPian"),
    sounds = {
        DCEI.Sound("chidongxi")
    },
    damage = function(attack_data, caster)
        return 0.5*caster:GetBoundedAttribute("energy_per_second")
    end
    },function (combat_unit)
    local name = "changpian"
    combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, caster, target)
            if attack_data.missile_id == "changpian" then
                 for i = 1, level do
                    combat_unit.Attack:NewMissileAttack(target, "attack_music_note")
                    combat_unit.Attack:NewMissileAttack(target, "attack_music_note")
                 end 
            end
    end)
    end)
--沙子
Api:RegisterPerk("boss_shazi", {
    id = "boss_shazi",
    display_name = "一个沙子",
    description = "获得一个沙子",
    icon = DCEI.Texture("shazi"),
    perk_type = "perk",
    rarity = "epic",
    flavor_text = "僵尸生前就带在身上的，不知道他以前是干什么的".."\n".." {========="..TAG_relic_zuanshi.."=========}", 
    attacks = {
        shazi = 1,
        }, 
    })
--------------------------------------------------------
Api:RegisterMissile("shazi", {
    id = "shazi",
    display_name = "沙子",
    tip = "造成50%的"..Api.GameMechanicTags.TAG.energy_regen.."命中时发射两个音符",
    flavor_text = "罕见的唱片，在骷髅和苦力怕内讧时更易掉落",
    icon = DCEI.Texture("shazi"),
    missile = DCEI.SimpleUnit("COMBAT Missile ShaZi"),
    sounds = {
        DCEI.Sound("chidongxi")
    },
    damage = function(attack_data, caster)
        return 0.5*caster:GetBoundedAttribute("energy_per_second")
    end
    },function (combat_unit)
    local name = "shazi"
    combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, caster, target)
            if attack_data.missile_id == "shazi" then
                 for i = 1, level do
                    combat_unit.Attack:NewMissileAttack(target, "keyi_shazi")
                    combat_unit.Attack:NewMissileAttack(target, "keyi_shazi")
                 end 
            end
    end)
    end)
----------------------------------------------------------
Api:RegisterMissile("keyi_shazi", {
    id = "keyi_shazi",
    display_name = "铁锭",
    tip = "造成50%的"..Api.GameMechanicTags.TAG.energy_regen.."命中时发射两个音符",
    flavor_text = "罕见的唱片，在骷髅和苦力怕内讧时更易掉落",
    icon = DCEI.Texture("ky_shazi"),
    missile = DCEI.SimpleUnit("COMBAT Missile KY_ShaZi"),
    sounds = {
        DCEI.Sound("chidongxi")
    },
    damage = function(attack_data, caster)
        return 10
    end
    })
--金粒
Api:RegisterPerk("boss_jinding", {
    id = "boss_jinding",
    display_name = "一个沙子",
    description = "获得一个沙子",
    icon = DCEI.Texture("missile_jinding"),
    perk_type = "perk",
    rarity = "epic",
    flavor_text = "僵尸生前就带在身上的，不知道他以前是干什么的".."\n".." {========="..TAG_relic_zuanshi.."=========}", 
    attacks = {
        missile_jinding = 1,
        }, 
    })
--------------------------------------------------------
Api:RegisterMissile("missile_jinding", {
    id = "missile_jinding",
    display_name = "金粒",
    tip = "造成50%的"..Api.GameMechanicTags.TAG.energy_regen.."命中时发射两个音符",
    flavor_text = "罕见的唱片，在骷髅和苦力怕内讧时更易掉落",
    icon = DCEI.Texture("missile_jinding"),
    missile = DCEI.SimpleUnit("COMBAT Missile Missile_jinding"),
    sounds = {
        DCEI.Sound("chidongxi")
    },
    damage = function(attack_data, caster)
        return 0.5*caster:GetBoundedAttribute("energy_per_second")
    end
    },function (combat_unit)
        local name = "missile_jinding"
        combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level, attack_data, caster, target)
            if attack_data.missile_id == "luobo" then

                combat_unit:ModifyAttribute("energy_per_second", 10, false)
            end
        end)
        end)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--boss能力
--食脑者
Api:RegisterPerk("shinaozhe", {
    id = "shinaozhe",
    display_name = "食脑者",
    description = "被脑子击中时降低50"..Api.GameMechanicTags.TAG.max_energy, 
    flavor_text = "另一款游戏里同行的天赋，拿来用一下",
    icon = DCEI.Texture("shinaozhe"),
    perk_type = "perk",
    rarity = "legendary",
    behavior = {
        description = "脑子，好吃(最大能量降低)",
        buff_bar_icon = DCEI.Texture("shinaozhe"),
        modify_attributes = {
            energy_maximum = -50,
              },
        duration = 999,
        },
    }, function(combat_unit)
        local name = "shinaozhe"
        combat_unit.Attack:RegisterOnMissileHitCallback(name, function(level, attack_data, criminal, victim)
            if attack_data.missile_id == "attack_brain" then
                for i = 1, level do
                    Api.PerkBehaviorSystem:ApplyPerkBehaviorToSelf(victim, name)
                end
            end
        end)
    end)
--火药核心
Api:RegisterPerk("huoyaohexin", {
    id = "huoyaohexin",
    display_name = "火药核心",
    description = "生命值低于".."<color=red>".."1200</color>".."时开启自毁模式！", 
    flavor_text = "献出一切",
    icon = DCEI.Texture("huoyaohexin"),
    perk_type = "perk",
    rarity = "legendary",
    },function(combat_unit)
        local name = "huoyaohexin"
        local jishu = 0
        combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level,attack_data,caster,target)
			    if combat_unit:GetCurrentHealth() < 1000 then
                    for i = 1, level do
                        combat_unit.Attack:NewUltimateAttack(target, true)
                    end
		        end
        end) 
    end)
--淘金者
Api:RegisterPerk("taojin", {
    id = "taojin",
    display_name = "淘金者",
    description = "每次沙子击中敌人都有".."<color=#47b05d>".."33%</color>".."的概率额外发射一个金粒", 
    flavor_text = "没人能从我这儿带走一粒金子",  --temp
    icon = DCEI.Texture("taojin"),
    perk_type = "perk",
    rarity = "legendary",
    },function(combat_unit)
        local name = "huoyaohexin"
        combat_unit.Attack:RegisterOnMissileImpactCallback(name, function(level,attack_data,caster,target)
                if attack_data.missile_id == "tieding" then
                    local randoms = math.random(0,1) 
                    if randoms <= 0.33 then
                         for i = 1, level do
                            combat_unit.Attack:NewMissileAttack(target, "missile_jinding")
                         end
                    end
		        end
        end) 
    end)



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--大招
Api:RegisterUltimate("lie_yan_dan", {
        id = "lie_yan_dan",
        icon = DCEI.Texture("lie_yan_dan"),
        missile = DCEI.SimpleUnit("COMBAT Ultimate Lie"),
        spin_speed = 0,
        static = true,
        flight_time = 1,
        })
--------------------------------------------------------
--僵尸大招
Api:RegisterUltimate("BosUnlFu", {
    id = "BosUnlFu",
    icon = DCEI.Texture("BosUnlFu"),
    missile = DCEI.SimpleUnit("COMBAT Ultimate Fu_Rou"),
    spin_speed = 0,
    static = true,
    flight_time = 1,
    })
--------------------------------------------------------
--苦力怕大招
Api:RegisterUltimate("BosUnlKu", {
    id = "BosUnlKu",
    icon = DCEI.Texture("BosUnlKu"),
    missile = DCEI.SimpleUnit("COMBAT Ultimate Ku_Li"),
    spin_speed = 0,
    static = true,
    flight_time = 1,
    })
--------------------------------------------------------
--猪灵大招
Api:RegisterUltimate("BosUnlJin", {
    id = "BosUnlJin",
    icon = DCEI.Texture("BosUnlJin"),
    missile = DCEI.SimpleUnit("COMBAT Ultimate Jin_Jian"),
    spin_speed = 0,
    static = true,
    flight_time = 1,
    })
--------------------------------------------------------
--烈焰人大招
Api:RegisterUltimate("BosUnlLie", {
    id = "BosUnlLie",
    icon = DCEI.Texture("BosUnlLie"),
    missile = DCEI.SimpleUnit("COMBAT Ultimate Lie_Yan"),
    spin_speed = 0,
    static = true,
    flight_time = 1,
    })
--------------------------------------------------------
--末影人大招
Api:RegisterUltimate("BosUnlZhenZhu", {
    id = "BosUnlZhenZhu",
    icon = DCEI.Texture("BosUnlZhenZhu"),
    missile = DCEI.SimpleUnit("COMBAT Ultimate Zhen_Zhu"),
    spin_speed = 0,
    static = true,
    flight_time = 1,
    })
--------------------------------------------------------
--末影龙大招
Api:RegisterUltimate("BosUnlLongXi", {
    id = "BosUnlLongXi",
    icon = DCEI.Texture("BosUnlLongXi"),
    missile = DCEI.SimpleUnit("COMBAT Ultimate Long_xi"),
    spin_speed = 0,
    static = true,
    flight_time = 1,
    })
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--角色
Api:CopyCharacter("naysayer", {
        id = "Steve",
        display_name = "史蒂夫",
        short_description = "有水就没事",
        icon = DCEI.Texture("steve_small"),
        icon_low_resolution = DCEI.Texture("steve_small"),
        icon_high_resolution = DCEI.Texture("steve_large"),
        unit = DCEI.Unit("COMBAT Unit Steve Character"),
        attributes = {
        health_maximum = 2500,          --hp
        energy_maximum = 1800,          --最大能量
        energy_per_second = 120,         --能量恢复
        attack = 18,
        attack_speed = 1.1,                    --力量
        --专门来测试属性的
        -- health_maximum = 80000,          --hp
        -- dodge_chance = 0.9,          --闪避
        -- attack_speed = 1.5,             --攻速
        -- luck = 1,                    --幸运
        -- income = 30,                    --收入    
        -- energy_per_second = 600,        --能量恢复
        -- energy_maximum = 1600000,          --最大能量
        -- health_per_second = 200,     --hp恢复
        -- block = 70
        -- attack = 0,                    --力量
                     },
       cosmetic_data = 
        --大招
         {
            ultimate_id = "lie_yan_dan",
         },

        --遗物
         relics = 
         {
            "Relic_BuSiTuTeng",
            "Relic_RenWu",
            "Relic_MuGun",
            --测试遗物
            --"Relic_XJHJ_SuiPian",
            --"Relic_JinDing",
            --"Relic_DaHuoShi",
            --"Relic_HeiYaoShi",
            --"Relic_XJHJ_Ding",
            --"Relic_LongDan",
         },

        --弹匣
         attack_ids = 
         {
             
         "Missile_ZhuYan",
         "Missile_ZhuYan",
         "Missile_TNT",
         "Missile_TNT",
         "mianbao",
         --测试弹匣
         --"diaoling"
         --"haitun",
         --"zhu",
         --"haigui",
         --"ji",
         --"endeye",
         --"zsj",
         --"mianbao",
         --"Missile_JSZR",
         },

        --能力池
         perk_chains = 
            {
            -----------------------------新建能力组
                {
                    --蜘蛛眼
                   "Perk_MuTi",
                   "Perk_ZhuLuan",
                   "Perk_FaJiao",
                   "Perk_NuWu",
                   --急迫
                   "Perk_JiPo1",
                   "Perk_JiPo2",
                   "Perk_JiPo3",
                   --
                   "Perk_HeTun",
                   "Perk_KoShui",
                   "Perk_XingYun",
                   "Perk_JingJi",
                   --
                   "Perk_HanBao",
                   "Perk_NongFu",
                   "Perk_Power_Ji",
                   "Perk_Power_Zhu",
                   --
                   "Perk_MuYang",
                },
            ------------------------------原能力组
                {
                --力量相关
                 --"gain_attack",--攻击提升
                 --"attack_quest",--加油
                 "flex_on_flex",--再来一组
                 "attack_flex",--肌肉
                 "flex_quest",--努力锻炼
                 "super_flex",--野兽心态
                --脑子相关
                "attack_brain",--获得一个脑子
                --"bonus_brain",--学习
                "super_brain",--头脑风暴
                 --最大生命值相关
                --"attack_lifesteal",--获得一个吸血鬼
                --"brain_on_lifesteal",--思考
                --"bonus_lifesteal",--吸血蝙蝠
                --能量恢复相关
                --"energy_regen",--能量恢复
                --"attack_music_note",--音符
                --"recruit_band_quest",--组建乐队
                --"bonus_music_note",--升调
                --闪避相关
                "dodge",--闪避
                "energy_on_dodge",--虫舞
                "dodge_on_crit_quest",--阴阳调和
                "brain_on_dodge",--明镜止水
                --暴击提升
                --"crit",--暴击几率
                "crit_chance_quest",--怒气积攒
                --幸运
                "gain_luck",--获得20%幸运
                --鲨鱼
               --"shark_quest",--鲨群考验
                --"thorn_shark",--荆棘鲨
                --"vulnerable_on_damage",--撕裂伤口
                --"shark_on_damage",--寻血鲨鱼
                --"heal_on_damage_legendary",--盛宴
                --回血
                "health_regen",--获得25回血
                "health_regen_percentage",--硬汉
                },
            -----------------------------子弹组
            {
                "Perk_Power_ZhuYan", 
                "Perk_Power_MianBao",
                "Perk_Power_TNT",
                "Perk_Power_LongXi",
            },    
    
            },
                })
--Boss池
Api:SetCampaignBossPool("Steve", {
        "my_boss_zhuling",
        "my_boss_zombie",
        "my_boss_kulipa",
        
        "my_boss_lieyanren",
        "my_boss_moyingren",
        "my_boss_moyinglong",
    })
--神器合成
Api:RegisterRelicCombos("Steve", {
        --下界传送门
        Relic_CSM = {
            priority = 1,
            formula = {
                Relic_HeiYaoShi = 5,
                Relic_DaHuoShi = 1,
            }
        },
        --下界合金锭
        Relic_XJHJ_Ding = {
            priority = 1,
            formula = {
                Relic_XJHJ_SuiPian = 1,
                jinding = 1,
            },
        },
        --钻石剑
        Relic_ZuanShiJian= {
            priority = 1,
            formula = {
                Relic_ZuanShi = 2,
                Relic_MuGun = 1,
            },
        },
        --末影之眼
        Relic_YanJing = {
            priority = 1,
            formula = {
                Relic_ZhenZhu = 1,
                Relic_LieYanFen = 1,
            },
        },


    })
---------------------------------   
end)     
