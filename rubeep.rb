require 'Win32API'

class Rubeep
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

=begin
rubeep=Rubeep.new
rubeep.beep('c',1000)     #ド
rubeep.beep('d',1000)     #レ
rubeep.beep('e',1000)     #ミ
rubeep.beep('f',1000)     #ファ
rubeep.beep('g',1000)     #ソ
rubeep.beep('a',1000)     #ラ
rubeep.beep('b',1000)     #シ
rubeep.beep('hc',1000)    #ド
=end