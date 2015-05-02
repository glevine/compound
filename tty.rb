class Tty
    class << self
        def cyan; bold 36; end
        def gray; bold 37; end
        def green; bold 32; end
        def yellow; bold 33; end
        def red; bold 31; end
        def reset; escape 0; end

        private

        def color n
            escape "0;#{n}"
        end

        def bold n
            escape "1;#{n}"
        end

        def escape n
            "\033[#{n}m" if $stdout.tty?
        end
    end
end
