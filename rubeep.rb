require 'Win32API'

class Rubeep
    def initialize
        @bp=Win32API.new('kernel32',"Beep",%w(i i),'i')
        @basic_time=1000
    end
    def load(fn)
        p fn
        @line=[]
        File.open(fn,mode='rt:utf-8'){|lines|
            @line=lines.readlines
        }
    end
    def play
        @line.each{|row|
            block=[]
            block = row.chomp!.split(",")
            block.each{|unit|
                melody = unit.to_s.split(":")[0]
                scale = unit.to_s.split(":")[1]
                self.beep(melody,scale,@basic_time)
            }
        }
    end
    def beep(melody,scale,time)
        case melody
        when 'c' then hz=-9+(scale.to_i*12)     #ド
        when 'c#' then hz=-8+(scale.to_i*12)    #ド#
        when 'd' then hz=-7+(scale.to_i*12)     #レ
        when 'd#' then hz=-6+(scale.to_i*12)    #レ#
        when 'e' then hz=-5+(scale.to_i*12)     #ミ
        when 'f' then hz=-4+(scale.to_i*12)     #ファ
        when 'f#' then hz=-3+(scale.to_i*12)    #ファ#
        when 'g' then hz=-2+(scale.to_i*12)     #ソ
        when 'g#' then hz=-1+(scale.to_i*12)    #ソ#
        when 'a' then hz=0+(scale.to_i*12)      #ラ
        when 'a#' then hz=1+(scale.to_i*12)     #ラ#
        when 'b' then hz=2+(scale.to_i*12)      #シ
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