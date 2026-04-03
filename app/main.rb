
require "app/board_base"


PIECE_IMGS = [
    "sprites/pieces/char0.png",
    "sprites/pieces/char1.png"
]


class Piece < BoardPieceEntity
    def initialize id, x, y
        super(id, x, y, PIECE_IMGS[id % 2])
    end

    def update scene, args
        super(scene, args)
        return if args.state.tick_count % 20 != 0

        d = (@id / 4).floor()
        if @id % 2 == 0
            self.cell_x = self.cell_x + d
            self.cell_y = self.cell_y + 1
        else
            self.cell_x = self.cell_x + 1
            self.cell_y = self.cell_y + d
        end
    end
end

class MainScene < Scene
    def initialize args
        super(args)

        initialize_entities
    end

    def initialize_entities
        r = []
        16.times do |i|
            r << Piece.new(i, i, i)
        end
        @entities = r
    end

    def update_bg args
        args.outputs.background_color = BOARD_BG
    end
end


def tick args
    World.init MainScene, args

    World.update args
end
