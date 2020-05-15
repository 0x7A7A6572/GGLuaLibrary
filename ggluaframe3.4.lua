local FRAME_VERSION = '3.3'
local DEVELOPMENT = 'zzer'
local GG_VERSION = '78.0'
local ANDROID = '9.0-ROOT '
local GGLUA_WEB = 'http://gg.zzerx.cn'
local FIRST_LAST = '18/9/20-19/5/19'
local null = "无";
_z = {
    INFO = {
        LIBRARY_VERSION = '3.1-Final',
        DEVELOPMENT = 'zzer',
        YOU_GG = gg.VERSION,
        NOW_PROCESS = gg.getTargetInfo(gg.getTargetPackage()).packageName
    },
    cleanmodel = {exp = null, model = null},
    search = {
        {
            code = null,
            type = null,
            model = null,
            count = null,
            time = null,
            fastS = '关闭'
        },
        time = 0,
        count = 0,
        model = unll
    },
    get_res = {},
    edit = {
        {
            {
                value = '',
                address = '',
                flags = '',
                freeze = false,
                freezeO = '$nil',
                save = false
            }
        },
        value = ' ',
        address = ' ',
        type = ' '
    },
    region = '默认',
    controlT = {s = {before = '', after = ''}, e = {before = '', after = ''}}
}
localDateIn = {}
function getTableLens(t)
    local lens = 0
    for k, v in pairs(t) do lens = lens + 1 end
    return lens
end
function concatTable(t)
    echoStr = ' ';
    for i = 1, getTableLens(t) do
        if not t[i] then t[i] = ' $nil ' end
        echoStr = echoStr .. t[i]
    end
    return echoStr
end
function enString(str)
    -- local enc = str: gsub("'", "%'") : gsub(""", """) : gsub("-", "-") : gsub("%:", "%%%:") : gsub("%[", "%%%[") : gsub('%]', '%%%]') 
    return enc
end
function stringPatch(str)
    local str_p = str:gsub("%)", "% %)"):gsub("%(", "%%("):gsub("%[", "%%[")
                      :gsub('%]', '%%]'):gsub('%:', '%%:'):gsub('%;', '%%;')
                      :gsub('%+', '%%+'):gsub('%-', '%%-')
    return str_p
end
function tcall(loadoj, ispcall)
    if not loadoj then local loadoj = ' ' end
    local fun = load(loadoj)
    if not ispcall then
        if (fun) then fun() end
    else
        pcall(fun)
    end
end
function cHex(hex)
    if (hex:match('FFFFFFFF') or hex:match('0000000')) then
        return hex:sub(8, -1)
    else
        return hex
    end
end
function addressHex(addr) return string.format('%X', addr) end

 --   字符串分割
 --  @strn 待分割字符串任意格式  
 --  @char 分隔符

function zsilp(strn, char)
    if not char then char = '' end
    if not strn then return "zsilp: #1 error(nil)" end
    strSun = {}
    if char == '' then
        local lenInByte = #strn
        local width = 0
        local fuckn = 0
        for i = 1, lenInByte do
            local curByte = string.byte(strn, i)
            local byteCount = 1;
            if curByte > 0 and curByte <= 127 then
                byteCount = 1
            elseif curByte >= 192 and curByte < 223 then
                byteCount = 2
            elseif curByte >= 224 and curByte < 239 then
                byteCount = 3
            elseif curByte >= 240 and curByte <= 247 then
                byteCount = 4
            end
            local char = string.sub(strn, i, i + byteCount - 1)
            fuckn = i + byteCount - 1
            if (i ~= fuckn or curByte < 127) then
                table.insert(strSun, char)
            end
            if (i == #strn) then return strSun end
        end
    else
        ongsubs, gsubs = string.gsub(strn, stringPatch(char), char)
        for i = 0, gsubs do
            wi = string.find(ongsubs, stringPatch(char));
            if (wi == nil) then wi = -1 end
            acc = string.sub(ongsubs, 1, wi)
            table.insert(strSun, (string.gsub(acc, stringPatch(char), '')));
            ongsubs = string.sub(ongsubs, wi + 1, -1);
        end
    end
    return strSun
end
function addzygote(Max, youVoid)
    zy_string = ' '
    need = math.ceil((Max - youVoid) / 2)
    for ai = 1, need do zy_string = zy_string .. ' ' end
    return zy_string
end
function superToast(itable, time, con)
    if not time then time = 100 end
    local hsong = {}
    local max = 0
    if (type(itable) == 'string') then
        local table_toast = zsilp(itable, '')
        if con then
            local o = 0
            if #table_toast ~= #con then o = #con / #table_toast end
            for i = 1, #table_toast do
                table.insert(hsong, table_toast[i])
                gg.toast(table.concat(hsong, '') .. con[o])
                gg.sleep(time)
                o = o + #con / #table_toast
            end
        else
            for i = 1, #table_toast do
                table.insert(hsong, table_toast[i])
                gg.toast(table.concat(hsong, ''))
                gg.sleep(time)
            end
        end
    else
        for g = 1, #itable do
            if (#itable[g] >= max) then max = #itable[g] end
        end
        for i = 1, #itable do
            before_z = addzygote(max, #itable[i])
            after_z = addzygote(max, #itable[i])
            table.insert(hsong, #itable[i])
            hsong[i] = before_z .. itable[i] .. after_z
            gg.toast('%n' .. table.concat(hsong, '%n'))
            gg.sleep(time)
        end
    end
end

function getNetDate(host)
    if (host == nil) then host = 'http://www.gameguardian.net' end
    netTime = (gg.makeRequest(host))
    return string.sub(netTime.date, 1, -4)
end

function getIp() return gg.makeRequest('http://gg.zzerx.cn/ip.php').content; end

function checkType(stype, ojname)
    if (stype == 'DW' or stype == 'D' or stype == '4') then
        ojname = gg.TYPE_DWORD;
    else
        if (stype == 'DO' or stype == 'E' or stype == '64') then
            ojname = gg.TYPE_DOUBLE;
        else
            if (stype == 'F' or stype == '16') then
                ojname = gg.TYPE_FLOAT;
            else
                if (stype == 'B' or stype == '1') then
                    ojname = gg.TYPE_BYTE;
                else
                    if (stype == 'W' or stype == '2') then
                        ojname = gg.TYPE_WORD;
                    else
                        if (stype == 'X' or stype == '8') then
                            ojname = gg.TYPE_XOR;
                        else
                            if (stype == 'Q' or stype == '32') then
                                ojname = gg.TYPE_QWORD;
                            else
                                if (stype == nil or stype == 'A' or stype == '' or
                                    stype == '127') then
                                    ojname = gg.TYPE_AUTO;
                                else
                                    ojname = gg.TYPE_AUTO;
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return ojname
end
function setRegion(thisR)
    local onRegion = {}
    doRegion = zsilp(thisR, '|')
    for i = 1, #doRegion do
        if (doRegion[i] == 'B' or doRegion[i] == '131072') then
            table.insert(onRegion, 'gg.REGION_BAD')
        else
            if (doRegion[i] == 'A' or doRegion[i] == '32') then
                table.insert(onRegion, 'gg.REGION_ANONYMOUS')
            else
                if (doRegion[i] == 'As' or doRegion[i] == '524288') then
                    table.insert(onRegion, 'gg.REGION_ASHMEM')
                else
                    if (doRegion[i] == 'Ca' or doRegion[i] == '4') then
                        table.insert(onRegion, 'gg.REGION_C_ALLOC')
                    else
                        if (doRegion[i] == 'Cb' or doRegion[i] == '16') then
                            table.insert(onRegion, 'gg.REGION_C_BSS')
                        else
                            if (doRegion[i] == 'Cd' or doRegion[i] == '8') then
                                table.insert(onRegion, 'gg.REGION_C_DATA')
                            else
                                if (doRegion[i] == 'Ch' or doRegion[i] == '1') then
                                    table.insert(onRegion, 'gg.REGION_C_HEAP')
                                else
                                    if (doRegion[i] == 'Xa' or doRegion[i] ==
                                        '16384') then
                                        table.insert(onRegion,
                                                     'gg.REGION_CODE_APP')
                                    else
                                        if (doRegion[i] == 'Xs' or doRegion[i] ==
                                            '32768') then
                                            table.insert(onRegion,
                                                         'gg.REGION_CODE_SYS')
                                        else
                                            if (doRegion[i] == 'J' or
                                                doRegion[i] == '65536') then
                                                table.insert(onRegion,
                                                             'gg.REGION_JAVA')
                                            else
                                                if (doRegion[i] == 'Jh' or
                                                    doRegion[i] == '2') then
                                                    table.insert(onRegion,
                                                                 'gg.REGION_JAVA_HEAP')
                                                else
                                                    if (doRegion[i] == 'O' or
                                                        doRegion[i] ==
                                                        '-1032320') then
                                                        table.insert(onRegion,
                                                                     'gg.REGION_OTHER')
                                                    else
                                                        if (doRegion[i] == 'PS' or
                                                            doRegion[i] ==
                                                            '262144') then
                                                            table.insert(
                                                                onRegion,
                                                                'gg.REGION_PPSSPP')
                                                        else
                                                            if (doRegion[i] ==
                                                                'S' or
                                                                doRegion[i] ==
                                                                '64') then
                                                                table.insert(
                                                                    onRegion,
                                                                    'gg.REGION_STACK')
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    if doRegion ~= nil then
        doRegion = table.concat(onRegion, ' | ')
        return pcall(load("gg.setRanges%(" .. doRegion .. "%)"))
    end
end
function c_R()
    local R = {x, y}
    function R:In(o)
        o = o or {}
        setmetatable(o, self)
        self._index = self
        return o
    end
    return R
end
function _box_(_z, isSave)
    local box = {}
    function box:c() return gg.clearResults() end
    function box:check(jhm, llocal, beforet)
        local serverData = gg.makeRequest(
                               'http://gg.zzerx.cn/getQQCollection.php', nil,
                               "userid=" .. llocal .. "&JHM=" .. jhm).content
        local serverSet = serverData:match("echoData%=%{%[.*%'%}")
        tcall(serverSet, true)
        tcall(beforet, true)
        if not echoData then
            echoData = {}
            echoData.isen = ""
        end
        if echoData.isen == "无" then
            return tcall(serverData)
        elseif (echoData.isen == "base64") then
            tcall(ZZBase64.decode(serverData:gsub("echoData=%{.*%}", "")), true)
        elseif (echoData.isen == "工具") then
            if not load(serverData) then
                tcall(
                    ZZBase64.decode(serverData:gsub("echoData=%{.*%}", "")):sub(
                        3656 - 1):gsub(_z.INFO.DEVELOPMENT, "LuaR"), true)
            else
                tcall(serverData)
            end
        else
            tcall(serverData)
        end
    end
    function box:r(rR) return setRegion(rR) end
    function box:s(str, get, doBefore, doAfter)
        local starttime = os.clock()
        if (localDateIn[str] and __fastS) then
            zs_res = localDateIn[str]
            local endtime = os.clock()
            searchtime = endtime - starttime
            _z.search[1].fastS = '开启'
            _z.search[1].code = str
            _z.search[1].type = '自动'
            _z.search[1].count = #zs_res
            _z.search.count = #zs_res
            _z.search.time = 1
            _z.search[1].time = 1
            return zs_res
        end
        local d = {}
        if (str ~= nil) then
            local xs = zsilp(str, '|');
            if (doBefore == nil) then doBefore = ' ' end
            if (doAfter == nil) then doAfter = ' ' end
            _z.controlT.s.before = doBefore
            _z.controlT.s.after = doAfter
            tcall(doBefore)
            for s = 1, #xs do
                _z.search[s] = {}
                _z.search[s].fastS = tostring(__fastS)
                Sch = zsilp(xs[s], "_")
                if (Sch[1]:match("%[.*%]")) then
                    local setUp = Sch[1]:match("%[.*%]")
                    cSetUp = setUp:gsub("%[", ""):gsub("%]", "")
                    cSetUp = zsilp(cSetUp, ";")
                    if (cSetUp[1] == "SIGN:FN" or cSetUp[1] == "536870912") then
                        sSIGN = gg.SIGN_FUZZY_EQUAL
                    elseif (cSetUp[1] == "SIGN:E" or cSetUp[1] == "536870912") then
                        sSIGN = gg.SIGN_EQUAL;
                    elseif (cSetUp[1] == "SIGN:FG" or cSetUp[1] == "67108864") then
                        sSIGN = gg.SIGN_FUZZY_GREATER;
                    elseif (cSetUp[1] == "SIGN:FL" or cSetUp[1] == "134217728") then
                        sSIGN = gg.SIGN_FUZZY_LESS;
                    elseif (cSetUp[1] == "SIGN:FNE" or cSetUp[1] == "268435456") then
                        sSIGN = gg.SIGN_FUZZY_NOT_EQUAL;
                    elseif (cSetUp[1] == "SIGN:GOE" or cSetUp[1] == "67108864") then
                        sSIGN = gg.SIGN_GREATER_OR_EQUAL;
                    elseif (cSetUp[1] == "SIGN:LOE" or cSetUp[1] == "134217728") then
                        sSIGN = gg.SIGN_LESS_OR_EQUAL;
                    elseif (cSetUp[1] == "SIGN:NE" or cSetUp[1] == "268435456") then
                        sSIGN = gg.SIGN_LESS_OR_EQUAL;
                    else
                        sSIGN = SIGN_EQUAL;
                    end
                    if (not cSetUp[2] or cSetUp[2] == '') then
                        forRan = 0
                        toRan = -1
                    else
                        forRan = zsilp(cSetUp[2]:gsub("RAN%:", ""), "~")[1]
                        toRan = zsilp(cSetUp[2], "~")[2]
                    end
                    Sch[1] = Sch[1]:gsub(enString(setUp), "")
                end
                if (Sch[2] ~= nil) then
                    t_type = checkType(Sch[2])
                else
                    Sch[2] = '无/Auto'
                end
                if (Sch[3] == nil) then Sch[3] = ' ' end
                if (string.match(Sch[3], '%$') == '$') then
                    local misk = string.match(Sch[3], '0x.*')
                    if (misk == nil) then misk = -1 end
                    local g_ss = string.gsub(Sch[1], '%?', '')
                    local andAdd = zsilp(g_ss, ';')
                    if ("?" .. andAdd[1] ~= Sch[1]) then
                        add = gg.getResults(gg.getResultCount())
                        for i = 1, #andAdd do
                            for r = 1, #add do
                                if (string.match(
                                    string.format('%#x', add[r].address, 16),
                                    andAdd[i], -#andAdd[i]) == nil) then
                                    d[r] = {}
                                    d[r].address = add[r].address
                                    d[r].flags = add[r].flags
                                else
                                    d[r] = {}
                                end
                            end
                            for z, v in pairs(andAdd) do
                                for k in pairs(d) do
                                    if d[k].flags == nil or
                                        string.match(
                                            string.format('%#x', d[k].address,
                                                          16), v, -#v) then
                                        d[k] = nil
                                    end
                                end
                            end
                        end
                        gg.removeResults(d)
                    end
                    if ("?" .. andAdd[1] == Sch[1]) then
                        gg.searchAddress(Sch[1], misk, t_type, sSIGN, forRan,
                                         toRan)
                    end
                    _z.search[s].model = 'searchAddress'
                else
                    if (string.match(Sch[2], '%*') == '*') then
                        local maxz = Sch[1]
                        local maxz_res = gg.getResults(gg.getResultCount())
                        if (gg.getResultCount() == 0) then
                            return gg.toast(
                                       "当前结果数为0/指针搜索不能是首次搜索")
                        end
                        maxzz = maxz_res[1].address
                        local maxnum = maxzz - maxz .. '~' .. maxzz
                        z:c()
                        gg.searchNumber(maxnum, gg.TYPE_QWORD, false, sSIGN,
                                        forRan, toRan)
                        _z.search[s].model = 'searchNumber(指针搜索)'
                    else
                        if (string.match(Sch[1], '%>%>') == '%>%>') then
                            Sch1_addr = zsilp(string.gsub(Sch[1], '%>%>', ''),
                                              '>')
                            for i = 1, #Sch1_addr do
                                if (Sch1_addr[i] == 'to*') then
                                    thisValue = gg.getResults(1)
                                    thisAddr =
                                        gg.getValues(
                                            {
                                                {
                                                    address = thisValue[1]
                                                        .address,
                                                    flags = thisValue[1].flags
                                                }
                                            })[1].value
                                    z:r('A|As|Ca|Cb|Cd|Ch|Xa|Xs|J|Jh|O|PS|S')
                                    z:c()
                                    gg.searchAddress(
                                        cHex(string.format('%X', thisAddr, 16)),
                                        0xFFFFFFFF, t_type, gg.SIGN_EQUAL, 0, -1)
                                else
                                    thisValue = gg.getResults(1)
                                    thisAddr =
                                        thisValue[1].address + Sch1_addr[i]
                                    z:c()
                                    gg.searchAddress(
                                        '"' .. string.format('%X', thisAddr, 16) ..
                                            '"', -1, t_type, sSIGN, forRan,
                                        toRan);
                                end
                            end
                            _z.search[s].model =
                                'searchAddress(多级地址跳转)'
                        else
                            gg.searchNumber(Sch[1], t_type, false, sSIGN,
                                            forRan, toRan);
                            _z.search[s].model = 'searchNumber'
                        end
                    end
                end
                _z.search[s].fastS = '关闭'
                _z.search[s].code = Sch[1]
                _z.search[s].type = Sch[2]
                _z.search[s].count = gg.getResultCount()
                _z.search.count = _z.search[s].count
                _z.search.time = s
                _z.search[s].time = s
                tcall(doAfter)
                if (gg.getResultCount() == 0) then
                    local endtime = os.clock()
                    searchtime = endtime - starttime
                    return superToast('😞没有搜索到数据！', 90)
                end
            end
            if (get ~= nil) then
                zs_res = gg.getResults(get);
                _z.get_res.much = get
            else
                zs_res = gg.getResults(gg.getResultCount());
                _z.get_res.much = gg.getResultCount()
            end
            if str and str ~= '' then localDateIn[str] = zs_res end
            local endtime = os.clock()
            searchtime = endtime - starttime
            return zs_res
        end
    end
    function box:e(res, Str, IsFreeze, Save, eBefore, eAfter)
        starttimee = os.clock()
        if (type(res) ~= 'table') then
            res, Str, isFreeze, Save, eBefore, eAfter = zs_res, res, Str,
                                                        IsFreeze, Save, eBefore
        else
            res, Str, isFreeze, Save, eBefore, eAfter = res, Str, IsFreeze,
                                                        Save, eBefore, eAfter
        end
        if (gg.getResultCount() == 0 and not res) then
            endtimee = os.clock()
            edittime = endtimee - starttimee
            return superToast('😐没有数据可供修改！', 90)
        end
        if (not eBefore) then eBefore = ' ' end
        if (not eAfter) then eAfter = ' ' end
        _z.controlT.e.before = eBefore
        _z.controlT.e.after = eAfter
        Esearch = zsilp(Str, '|')
        if (isFreeze == nil) then isFreeze = "not Set" end
        if (isFreeze == false) then
            SetFreeze = '$false'
        else
            if (isFreeze == true or isFreeze:match('true') == 'true') then
                SetFreeze = '$true'
                if (not isFreeze) then
                    local freeO = zsilp(isFreeze, '_')
                    Fromin = zsilp(freeO[2], '~')
                    FromTo = true
                end
            end
        end
        et = {}
        for i = 1, #Esearch do
            _z.edit[i] = {}
            Etable = zsilp(Esearch[i], '_')
            e_type = checkType(Etable[2]:match('[^%:.*]'))
            if (Etable[2]:match('[A-Z]%:%{.*%}')) then
                pcall(load('needtable=' .. Etable[2]:match('[^a-zA-Z%:].*')))
                local buckt = {}
                for z, x in pairs(needtable) do
                    table.insert(buckt, res[x])
                end
                res = buckt
            end
            if (not Etable[3]) then Etable[3] = '0' end
            if Etable[1]:match('%[.*%]') then
                local setEdit = Etable[1]:match('%[.*%]')
                cSetEdit = setEdit:gsub("%[", "{"):gsub("%]", "}"):gsub('%:',
                                                                        '="')
                               :gsub('%;', '";'):gsub('增量', '["增量"]')
                tcall('cSetEdit=' .. cSetEdit)
                Etable[1] = Etable[1]:gsub(
                                stringPatch(Etable[1]:match('%[.*%]')), '')
            else
                cSetEdit = {}
                cSetEdit["增量"] = 0
            end
            et[i] = {}
            et[i].address = Etable[3]
            et[i].flags = e_type
            et[i].value = Etable[1]
            if (Etable[3] == '0') then
                for v = 1, #res do
                    _z.edit[i][v] = {}
                    et[i][v] = {}
                    if (SetFreeze == '$true') then
                        et[i][v].freeze = true
                        if FromTo == true then
                            et[i][v].freezeType = gg.FREEZE_IN_RANGE
                            et[i][v].freezeFrom = Fromin[1]
                            et[i][v].freezeTo = Fromin[2]
                        end
                    elseif (SetFreeze == '$false') then
                        et[i][v].freeze = false
                    end
                    _z.edit[i][v].freeze = SetFreeze
                    _z.edit[i][v].freezeO = IsFreeze
                    if (not Etable[2]:match('[^A-Z%:].*') or
                        Etable[2]:match('[A-Z]%:%{.*%}') or
                        tonumber(Etable[2]:match('[^A-Z%:].*')) == res[v].value) then
                        et[i][v].flags = et[i].flags
                        et[i][v].value =
                            tonumber(et[i].value) +
                                (v * tonumber(cSetEdit['增量']))
                    else
                        et[i][v].flags = res[v].flags
                        et[i][v].value = res[v].value
                    end
                    et[i][v].address = et[i].address + res[v].address
                end
                et[i].address = nil
                et[i].value = nil
                et[i].flags = nil
                et[i].freeze = nil
                et[i].freezeFrom = nil
                et[i].freezeTo = nil
                if Save or SetFreeze == '$true' or SetFreeze == '$false' then
                    gg.setValues(et[i])
                    gg.addListItems(et[i])
                else
                    gg.setValues(et[i])
                end
            else
                for v = 1, #res do
                    et[i][v] = {}
                    if (SetFreeze == '$true') then
                        et[i][v].freeze = true
                        if FromTo == true then
                            et[i][v].freezeType = gg.FREEZE_IN_RANGE
                            et[i][v].freezeFrom = Fromin[1]
                            et[i][v].freezeTo = Fromin[2]
                        end
                    end
                    if (not Etable[2]:match('[^A-Z%:].*') or
                        Etable[2]:match('[A-Z]%:%{.*%}') or
                        tonumber(Etable[2]:match('[^A-Z%:].*')) == res[v].value) then
                        et[i][v].flags = et[i].flags
                        et[i][v].value = et[i].value
                    else
                        et[i][v].flags =
                            gg.getValues(
                                {
                                    {
                                        address = res[v].address + et[i].address,
                                        flags = res[v].flags
                                    }
                                })[1].flags
                        et[i][v].value =
                            gg.getValues(
                                {
                                    {
                                        address = res[v].address + et[i].address,
                                        flags = res[v].flags
                                    }
                                })[1].value + (i * tonumber(cSetEdit['增量']))
                    end
                    et[i][v].address = et[i].address + res[v].address
                end
                et[i].address = nil
                et[i].value = nil
                et[i].flags = nil
                et[i].freeze = nil
                et[i].freezeFrom = nil
                et[i].freezeTo = nil
                if Save or SetFreeze == '$true' or SetFreeze == '$false' then
                    gg.setValues(et[i])
                    gg.addListItems(et[i])
                else
                    gg.setValues(et[i])
                end
                -- _z.edit[i].save = tostring(Save) 
                -- _z.edit[i].freeze = SetFreeze 
            end
            --[[_z.get_res[i] = {}
for n = 1,#res do _z.get_res[i][n] = {
    value = '$nil',
    address = '$nil',
    flags = '$nil'
}
_z.get_res[i][n].value = res[n].value;
_z.get_res[i][n].address = addressHex(res[n].address);
_z.get_res[i][n].flags = res[n].flags 
_z.edit[i][n].value = gg.getValues(res)[n].value
_z.edit[i][n].address = addressHex(z: getData(res, Etable[3]..'('..n, Etable[2] : match('[A-Z]'), 'address')) _z.edit[i][n].flags = z: getData(res, Etable[3]..'('..n, Etable[2] : match('[A-Z]'), 'flags') 
end ]]
        end
        local endtimee = os.clock()
        edittime = endtimee - starttimee
        tcall(eAfter)
    end
    function box:getData(od, dod, ttype, ntype)
        if od and type(od) == "table" and dod and ttype and ntype then
            if type(ttype) ~= 'number' then ttype = checkType(ttype) end
            needtodo = zsilp(string.gsub(dod, '%>%>', ''), '>')
            need_max = 0
            for i = 1, #needtodo do
                if (needtodo[i]:match('%(.*')) then
                    dod_set = zsilp(needtodo[i], '(')
                else
                    dod_set = {}
                    dod_set[1] = needtodo[i]
                    dod_set[2] = 1
                end
                need_max = dod_set[1] + need_max
            end
            needto_addr = gg.getValues(od)[tonumber(dod_set[2])].address +
                              need_max
            return
                gg.getValues({{address = needto_addr, flags = ttype}})[1][ntype]
        else
            gg.toast("getData参数错误，请检查")
        end
    end
    --[[function box:log(Boolean) if Boolean == true then all_se = ''all_ed = ''
for i = 1,#_z.search do all_se = concatTable({
    all_se,
    '%n 模式:',
    _z.search[i].model,
    '  [极速搜索:',
    _z.search[i].fastS,
    ' ]%n 第',
    _z.search[i].time,
    '次搜索:',
    _z.search[i].code,
    '%n 类型:',
    _z.search[i].type,
    '%n 结果数:',
    _z.search[i].count,
    '%n'
}) end
for i = 1,
#_z.edit do
for n = 1,
#_z.edit[i] do
if _z.edit[i][n].freezeO == nil then _z.edit[i][n].freezeO = '$nil'end
if _z.edit[i][n].freeze == nil then _z.edit[i][n].freeze = '$false'end
if _z.edit[i][n].save == nil then _z.edit[i][n].save = '$false'end
if _z.get_res[i] == nil then _z.get_res[i] = {}
_z.get_res[i].value = '0'_z.get_res[i].address = '$nil'_z.get_res[i].flags = '$nil'end all_ed = concatTable({
    all_ed,
    '%n 数值变动:',
    _z.get_res[i][n].value,
    '→',
    _z.edit[i][n].value,
    '%n 地址变动:',
    _z.get_res[i][n].address,
    '→',
    _z.edit[i][n].address,
    '%n 类型变动:',
    _z.get_res[i][n].flags,
    '→',
    _z.edit[i][n].flags,
    '%n 冻结:',
    tostring(_z.edit[i][n].freeze),
    ' 范围:',
    tostring(_z.edit[i][n].freezeO),
    '   保存:',
    tostring(_z.edit[i].save),
    '%n'
}) end end print('%n %n 📑>>〔日志收集器〕[_zlibraryLog] >>%n', '   ｜  GG版本:', _z.INFO.YOU_GG, '  ｛｝ 库版本:', _z.INFO.LIBRARY_VERSION, '%n  ｜  当前进程:', _z.INFO.NOW_PROCESS, '%n ', '===================%n', '%n【设置的内存范围:', _z.region: gsub('gg.REGION_', ''), '%n【搜索:  ', all_se, '%n【选取结果:', _z.get_res.much, '%n【修改的数据:', all_ed, '%n===================%n  🚩Data from[ _z ]') 
return true 
elseif(Boolean == nil) then 
_z = nil
else 
return false 
end end ]]
    local temp = c_R()
    return temp:In(box)
end
z = _box_(_z, isSave)
function zsearch(tSet)
    exitz = false;
    local search = '搜索改善'
    local regiO = '内存范围'
    local getN = '获取结果'
    local editN = '修改数据'
    local cleaL = '清理结果'
    local freeZ = '冻结数据'
    local saveL = '保存结果'
    local control = '控制中心'
    local sModle = '普通(精确)搜索'
    local echoL = '输出日志'
    controlT = {s = {before = '', after = ''}, e = {before = '', after = ''}}
    local et = {}
    if (tSet[regiO] == nil) then
        doRegion = nil;
    else
        setRegion(tSet[regiO])
        _z.region = tSet[regiO]
    end
    if (tSet[cleaL] ~= nil) then
        if (tSet[cleaL] == 1) then
            clean_sta = 'gg.clearResults()';
            clean_end = 'gg.clearResults()';
            _z.cleanmodel.model = tSet[cleaL]
            _z.cleanmodel.exp = '搜索前修改后清理'
        end
        if (tSet[cleaL] == 2) then
            clean_sta = 'gg.clearResults()';
            clean_end = '';
            _z.cleanmodel.model = tSet[cleaL]
            _z.cleanmodel.exp = '搜索前清理'
        end
        if (tSet[cleaL] == 3) then
            clean_sta = '';
            clean_end = 'gg.clearResults()';
            _z.cleanmodel.model = tSet[cleaL]
            _z.cleanmodel.exp = '修改后清理'
        end
        if (tSet[cleaL] == 4) then
            clean_sta = '';
            clean_end = '';
            _z.cleanmodel.model = tSet[cleaL]
            _z.cleanmodel.exp = '不清理'
        end
    else
        clean_sta = 'gg.clearResults()';
        clean_end = '';
        _z.cleanmodel.model = tSet[cleaL]
        _z.cleanmodel.exp = '搜索前清理'
    end
    if (tSet[control] ~= nil) then
        cCmd = zsilp(tSet[control], '|')
        for i = 1, #cCmd do
            if (cCmd[i]:match('%:s%:') == '%:s%:') then
                cCmd[i] = cCmd[i]:gsub('%:s%:', '|')
                cmd_s = zsilp(cCmd[i], '|')
                if (cmd_s[1]:gsub('%s', '') == 'before') then
                    controlT.s.before = cmd_s[2]
                else
                    if (cmd_s[1]:gsub('%s', '') == 'after') then
                        controlT.s.after = cmd_s[2]
                    end
                end
            else
                if (cCmd[i]:match('%:e%:') == '%:e%:') then
                    cCmd[i] = cCmd[i]:gsub('%:e%:', '|')
                    cmd_e = zsilp(cCmd[i], '|')
                    if (cmd_e[1]:gsub('%s', '') == 'before') then
                        controlT.e.before = cmd_e[2]
                    else
                        if (cmd_e[1]:gsub('%s', '') == 'after') then
                            controlT.e.after = cmd_e[2]
                        end
                    end
                end
            end
        end
    end
    z = _box_(_z, tSet[echoL])
    pcall(load(clean_sta))
    zs_res = z:s(tSet[search], tSet[getN], controlT.s.before, controlT.s.after)
    if (tSet[editN]) then
        z:e(zs_res, tSet[editN], tSet[freeZ], tSet[saveL], controlT.e.before,
            controlT.e.after)
    end
    pcall(load(clean_end))
    if (tSet['输出日志'] == true) then z:log(true) end
    doRegion = nil
    onRegion = nil
    res = nil
    Sch = nil
    t_type = nil
    cCmd = nil
    clean_sta = nil
    clean_end = nil
    Search = nil
    Esearch = nil
    e_type = nil
    FromTo = nil
    SetFreeze = nil
    Etable = nil
    exitz = nil
    all_se = nil
    all_ed = nil
    return _z
end
if SHOW_INFO then
    local percent = {}
    for i = 1, 100 do table.insert(percent, ' loading.. ]' .. i .. '%') end
    superToast('%n[///////////////////', nil, percent)
    superToast('%n>>🚀GG-luaz Library Loaded Successfully%n>>  VERSION:' ..
                   _z.INFO.LIBRARY_VERSION, 90)
end
ZZBase64 = {}
local string = string
ZZBase64.__code = {
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
    'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd',
    'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
    't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7',
    '8', '9', '+', '/'
};
ZZBase64.__decode = {}
for k, v in pairs(ZZBase64.__code) do
    ZZBase64.__decode[string.byte(v, 1)] = k - 1
end
function ZZBase64.encode(text)
    local len = string.len(text)
    local left = len % 3
    len = len - left
    local res = {}
    local index = 1
    for i = 1, len, 3 do
        local a = string.byte(text, i)
        local b = string.byte(text, i + 1)
        local c = string.byte(text, i + 2)
        local num = a * 65536 + b * 256 + c
        for j = 1, 4 do
            local tmp = math.floor(num / (2 ^ ((4 - j) * 6)))
            local curPos = tmp % 64 + 1
            res[index] = ZZBase64.__code[curPos]
            index = index + 1
        end
    end
    if left == 1 then
        ZZBase64.__left1(res, index, text, len)
    elseif left == 2 then
        ZZBase64.__left2(res, index, text, len)
    end
    return table.concat(res)
end
function ZZBase64.__left2(res, index, text, len)
    local num1 = string.byte(text, len + 1)
    num1 = num1 * 1024
    local num2 = string.byte(text, len + 2)
    num2 = num2 * 4
    local num = num1 + num2
    local tmp1 = math.floor(num / 4096)
    local curPos = tmp1 % 64 + 1
    res[index] = ZZBase64.__code[curPos]
    local tmp2 = math.floor(num / 64)
    curPos = tmp2 % 64 + 1
    res[index + 1] = ZZBase64.__code[curPos]
    curPos = num % 64 + 1
    res[index + 2] = ZZBase64.__code[curPos]
    res[index + 3] = "="
end
function ZZBase64.__left1(res, index, text, len)
    local num = string.byte(text, len + 1)
    num = num * 16
    tmp = math.floor(num / 64)
    local curPos = tmp % 64 + 1
    res[index] = ZZBase64.__code[curPos]
    curPos = num % 64 + 1
    res[index + 1] = ZZBase64.__code[curPos]
    res[index + 2] = "="
    res[index + 3] = "="
end
function ZZBase64.decode(text)
    local len = string.len(text)
    local left = 0
    if string.sub(text, len - 1) == "==" then
        left = 2
        len = len - 4
    elseif string.sub(text, len) == "=" then
        left = 1
        len = len - 4
    end
    local res = {}
    local index = 1
    local decode = ZZBase64.__decode
    for i = 1, len, 4 do
        local a = decode[string.byte(text, i)]
        local b = decode[string.byte(text, i + 1)]
        local c = decode[string.byte(text, i + 2)]
        local d = decode[string.byte(text, i + 3)]
        local num = a * 262144 + b * 4096 + c * 64 + d
        local e = string.char(num % 256)
        num = math.floor(num / 256)
        local f = string.char(num % 256)
        num = math.floor(num / 256)
        res[index] = string.char(num % 256)
        res[index + 1] = f
        res[index + 2] = e
        index = index + 3
    end
    if left == 1 then
        ZZBase64.__decodeLeft1(res, index, text, len)
    elseif left == 2 then
        ZZBase64.__decodeLeft2(res, index, text, len)
    end
    return table.concat(res)
end
function ZZBase64.__decodeLeft1(res, index, text, len)
    local decode = ZZBase64.__decode
    local a = decode[string.byte(text, len + 1)]
    local b = decode[string.byte(text, len + 2)]
    local c = decode[string.byte(text, len + 3)]
    local num = a * 4096 + b * 64 + c
    local num1 = math.floor(num / 1024) % 256
    local num2 = math.floor(num / 4) % 256
    res[index] = string.char(num1)
    res[index + 1] = string.char(num2)
end
function ZZBase64.__decodeLeft2(res, index, text, len)
    local decode = ZZBase64.__decode
    local a = decode[string.byte(text, len + 1)]
    local b = decode[string.byte(text, len + 2)]
    local num = a * 64 + b
    num = math.floor(num / 16)
    res[index] = string.char(num)
end
function mergeFile(hashfile1, hashfile2, hashout)
    if (not hashfile1 or not hashfile2) then
        print('ERROR:Cannot open a null hash file')
        return nil
    end
    local file1 = io.open(hashfile1, 'r'):read("*a")
    if (not file1) then
        print('ERROR:Cannot open ' .. hashfile1)
        return nil
    end
    local file2 = io.open(hashfile2, 'r'):read("*a")
    if (not file2) then
        file1:close()
        print('ERROR:Cannot open ' .. hashfile2)
        return nil
    end
    local out = io.open(hashout, 'w+')
    out:write(file1)
    out:write(string.dump(loadfile(hashfile2)):gsub("LuaR", "zzer"))
    out:close()
    local out = io.open(hashout, 'r')
    local outfile = out:read("*a")
    out:close()
    local out = io.open(hashout, 'w')
    out:write(ZZBase64.encode(outfile))
    out:close()
    return true
end
function mergeFile(hashfile1, hashfile2, hashout)
    if (not hashfile1 or not hashfile2) then
        print('ERROR:Cannot open a null hash file')
        return nil
    end
    local file1 = io.open(hashfile1, 'r'):read("*a")
    if (not file1) then
        print('ERROR:Cannot open ' .. hashfile1)
        return nil
    end
    local file2 = io.open(hashfile2, 'r'):read("*a")
    if (not file2) then
        file1:close()
        print('ERROR:Cannot open ' .. hashfile2)
        return nil
    end
    local out = io.open(hashout, 'w+')
    out:write(file1)
    out:write(string.dump(loadfile(hashfile2)):gsub("LuaR", "zzer"))
    out:close()
    local out = io.open(hashout, 'r')
    local outfile = out:read("*a")
    out:close()
    local out = io.open(hashout, 'w')
    out:write(ZZBase64.encode(outfile))
    out:close()
    return true
end
