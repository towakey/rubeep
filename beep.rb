require 'Win32API'

class Beep
    def initialize
        @bp=Win32API.new('kernel32',"Beep",%w(i i),'i')
    end
    def beep(scale,time)
        case scale
        when 'lf' then
            hz=294
        when 'lg' then
            hz=330
        when 'la' then
            hz=370
        when 'lb' then
            hz=415
        when 'c' then   #ド
            hz=440
        when 'd' then   #レ
            hz=494
        when 'e' then   #ミ
            hz=554
        when 'f' then   #ファ
            hz=587
        when 'g' then   #ソ
            hz=659
        when 'a' then   #ラ
            hz=740
        when 'b' then   #シ
            hz=830
        when 'hc' then  #ド
            hz=880
        when 'hd' then
            hz=988
        when 'he' then
            hz=1109
        when 'hf' then
            hz=1175
        when 'hg' then
            hz=1319
        when 'ha' then
            hz=1480
        when 'hb' then
            hz=1661
        else
        end
        @bp.call(hz,time)
    end
end

beep=Beep.new
beep.beep('d',1000)     #レ
beep.beep('g',1000)     #ソ
beep.beep('hc',2000)    #hドー
beep.beep('a',500)      #ラ
beep.beep('hd',1000)    #hレ
beep.beep('e',1000)     #ミ
beep.beep('la',2000)     #lラ

