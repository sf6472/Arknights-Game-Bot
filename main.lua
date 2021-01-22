require("TSLib")
require("ui")
require("检查界面")

w,h = getScreenSize();
if w == 720 and h == 1280 then
    --dialog("720*1280")
    init('0', 1); --以当前应用 Home 键在右边初始化 --xx用1
elseif w == 1280 and h == 720 then
    --dialog("1280*1280")
    init('0', 0); --以当前应用 Home 键在右边初始化 --xx用1

else
    init('0', 1); --以当前应用 Home 键在右边初始化 --xx用1
    --dialog("最佳适配分辨率为720x1280\n可以尝试继续运行 但不一定能用",{timeout = 20,title = "非最佳适配分辨率",button = "继续运行"})
    dialog("请使用720x1280分辨率运行\n模拟器最好",{timeout = 0,title = "非适配分辨率",button = "退出"})
    lua_exit()

end

mSleep(1000)
mainUi()

textHUD("欢迎使用")

stat = radio1
count = 1 
countEnd = tonumber(text0)--刷多少次
if countEnd == nil then
    countEnd = 0
end



-- if stat == "一键日常" then
--     dialog("一键日常",{timeout = 0,title = "刷完了",button = "OK"})
--     randomTap(964, 661)
-- end

--循环刷图
while stat == "自选循环刷图" do
    mSleep(1000)
    local UIscan = 检查界面()
    
    if UIscan == 0 then --登录界面
        textHUD("掉线了")
        mSleep(1000)
        randomTap(637,509)--登录按钮
        textHUD("尝试登录")
        textHUD("")
    
    elseif UIscan == 0.5 then --公告窗口
        textHUD("公告窗口")
        textHUD("点击关闭")
        randomTap(1236, 55)
        textHUD("")
        
    elseif UIscan == 1 then --签到界面
        textHUD("签到界面")
        textHUD("点击关闭")
        randomTap(1203, 74)
        textHUD("")
    
    elseif (countEnd ~= 0 and countEnd ~= nil and count > countEnd) then --如果计数到头就停止然后告诉用户
        dialog("完成 - 刷了 "..countEnd.." 遍.",{timeout = 0,title = "刷完了",button = "OK"})
        count = 0 --归零
        countEnd = 0
        break
        
    elseif UIscan == 2 then --关卡出击界面
        textHUD("出击界面")
        SpdClear() --ui方法 对循环后delay进行补偿
        
        --local startCheck = 出击检查() --检查界面
        if 出击检查() == 0 then --如果已开起代理
            textHUD("检查代理-代理已开")
            textHUD("点击蓝色开始行动")
            SpdClear()
            randomTap(1148, 656)
        else
            textHUD("检查代理-代理未开")
            textHUD("打开代理")
            SpdClear()
            randomTap(1066, 591)
        end
    
    elseif UIscan == 3 then
        textHUD("开始行动界面")
        textHUD("点击开始行动")
        SpdClear()
        randomTap(1120, 635)
        mSleep(3000)
        
        while true do
            --mSleep(1000)
            local state = 出击检查()
            --local mainUICheck = 检查界面()
            if state== 1 then --判定加载界面
                textHUD("关卡加载")
            elseif state == 2 then --判定战斗界面
                mSleep(2000)
                textHUD("检查两倍速")
                if 检查两倍速() == false then
                    textHUD("开启两倍速")
                    randomTap(1107, 54)
                else
                    textHUD("两倍速已开启")
                end

                tex = "战斗中 - 次数 = "..count
                textHUD(tex)
                mSleep(2000)
            elseif state == 3 then--判定战斗失败
                textHUDwS("战斗失败")
                randomTap(1024, 367)
            elseif (state == 6 and check3 == "代理指挥失误时暂停游戏") then--代理失误暂停游戏
                textHUDwS("代理指挥失误暂停游戏")
                randomTap(1201, 51)--点击暂停
                mSleep(300)
                dialog("代理指挥失误暂停游戏",{timeout = 0,title = "代理指挥失误",button = "脚本退出"})
                lua_exit()
            elseif state == 4 then--战斗结束
                textHUD("战斗结束")
                mSleep(4000)
                randomTap(1257, 266)
                randomTap(1257, 266)
                count = count + 1 --计数+1
                mSleep(4000)
                while 检查界面() ~= 2 do--如果回去了再继续
                    randomTap(1257, 266)
                    textHUD("战斗 结束")
                    mSleep(4000)
                end
                break
            end
            mSleep(2000)
            if 检查界面() == 2 then--AAA保持一致
                break
            end
        end

    elseif (UIscan == 5 and check1 == "喝药") then --检测到使用药剂并且用户喝药
        textHUD("喝药")
        randomTap(1087, 574) --确认
        mSleep(500)
        textHUD("酝酿五秒")
        mSleep(5000)
    elseif (UIscan == 5 and check2 == "吃石头") then--使用药剂 但是用户要吃石头
        textHUD("去吃石头")
        randomTap(1114, 103)
    elseif(UIscan == 6 and check2 == "吃石头") then--检测到使用石头并且用户吃石头
        textHUD("吃石头")
        randomTap(1087, 574)
        textHUD("酝酿五秒")
        mSleep(5000)
    elseif(UIscan == 6 and check2 ~= "吃石头") then--检测到使用石头并且用户不吃
        textHUD("不吃石头-没体力了")
        randomTap(768, 101)
        
    elseif (UIscan) == 4 then
        textHUD("剿灭请选用'自选剿灭循环'功能")
    
    elseif UIscan == nil then
        textHUDwS("请手动选择关卡")
        SpdClear()
        playAudio("提示音.mp3")
        mSleep(65)
        playAudio("")--ios停止播放
    end
    
end


--剿灭
while stat == "自选剿灭循环" do
    --nLog(检查界面())
    mSleep(1000)
    local UIscan = 检查界面()
    
    if UIscan == 0 then --登录界面
        textHUD("掉线了")
        mSleep(1000)
        randomTap(637,509)--登录按钮
        textHUD("尝试登录")
        textHUD("")
    
    elseif UIscan == 0.5 then --公告窗口
        textHUD("公告窗口")
        textHUD("点击关闭")
        randomTap(1236, 55)
        textHUD("")
        
    elseif UIscan == 1 then --签到界面
        textHUD("签到界面")
        textHUD("点击关闭")
        randomTap(1203, 74)
        textHUD("")
    
    elseif (countEnd ~= 0 and countEnd ~= nil and count > countEnd) then --如果计数到头就停止然后告诉用户
        dialog("完成 - 刷了 "..countEnd.." 遍.",{timeout = 0,title = "刷完了",button = "OK"})
        count = 0 --归零
        countEnd = 0
        break
        
    elseif UIscan == 4 then --关卡出击界面
        textHUD("出击界面")
        SpdClear() --ui方法 对循环后delay进行补偿
        
        --local startCheck = 出击检查() --检查界面
        if 出击检查() == 0 then --如果已开起代理
            textHUD("检查代理-代理已开")
            textHUD("点击蓝色开始行动")
            SpdClear()
            randomTap(1148, 656)
        else
            textHUD("检查代理-代理未开")
            textHUD("打开代理")
            SpdClear()
            randomTap(1066, 591)
        end
    
    elseif UIscan == 3 then
        textHUD("开始行动界面")
        textHUD("点击开始行动")
        SpdClear()
        randomTap(1120, 635)
        mSleep(3000)
        
        while true do
            --mSleep(1000)
            local state = 出击检查()
            --local mainUICheck = 检查界面()
            if state== 1 then --判定加载界面
                textHUD("关卡加载")
            elseif state == 2 then --判定战斗界面
                mSleep(2000)
                textHUD("检查两倍速")
                if 检查两倍速() == false then
                    textHUD("开启两倍速")
                    randomTap(1107, 54)
                else
                    textHUD("两倍速已开启")
                end

                tex = "战斗中 - 次数 = "..count
                textHUD(tex)
                mSleep(2000)
            elseif state == 3 then--判定战斗失败
                textHUDwS("战斗失败")
                randomTap(1024, 367)
            elseif (state == 6 and check3 == "代理指挥失误时暂停游戏") then--代理失误暂停游戏
                textHUDwS("代理指挥失误暂停游戏")
                randomTap(1201, 51)--点击暂停
                mSleep(300)
                dialog("代理指挥失误暂停游戏",{timeout = 0,title = "代理指挥失误",button = "脚本退出"})
                lua_exit()
            elseif state == 5 then--战斗结束
                textHUD("战斗结束")
                mSleep(4000)
                randomTap(1257, 266)
                mSleep(1000)
                randomTap(1257, 266)
                randomTap(1257, 266)
                count = count + 1 --计数+1
                mSleep(4000)
                while 检查界面() ~= 4 do--如果回去了再继续
                    randomTap(1257, 266)
                    textHUD("战斗 结束")
                    mSleep(4000)
                end
                break
            end
            mSleep(2000)
            if 检查界面() == 4 then
                break
            end
            
        end

    elseif (UIscan == 5 and check1 == "喝药") then --检测到使用药剂并且用户喝药
        textHUD("喝药")
        randomTap(1087, 574) --确认
        mSleep(500)
        textHUD("酝酿五秒")
        mSleep(5000)
    elseif (UIscan == 5 and check2 == "吃石头") then--使用药剂 但是用户要吃石头
        textHUD("去吃石头")
        randomTap(1114, 103)
    elseif(UIscan == 6 and check2 == "吃石头") then--检测到使用石头并且用户吃石头
        textHUD("吃石头")
        randomTap(1087, 574)
        textHUD("酝酿五秒")
        mSleep(5000)
    elseif(UIscan == 6 and check2 ~= "吃石头") then--检测到使用石头并且用户不吃
        textHUD("不吃石头-没体力了")
        randomTap(768, 101)
    
    elseif (UIscan) == 2 then
        textHUD("非剿灭请选'自选循环刷图'功能")
    elseif UIscan == nil then
        textHUDwS("请手动选择剿灭关卡")
        SpdClear()
        playAudio("提示音.mp3")
        mSleep(65)
        playAudio("")--ios停止播放
    end

end
