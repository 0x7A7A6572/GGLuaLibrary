 local FRAME_VISION = '////////////////////V2.4/////'  

local WRITER = '///////////////////////////////zzer/////'

local GG_VISION = '////////////////////////8.71.1////'  

local ANDROID = '/////////////////Mi-9.0-ROOT///// '  

local GGLUA_WEB = '//////////////gg.zzerx.cn/////'  

local FIRST_LAST= '/////////18/9/20-19/1/14/////'     

    

_z={

  search={{code=' ',type=' ',model=' ',count=0,time=''},time=0,count=0},

  get_res={},

  edit={{{value='',address='',type='',freeze=true,freezeO='$nil',save=false}},value=' ',address=' ',type=' '},

  region='默认',

  info={},

  localDate={{address="",flags="",code_s="",code_e=""}}

}

function concatTable(t)

  function getTableLens(t)

    local lens

    for k, v in pairs(t) do

      lens=k

    end

    return lens

  end

  echoStr=' ';

  for i=1,getTableLens(t) do

    if not t[i] then t[i]=' $nil ' end

    echoStr=echoStr..t[i]

  end

  return echoStr

end

function tcall(loadoj)

  if not loadoj then

    local loadoj=' '

  end

  fun=load(loadoj)

  if(fun)then

    fun()

  end

end

function zsilp(strn,chars)

  strSun = {} ongsubs,gsubs = string.gsub(strn,chars,chars)

  for i = 0, gsubs do

    wi=string.find(ongsubs,chars);

    if(wi == nil)then

      wi = -1

    end

    acc=string.sub(ongsubs,1,wi)

    table.insert(strSun,(string.gsub(acc,chars,'')) ); ongsubs=string.sub(ongsubs,wi+1,-1) ;

  end

  return strSun

end

function addzygote(Max,youVoid) 

     zy_string=' '   

     need=math.ceil((Max-youVoid)/2) 

       for ai=1,need do 

         zy_string=zy_string..' ' 

           end   

              return zy_string   

      end 

function superToast(itable,time)  

if not time then time=1000 end

local hsong={}  

local  max=0 

  if(type(itable)=='string')then

 local table_toast= zsilp(itable,'')

 for i=1,#table_toast do

 table.insert(hsong,table_toast[i])

 gg.toast(table.concat(hsong,''))

 gg.sleep(time)

 end

  else

  for g=1,#itable do 

  if(#itable[g]>=max)then 

  max=#itable[g] 

  end 

  end

    for i=1,#itable do

     before_z=addzygote(max,#itable[i])

      after_z=addzygote(max,#itable[i])  

       table.insert(hsong,#itable[i]) 

          hsong[i]=before_z ..itable[i] ..after_z    

           gg.toast('\n'..table.concat(hsong,'\n')) 

              gg.sleep(time)  

                  end  

            end

   end   

function checkType(stype,ojname)

  if(stype=='DW' or stype=='D' )then

    ojname =gg.TYPE_DWORD;

   else

    if(stype=='DO' or stype=='E' )then

      ojname=gg.TYPE_DOUBLE;

     else

      if(stype=='F')then

        ojname=gg.TYPE_FLOAT;

       else

        if(stype=='B')then

          ojname=gg.TYPE_BYTE;

         else

          if(stype=='W')then

            ojname=gg.TYPE_WORD;

           else

            if(stype=='X')then

              ojname=gg.TYPE_XOR;

             else

              if(stype=='Q')then

                ojname=gg.TYPE_QWORD;

               else

                if(stype=='A' or stype ==nil )then

                  ojname=gg.TYPE_AUTO;

                 else

                  ojname=gg.TYPE_AUTO;

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

  local onRegion={}

  doRegion=zsilp(thisR ,'|')

  

  for i=1,#doRegion do

    

    

    if(doRegion[i]=='B')then

      table.insert(onRegion,'gg.REGION_BAD')

     else if(doRegion[i]=='A')then

        table.insert(onRegion,'gg.REGION_ANONYMOUS')

       else if(doRegion[i]=='As')then

          table.insert(onRegion,'gg.REGION_ASHMEM')

         else if(doRegion[i]=='Ca')then

            table.insert(onRegion,'gg.REGION_C_ALLOC')

           else if(doRegion[i]=='Cb')then

              table.insert(onRegion,'gg.REGION_C_BSS')

             else if(doRegion[i]=='Cd')then

                table.insert(onRegion,'gg.REGION_C_DATA')

               else if(doRegion[i]=='Ch')then

                  table.insert(onRegion,'gg.REGION_C_HEAP')

                 else if(doRegion[i]=='Xa')then

                    table.insert(onRegion,'gg.REGION_CODE_APP')

                   else if(doRegion[i]=='Xs')then

                      table.insert(onRegion,'gg.REGION_CODE_SYS')

                     else if(doRegion[i]=='J')then

                        table.insert(onRegion,'gg.REGION_JAVA')

                       else if(doRegion[i]=='Jh')then

                          table.insert(onRegion,'gg.REGION_JAVA_HEAP')

                         else if(doRegion[i]=='O')then

                            table.insert(onRegion,'gg.REGION_OTHER')

                           else if(doRegion[i]=='PS')then

                              table.insert(onRegion,'gg.REGION_PPSSPP')

                             else if(doRegion[i]=='S')then

                                table.insert(onRegion,'gg.REGION_STACK')

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

  

  if doRegion~=nil then

    doRegion=table.concat(onRegion,' | ')

    

    return pcall(load("gg.setRanges\(".. doRegion .. "\)"))

  end

end

function c_R()

  local R ={x,y}

  function R:In(o)

    o=o or {}

    setmetatable(o,self)

    self._index=self

    return o

  end

  return R

end

function _box_(_z,isSave)

  local box = {}

  function box:c()

    return gg.clearResults()

  end

  function box:r(rR)

    return setRegion(rR)

  end

  function box:s(str,get,doBefore,doAfter)

    local d={}

    if(str~=nil)then

      local xs=zsilp(str,'|');

      if(doBefore==nil)then doBefore=' ' end

      if(doAfter==nil)then doAfter=' ' end

      tcall(doBefore)

      for s=1,#xs do

        _z.search[s]={}

        Sch=zsilp(xs[s] ,"_")

        if(Sch[2]~=nil)then

          Sch2_nex=string.match(Sch[2],'\(.\)')

          

          

          t_type=checkType(Sch[2])

         else

          Sch[2]='jump'

        end

        if(Sch[3]==nil)then Sch[3]=' ' end

        if(string.match(Sch[3],'%$')=='$')then

          local misk=string.match(Sch[3],'0x.*')

          if(misk==nil)then misk=-1 end

          local g_ss=string.gsub(Sch[1],'%?','')

          local andAdd=zsilp(g_ss,';')

          if("?"..andAdd[1]~=Sch[1])then

            

            add = gg.getResults(gg.getResultCount())

            for i=1,#andAdd do

              for r=1,#add do

                

                if( string.match(string.format('%#x',add[r].address,16),andAdd[i],-#andAdd[i])==nil )then

                  d[r]={}

                  d[r].address=add[r].address

                  d[r].flags=add[r].flags

                 else

                  d[r]={}

                end

              end

              for z,v in pairs(andAdd) do

                for k in pairs(d) do

                  if d[k].flags==nil or string.match(string.format('%#x',d[k].address,16),v,-#v) then d[k]=nil end

                  

                end

              end

            end

            

            gg.removeResults(d)

          end

      

          if("?"..andAdd[1]==Sch[1])then

            

            

            gg.searchAddress(Sch[1],misk,t_type, gg.SIGN_EQUAL, 0, -1)

          end

          _z.search[s].model='searchAddress'

         else if(string.match(Sch[2],'%*')=='*')then

            

            local maxz=Sch[1]

            local maxz_res=gg.getResults(gg.getResultCount())

            

            if(gg.getResultCount()==0)then return gg.alert("当前结果数为0/指针搜索不能是首次搜索")

            end

            

            maxzz=maxz_res[1].address

            

            

            local maxnum=maxzz-maxz ..'~'..maxzz

            

            z:c()

            gg.searchNumber(maxnum, gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)

            

            _z.search[s].model='searchNumber(指针搜索)'

           else if(string.match(Sch[1],'\>\>')=='\>\>')then

              

              Sch1_addr=zsilp(string.gsub(Sch[1],'\>\>',''),'>')

              

              for i=1,#Sch1_addr do

                thisValue=gg.getResults(1)

                thisAddr=thisValue[1].address+Sch1_addr[i]

                z:c()

                

                gg.searchAddress('"'..string.format('%X',thisAddr,16)..'"',-1,t_type, gg.SIGN_EQUAL, 0, -1);

              end

              _z.search[s].model='searchAddress(多级地址跳转)'

             else

              

              gg.searchNumber(Sch[1],t_type, false, gg.SIGN_EQUAL, 0, -1);

              _z.search[s].model='searchNumber'

            end

          end

        end

        

        _z.search[s].code=Sch[1]

        _z.search[s].type=Sch[2]

        _z.search[s].count=gg.getResultCount()

        _z.search.count=_z.search[s].count

        _z.search.time=s

        _z.search[s].time=s

        

        

        tcall(doAfter)

        

        if(gg.getResultCount()==0)then

          return gg.toast('Not Result')

          

        end

      end

      

      if(get~=nil)then

        zs_res=gg.getResults(get);

        _z.get_res.much=get

        return zs_res

       else

        zs_res=gg.getResults(gg.getResultCount());

        _z.get_res.much=gg.getResultCount()

        return zs_res

      end

    end

  end

  

  

  function box:e(res,Str,IsFreeze,Save,eBefore,eAfter)

    

    if(type(res)~='table')then

      res,Str,isFreeze,Save,eBefore,eAfter=zs_res,res,Str,IsFreeze,Save,eBefore

     else

      res,Str,isFreeze,Save,eBefore,eAfter=res,Str,IsFreeze,Save,eBefore,eAfter

    end

    

    if(gg.getResultCount()==0)then

      return gg.toast('Not Result to edit!')

      

    end

    

    

    

    if(not eBefore)then eBefore=' ' end

    if(not eAfter)then eAfter=' ' end

    Esearch=zsilp(Str,'|')

    

    if(not isFreeze)then

      SetFreeze='$false'

     else if(isFreeze or isFreeze:match('true')=='true' )then

        SetFreeze='$true'

        if(isFreeze~=true)then

          local freeO=zsilp(isFreeze,'_')

          

          Fromin=zsilp(freeO[2],'~')

          FromTo=true

        end

      end

    end

    et={}

    for i=1,#Esearch do

      

      Etable=zsilp(Esearch[i],'_')

      e_type=checkType(Etable[2]:match('[^\:.*]'))

    

      if(not Etable[3])then

        Etable[3]=0

      end

      et[i] = {}

      et[i].address = Etable[3]

      et[i].flags = e_type

      et[i].value = Etable[1]

      if(Etable[3]==0)then

        for v=1,#res do

          et[i][v]={}

          if(SetFreeze=='$true')then

            et[i][v].freeze=true

            if FromTo==true then

              et[i][v].freezeType= gg.FREEZE_IN_RANGE

              et[i][v].freezeFrom =Fromin[1]

              et[i][v].freezeTo = Fromin[2]

            end

          end

          et[i][v].address=et[i].address+res[v].address

          et[i][v].flags=et[i].flags

          et[i][v].value=res[i].value

          

       

        end

        et[i].address=nil

        et[i].value=nil

        et[i].flags=nil

        et[i].freeze=nil

        et[i].freezeFrom=nil

        et[i].freezeTo=nil

        if Save then

        

          gg.setValues(et[i])

          gg.addListItems(et[i])

         else

          gg.setValues(et[i])

        end

        gg.editAll(Etable[1],e_type)

       else

        for v=1,#res do

          et[i][v]={}

          

          

          if(SetFreeze=='$true' )then

            et[i][v].freeze=true

            if FromTo==true then

              et[i][v].freezeType= gg.FREEZE_IN_RANGE

              et[i][v].freezeFrom =Fromin[1]

              et[i][v].freezeTo = Fromin[2]

            end

          end

          et[i][v].address=et[i].address+res[v].address

          

        

     if(Etable[2]:match('[^a-zA-Z\:].*')==nil or tonumber(Etable[2]:match('[^a-zA-Z\:].*'),10)==res[v].value )then

          et[i][v].flags=et[i].flags

          et[i][v].value=et[i].value

       

          else

          et[i][v].flags=res[v].flags

          et[i][v].value=res[v].value

          

          end

        end

        et[i].address=nil

        et[i].value=nil

        et[i].flags=nil

        et[i].freeze=nil

        et[i].freezeFrom=nil

        et[i].freezeTo=nil

        

        

        

        

        if Save then

          

          gg.setValues(et[i])

          gg.addListItems(et[i])

         else

          gg.setValues(et[i])

        end

      end

      

    end

    

    tcall(eAfter)

  end

  local temp =c_R()

  return temp:In(box)

end

z=_box_(_z,isSave)

function zsearch(tSet)

  exitz=false;

  local search='搜索改善'

  local regiO ='内存范围'

  local getN ='获取结果'

  local editN ='修改数据'

  local cleaL='清理结果'

  local freeZ ='冻结数据'

  local saveL='保存结果'

  local control='控制中心'

  local sModle='普通(精确)搜索'

  local echoL='输出日志'

  controlT={s={before='',after=''},e={before='',after=''}}

  local et={}

  _z={

    cleanmodel={exp='搜索前清理',model=2},

    search={{code=' ',type=' ',model=' ',count=0,time=''},time=0,count=0},

    get_res={},

    edit={{{value='',address='',type='',freeze=true,freezeO='$nil',save=false}},value=' ',address=' ',type=' '},

    region='默认',

    info={}

  }

  

  

  if(tSet[regiO] == nil)then

    doRegion=nil;

   else

    setRegion(tSet[regiO])

    _z.region=tSet[regiO]

  end

  

  if (tSet[cleaL]~=nil)then

    if(tSet[cleaL]==1)then

      clean_sta= 'gg.clearResults()';

      clean_end='gg.clearResults()';

      

      _z.cleanmodel.model=tSet[cleaL]

      _z.cleanmodel.exp='搜索前修改后清理'

    end

    if(tSet[cleaL]==2)then

      clean_sta='gg.clearResults()';

      clean_end='';

      

      _z.cleanmodel.model=tSet[cleaL]

      _z.cleanmodel.exp='搜索前清理'

    end

    if(tSet[cleaL]==3)then

      clean_sta='';

      clean_end='gg.clearResults()';

      

      _z.cleanmodel.model=tSet[cleaL]

      _z.cleanmodel.exp='修改后清理'

    end

    if(tSet[cleaL]==4)then

      clean_sta=''; clean_end='';

      

      _z.cleanmodel.model=tSet[cleaL]

      _z.cleanmodel.exp='不清理'

    end

   else

    clean_sta='gg.clearResults()';

    clean_end='';

  end

  if(tSet[control]~=nil)then

    cCmd=zsilp(tSet[control],'|')

    

    for i=1,#cCmd do

      if(cCmd[i]:match('\:s\:')=='\:s\:')then

        cCmd[i]=cCmd[i]:gsub('\:s\:','|')

        cmd_s=zsilp(cCmd[i],'|')

        if(cmd_s[1]:gsub('%s','')=='before')then

          controlT.s.before=cmd_s[2]

         else if(cmd_s[1]:gsub('%s','')=='after')then

            controlT.s.after=cmd_s[2]

          end

        end

       else if(cCmd[i]:match('\:e\:')=='\:e\:')then

          cCmd[i]=cCmd[i]:gsub('\:e\:','|')

          cmd_e=zsilp(cCmd[i],'|')

          if(cmd_e[1]:gsub('%s','')=='before')then

            controlT.e.before=cmd_e[2]

           else if(cmd_e[1]:gsub('%s','')=='after')then

              controlT.e.after=cmd_e[2]

            end

          end

        end

      end

    end

    

  end

  

  

  z=_box_(_z,tSet[echoL])

  

  pcall(load(clean_sta))

  z:s(tSet[search],tSet[getN],controlT.s.before,controlT.s.after)

  z:e(tSet[editN],tSet[freeZ],tSet[saveL],controlT.e.before,controlT.e.after)

  pcall(load(clean_end))

  

  all_se=''

  all_ed=''

  for i=1,#_z.search do

    

    

    all_se=concatTable({all_se,'\n    模式:', _z.search[i].model,'\n    第',_z.search[i].time, '次搜索:', _z.search[i].code , '\n    类型:', _z.search[i].type,'\n    结果数:', _z.search[i].count ,'\n'})

  end

  

  for i=1,#_z.edit do

    for n=1,#_z.edit[i] do

      

      if _z.edit[i][n].freezeO==nil then _z.edit[i][n].freezeO='$nil' end

      if _z.edit[i][n].freeze==nil then _z.edit[i][n].freeze='$false' end

      if _z.edit[i][n].save==nil then _z.edit[i][n].save='$false' end

      if _z.get_res[i]==nil then _z.get_res[i]={} _z.get_res[i].value='0' _z.get_res[i].address='$nil' _z.get_res[i].flags='$nil' end

      

      all_ed=concatTable({all_ed,'\n    数值变动:',_z.get_res[i].value,'→'.._z.edit[i][n].value,'\n    地址变动:',_z.get_res[i].address,'→',_z.edit[i][n].address,'\n    类型变动:',_z.get_res[i].flags,'→',_z.edit[i][n].type,'\n    冻结:',tostring(_z.edit[i][n].freeze) ,'    范围:',tostring(_z.edit[i][n].freezeO) ,'   保存:',tostring(_z.edit[i][n].save),'\n'})

    end

  end

  if(tSet['输出日志']==true)then

    print('\n\n🗃>>日志收集器 >>\n===================\n数据取自表→[ _z ]','\n【设置的内存范围:',_z.region:gsub('gg.REGION_','') ,'\n【搜索:  ',all_se,'\n【选取结果:', _z.get_res.much,'\n【修改的数据:', all_ed,'\n===================\n')

    

  end

  all_se=nil all_ed=nil

  

  

  doRegion=nil onRegion=nil res=nil Sch=nil t_type=nil cCmd=nil clean_sta=nil clean_end=nil Search=nil Esearch=nil e_type=nil FromTo=nil SetFreeze=nil Etable=nil exitz=nil

  return _z

end

