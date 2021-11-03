require("TSLib")
require("ui")

function 检查界面()
    -- --检查是否是登录界面
    -- local lx, ly = findMultiColorInRegionFuzzy(0x211818,"38|169|0x565656,-100|171|0x565656,-116|84|0x211818,-102|-10|0x211818,-132|7|0x211818", 95, 486, 274, 781, 555, 0, 0)
    -- if lx > -1 then
    --     return 0
    -- end
    
    -- --检查是否是公告界面
    -- local gx, gy = findMultiColorInRegionFuzzy(0x686868,"-2|14|0x2d2d2d,-184|7|0xcdcdcd,-196|7|0x686868,-193|30|0x686868", 95, 344, 80, 643, 148, 0, 0)
    -- if gx > -1 then
    --     return 0.5
    -- end
    
    -- --检查是否是签到界面
    -- local qx, qy = findMultiColorInRegionFuzzy(0xf4b800,"-172|-8|0x313131,-128|108|0xffffff,16|117|0x8d6f13", 93, 868, 358, 1194, 653, 0, 0)
    -- local qxy, qyy = findMultiColorInRegionFuzzy(0x313131,"83|-3|0xf4b800,85|88|0xf4b800,-12|76|0x313131", 93, 914, 458, 1170, 656, 0, 0)
    -- if qx > -1 or qxy > 1 then
    --     return 1
    -- end
    
    --检查是否是出击界面
    local cjx, cjy = findMultiColorInRegionFuzzy(0x070707,"-15|36|0xc65342,2|36|0x242424", 92, 1214, 139, 1279, 225, 0, 0)
    if cjx > -1 then
        return 2
    end
    
    --检查是否是开始行动最后界面的检查--识别右上蓝色快捷编队
    local kx, ky = findMultiColorInRegionFuzzy(0xffffff,"2|11|0x0098dc,20|-8|0xffffff,29|6|0x0098dc,65|8|0x313131", 95, 872, 19, 964, 63, 0, 0)
    if kx > -1 then
        return 3
    end

    
    --剿灭用
    --识别剿灭的开始
    local jmx, jmy = findMultiColorInRegionFuzzy(0x422107,"8|-24|0x070707,2|19|0x422107,5|32|0x090707,-36|397|0x0b0b0b,-75|507|0x0099dd", 92, 1187, 69, 1282, 639, 0, 0)
    if jmx > -1 then
        return 4
    end
    
    
    --识别使用药剂 
    local yaox, yaoy = findMultiColorInRegionFuzzy(0xffffff,"95|0|0xffffff,585|-145|0x000000,750|-145|0xffffff,724|72|0xababab,955|320|0x313131,972|154|0x313131", 95, 28, 78, 1278, 619, 0, 0)
    if yaox > -1 then
        return 5
    end
    local yaoiix, yaoiiy = findMultiColorInRegionFuzzy(0xffffff,"100|-4|0xffffff,588|-151|0x000000,589|-152|0x000000,632|-157|0xffffff,905|-147|0xffffff,978|153|0x313131,955|325|0x313131,960|333|0xfbfbfb,664|327|0x313131", 95, 92, 78, 1132, 610, 0, 0)
    if yaoiix > -1 then
        return 5
    end
    
    --识别使用石头
    local shitoux, shitouy = findMultiColorInRegionFuzzy(0xffffff,"103|-1|0xffffff,877|-153|0xffffff,897|-152|0x000000,997|-90|0xbb9445,963|322|0x313131", 95, 28, 78, 1278, 619, 0, 0)
    if shitoux > -1 then
        return 6
    end
end
    
function 出击检查()
    
    --检查是否已开启代理指挥
    local dx, dy = findColorInRegionFuzzy(0xffffff, 99, 1057, 582, 1076, 601, 0, 0)
    if dx > -1 then
        return 0
    end
    
    --检查是否是加载界面
    local jx, jy = findMultiColorInRegionFuzzy(0xffffff,"11|-1|0xffffff,18|3|0xffffff,28|0|0xffffff,35|0|0xffffff,55|0|0xffffff", 92, 1122, 668, 1243, 703, 0, 0)
    if jx > -1 then
        return 1
    end
    
    --检查代理失误--识别红色感叹号
    --local failx, faily = findMultiColorInRegionFuzzy(0x313131,"37|-7|0x6e1010,37|6|0x701212,42|15|0x690707", 92, 608, 620, 718, 685, 0, 0)
    -- local failx, faily = findMultiColorInRegionFuzzy(0x1b0808, "-7|12|0x170404,8|12|0x1f0b0b,20|12|0x200c0c,7|3|0x1c0909", 92, 548, 654, 548, 654)
    -- if failx > -1 then
    --     return 6
    -- end
    --识别上方红色盾牌-1
    -- local failx, faily = findMultiColorInRegionFuzzy(0xff0606,"-187|-3|0xff0300,163|-16|0xa40000,133|-16|0xa40000,144|-17|0xffffff", 92, 448, 3, 893, 53, 0, 0)
    local failx, faily = findMultiColorInRegionFuzzy(0xa40000,"7|0|0xffffff,19|-1|0xfdfafa,19|-5|0xa40000,19|4|0xa40000,26|0|0xa40000", 92, 825, 13, 886, 29, 0, 0)
    if failx > -1 then
        return 6
    end
    
    --检查是否是战斗界面--识别接管作战手指
    --local zx, zy = findMultiColorInRegionFuzzy(0xf9f9f9,"5|-13|0x313131,-1|-20|0x313131,2|8|0xf9f9f9,12|9|0x313131", 92, 477, 623, 529, 682, 0, 0)
    -- local zx, zy = findMultiColorInRegionFuzzy(0x313130, "21|-9|0xe1e0df,32|-8|0xdedddd,28|1|0x302f2f,18|1|0x313130,37|1|0x2e2e2e,24|-16|0xdededd", 92, 337, 682, 337, 682)
    -- if zx > -1 then
    --     return 2
    -- end
    --识别点数菱形C图标
    local zx, zy = findMultiColorInRegionFuzzy(0xffffff,"1|22|0xffffff,-10|11|0xffffff,-4|12|0x010101,3|12|0xffffff,11|12|0xffffff,2|17|0x010101", 92, 1164, 496, 1199, 536, 0, 0)
    if zx > -1 then
        return 2
    end
    
    --检查战斗失败
    local sx, sy = findMultiColorInRegionFuzzy(0xffffff,"24|0|0xffffff,64|0|0xffffff,86|13|0xffffff,469|-23|0xffffff", 92, 267, 288, 783, 432, 0, 0)
    if sx > -1 then
        return 3
    end
    
    --检查战斗结束
    local jsx, jsy = findMultiColorInRegionFuzzy(0xffffff,"48|-5|0xffffff,81|-11|0xffffff,124|12|0xffffff,188|18|0xffffff,246|12|0xffffff", 95, 45, 591, 387, 671, 0, 0)
    if jsx > -1 then
        return 4
    end
    
    
    
    --剿灭用
    --剿灭结束识别简报
    -- local jmjx, jmjy = findMultiColorInRegionFuzzy(0xffffff,"12|-4|0x00a5fa,12|-1|0x00a5f8,-16|-2|0x00a5f9,-6|55|0xff7902,-10|64|0x161616,-10|71|0xff7902,-7|117|0x161616,-7|124|0xffffff", 98, 919, 268, 974, 430, 0, 0)
    -- if jmjx > -1 then
    --     return 5
    -- end
    local jmjx, jmjy = findMultiColorInRegionFuzzy(0xffffff,"-26|-13|0xffffff,-2|-27|0xffffff,-17|140|0xffffff,-16|148|0xffffff,-17|156|0xffffff,-21|148|0x000000,-16|152|0x000000,-16|142|0x000000,-22|180|0xffffff,788|46|0x00a5fa,808|45|0xffffff,811|104|0xff7902,808|164|0xffffff", 92, 78, 178, 1085, 455, 0, 0)
    if jmjx > -1 then
        return 5
    end

end


function 检查两倍速()
    --1倍
    local ox, oy = findMultiColorInRegionFuzzy(0xf5f5f5,"5|4|0xf5f5f5,16|34|0xf5f5f5,26|33|0xf5f5f5,15|29|0xf5f5f5,17|37|0xf5f5f5,23|6|0xf5f5f5", 95, 1071, 19, 1127, 84, 0, 0)
    if ox > -1 then
        return false
    end
    --2倍
    --local tx, ty = findMultiColorInRegionFuzzy(0xf5f5f5,"14|4|0xf5f5f5,6|14|0xf5f4f4,2|19|0xf5f5f5,15|19|0xf5f5f5,12|32|0xf5f5f5", 95, 1071, 19, 1127, 84, 0, 0)
    --if tx > -1 then
    --    return true
    --end
    
end
