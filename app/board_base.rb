
require "app/base.rb"

BOARD_SPACE_WIDTH = 16
BOARD_SPACE_HEIGHT = 16
BOARD_COLS = (SCR_WIDTH / BOARD_SPACE_WIDTH).floor()
BOARD_ROWS = (SCR_HEIGHT / BOARD_SPACE_HEIGHT).floor()
BOARD_LEFT = ((SCR_WIDTH - BOARD_SPACE_WIDTH * BOARD_COLS) / 2).floor()
BOARD_TOP = ((SCR_HEIGHT - BOARD_SPACE_HEIGHT * BOARD_ROWS) / 2).floor()
BOARD_BG = [0, 63, 0]


class BoardPieceEntity < Entity
    attr_sprite
    attr :cell_x, :cell_y

    def initialize id, x, y, path
        super(id, x, y, BOARD_SPACE_WIDTH, BOARD_SPACE_HEIGHT, path)
        self.cell_x = x
        self.cell_y = y

        @path = path if !path.nil?
    end

    def cell_x=(n)
        if not n.nil?
            @cell_x = n % BOARD_COLS
            @x = @cell_x * BOARD_SPACE_WIDTH + BOARD_LEFT
        end
        @cell_x
    end
    def cell_y=(n)
        if not n.nil?
            @cell_y = n % BOARD_ROWS
            @y = @cell_y * BOARD_SPACE_HEIGHT + BOARD_TOP
        end
        @cell_y
    end
end

