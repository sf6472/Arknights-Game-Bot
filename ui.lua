require "TSLib"
--w,h = getScreenSize()
function mainUi()
    UINew(1,"主功能","确定","取消","save.dat",1,0,700,500,"255,255,255","242,242,242","","dot",1)
    UIRadio(1,"radio1","自选循环刷图,自选剿灭循环","1",-1,0,"",1,2)
    --UIRadio(1,"radio1","一键日常,自选循环刷图,一键日常后刷图,日常循环","1",-1,0,"",1,2)
    UILabel(1,"刷图次数",14,"left","38,38,38")
    UIEdit(1,"text0","刷图次数，无限刷填0或者留空","",15,"left","38,38,38","default")
    UICheck(1,"check1,check2","喝药,吃石头","0")
    UICheck(1,"check3","代理指挥失误时暂停游戏","")
    UIShow()
end

function textHUD(s)
    showTextView("","frime",445,0,755,45,"center","6495ED","FF8C00",15,1,1,1,50)
    showTextView(s,"abc",450,0,750,40,"center","6495ED","FFFFFF",15,1,1,1,50)
    mSleep(1000)
    --    closeFw()
end

function textHUDwS(s)
    showTextView("","frime",445,0,755,45,"center","6495ED","FF8C00",15,1,1,1,50)
    showTextView(s,"abc",450,0,750,40,"center","6495ED","FFFFFF",15,1,1,1,50)
    playAudio("提示音.mp3")
    mSleep(65)
    playAudio("")--ios停止播放
    mSleep(500)
    --    closeFw()
end

function SpdClear()
    showTextView("","frime",445,0,755,45,"center","6495ED","FF8C00",15,1,1,1,50)
    showTextView("","abc",450,0,750,40,"center","6495ED","FFFFFF",15,1,1,1,50)
end
    