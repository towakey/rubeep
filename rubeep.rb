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
        when 'lf' then hz=-16   #ファ
        when 'lf#' then hz=-15  #ファ#
        when 'lg' then hz=-14   #ソ
        when 'lg#' then hz=-13  #ソ#
        when 'la' then hz=-12   #ラ
        when 'la#' then hz=-11  #ラ#
        when 'lb' then hz=-10   #シ
        when 'c' then hz=-9     #ド
        when 'c#' then hz=-8    #ド#
        when 'd' then hz=-7     #レ
        when 'd#' then hz=-6    #レ#
        when 'e' then hz=-5     #ミ
        when 'f' then hz=-4     #ファ
        when 'f#' then hz=-3    #ファ#
        when 'g' then hz=-2     #ソ
        when 'g#' then hz=-1    #ソ#
        when 'a' then hz=0      #ラ
        when 'a#' then hz=1     #ラ#
        when 'b' then hz=2      #シ
        when 'hc' then hz=3     #ド
        when 'hc#' then hz=4    #ド#
        when 'hd' then hz=5     #レ
        when 'hd#' then hz=6    #レ#
        when 'he' then hz=7     #ミ
        when 'hf' then hz=8     #ファ
        when 'hf#' then hz=9    #ファ#
        when 'hg' then hz=10    #ソ
        when 'hg#' then hz=11   #ソ#
        when 'ha' then hz=12    #ラ
        when 'ha#' then hz=13   #ラ#
        when 'hb' then hz=14    #シ
        else hz=0
        end
        @bp.call(440*(2**(hz.to_f/12)),time)
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