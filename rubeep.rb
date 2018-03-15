require 'Win32API'

class Rubeep
    def initialize
        @bp=Win32API.new('kernel32',"Beep",%w(i i),'i')
        @basic_time=1000
    end
    def load(fn)
        @arr=[]
        File.open(fn,mode='rt:utf-8'){|f|
            @arr=f.readlines
        }
    end
    def play
        @arr.each{|melody|
            self.beep(melody.chomp!,@basic_time)
        }
    end
    def beep(scale,time)
        case scale
        when 'lf' then hz=294
        when 'lg' then hz=330
        when 'la' then hz=370
        when 'lb' then hz=415
        when 'c' then hz=440    #ド
        when 'd' then hz=494    #レ
        when 'e' then hz=554    #ミ
        when 'f' then hz=587    #ファ
        when 'g' then hz=659    #ソ
        when 'a' then hz=740    #ラ
        when 'b' then hz=830    #シ
        when 'hc' then hz=880   #ド
        when 'hd' then hz=988
        when 'he' then hz=1109
        when 'hf' then hz=1175
        when 'hg' then hz=1319
        when 'ha' then hz=1480
        when 'hb' then hz=1661
        else hz=0
        end
        @bp.call(hz,time)
    end
end

begin
    rubeep=Rubeep.new
    rubeep.load('rubeep.txt')
    rubeep.play
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