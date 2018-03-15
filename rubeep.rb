require 'Win32API'

class Rubeep
    def initialize
        @bp=Win32API.new('kernel32',"Beep",%w(i i),'i')
        @basic_time=1000
    end
    def load(fn)
        p fn
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
        when 'lf' then hz=175   #ファ
        when 'lg' then hz=196   #ソ
        when 'la' then hz=220   #ラ
        when 'lb' then hz=247   #シ
        when 'c' then hz=262    #ド
        when 'd' then hz=294    #レ
        when 'e' then hz=329    #ミ
        when 'f' then hz=349    #ファ
        when 'g' then hz=392    #ソ
        when 'a' then hz=440    #ラ
        when 'b' then hz=494    #シ
        when 'hc' then hz=523   #ド
        when 'hd' then hz=587   #レ
        when 'he' then hz=659   #ミ
        when 'hf' then hz=698   #ファ
        when 'hg' then hz=784   #ソ
        when 'ha' then hz=880   #ラ
        when 'hb' then hz=988   #シ
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